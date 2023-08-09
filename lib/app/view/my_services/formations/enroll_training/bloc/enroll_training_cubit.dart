import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_state.dart';

class EnrollTrainingCubit extends Cubit<EnrollTrainingState> {
  EnrollTrainingCubit(
    this._formationsRepository,
  ) : super(const EnrollTrainingState());

  final FormationsRepository _formationsRepository;

  Future<void> enrullFormation({
    required int id,
    required List<int> idsEmployees,
    required List<Employee> persons,
  }) async {
    try {
      await _formationsRepository.enrollFormations(
          dateId: id, idsEmployees: idsEmployees, persons: persons);
    } catch (e) {
      log(e.toString());
    }
  }
}
