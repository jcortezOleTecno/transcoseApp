import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_state.dart';

class EnrollEventCubit extends Cubit<EnrollEventState> {
  EnrollEventCubit(
    this._eventsRepository,
  ) : super(const EnrollEventState(peopleCounter: 5));

  final EventsRepository _eventsRepository;

  Future<EnrollResponse?> enrollEvent({
    required int dateId,
    required List<int> idsEmployees,
    required List<Employee> persons,
  }) async {
    try {
      return await _eventsRepository.enrollEvents(
          dateId: dateId, idsEmployees: idsEmployees, persons: persons);
    } catch (e) {
      log("ERROR ${jsonDecode(e.toString())["message"].toString()}");
      return EnrollResponse(
          false, jsonDecode(e.toString())["message"].toString());
    }
  }
}

class EnrollResponse {
  final bool success;
  final String messaje;

  EnrollResponse(this.success, this.messaje);
}
