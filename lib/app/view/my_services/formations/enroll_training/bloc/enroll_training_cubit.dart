import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_cubit.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_state.dart';

class EnrollTrainingCubit extends Cubit<EnrollTrainingState> {
  EnrollTrainingCubit(
    this._formationsRepository,
    Locations locations,
    Formation formation,
  ) : super(EnrollTrainingState(locations: locations, formation: formation)) {
    cargarHorarios();
  }

  final FormationsRepository _formationsRepository;

  Future<void> cargarHorarios() async {
    emit(state.copyWith(loading: true));
    var data = await _formationsRepository.getHorariosFormations(
        state.formation!.id!, state.locations!.location!);
    emit(state.copyWith(horarios: data, loading: false));
  }

  Future<EnrollResponse?> enrullFormation({
    required int id,
    required List<int> idsEmployees,
    required List<Employee> persons,
  }) async {
    try {
      return await _formationsRepository.enrollFormations(
          dateId: id, idsEmployees: idsEmployees, persons: persons);
    } catch (e) {
      log("ERROR ${jsonDecode(e.toString())["message"].toString()}");
      return EnrollResponse(
          false, jsonDecode(e.toString())["message"].toString());
    }
  }

  void showEnrolled(Horario date) {
    state.horarios.firstWhere((e) => e.dateId == date.dateId).isRegistered =
        true;
  }
}
