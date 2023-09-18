import 'dart:convert';

import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/header_events_held.dart';
import 'package:vemare/app/domain/model/locations.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_cubit.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_cubit.dart';

import '../domain/model/employee.dart';
import '../domain/model/my_event.dart';
import '_api.dart';

class EventsRepository {
  final MyApiClient _apiClient;

  EventsRepository(this._apiClient);

  Future<List<EventsHeld>> getEventsVemare() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/eventos_vemare');
    return (res as List).map(EventsHeld.fromJson).toList();
  }

  Future<List<Events>> getEvents() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/eventos');
    return (res as List).map(Events.fromJson).toList();
  }

  Future<HeaderEvents> getHeaderEventsHeld() async {
    final dynamic res = await _apiClient
        .getRequest('$BASE_API_URL/api/header-eventos-celebrados');
    return HeaderEvents.fromJson(res);
  }

  Future<HeaderEvents> getHeaderEventsVemare() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/header-eventos-vemare');
    return HeaderEvents.fromJson(res);
  }

  Future<List<MyEvents>> getMyEvents() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/eventos/mis_eventos');
    return (res as List).map(MyEvents.fromJson).toList();
  }

  Future<EnrollResponse> enrollEvents({
    required int dateId,
    required List<int>? idsEmployees,
    List<Employee>? persons,
  }) async {
    final user = LocalDataRepository().user;

    idsEmployees!.add(user!.id);

    final data = {
      'date_id': dateId,
      'employee': idsEmployees.join(',').toString(),
      'persons': persons?.map((e) => e.toEnrollData()).toList(),
    };

    print(data);

    var res = await _apiClient.postRequest(
        '$BASE_API_URL/api/eventos/inscripcion',
        body: jsonEncode(data),
        customHeaders: headerContentTypeApplicationJson);
    return EnrollResponse(res["response"] == "success", res["message"]);
  }

  Future<List<Locations>> getLocationsEvents(int id) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/eventos/ubicaciones',
        params: {"id": id.toString()});
    return (res["locations"] as List).map(Locations.fromJson).toList();
  }

  Future<CalendarResponse> getHorariosEvents(int id, String location) async {
    final dynamic res = await _apiClient
        .getRequest('$BASE_API_URL/api/eventos/calendario', params: {
      "event_id": id.toString(),
      "location": location,
    });
    return CalendarResponse(
      horarios: (res["data"]["horario"] as List).map(Horario.fromJson).toList(),
      showCalendar: res["data"]["show_calendar"] as bool,
    );
  }
}
