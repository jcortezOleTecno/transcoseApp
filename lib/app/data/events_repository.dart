import 'dart:convert';

import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';

import '../domain/model/employee.dart';
import '../domain/model/my_event.dart';
import '_api.dart';

class EventsRepository {
  final MyApiClient _apiClient;

  EventsRepository(this._apiClient);

  Future<List<EventsVemare>> getEventsVemare() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/eventos_vemare');
    return (res as List).map(EventsVemare.fromJson).toList();
  }

  Future<List<Events>> getEvents() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/eventos');
    return (res as List).map(Events.fromJson).toList();
  }

  Future<List<MyEvents>> getMyEvents() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/eventos/mis_eventos');
    return (res as List).map(MyEvents.fromJson).toList();
  }

  Future<void> enrollEvents({
    required int eventId,
    required List<int>? idsEmployees,
    List<Employee>? persons,
  }) async {
    final data = {
      'date_id': eventId,
      'employee': idsEmployees?.join(',').toString() ?? "",
      'persons': persons?.map((e) => e.toEnrollData()).toList(),
    };

    await _apiClient.postRequest('$BASE_API_URL/api/eventos/inscripcion',
        body: jsonEncode(data),
        customHeaders: headerContentTypeApplicationJson);
  }
}
