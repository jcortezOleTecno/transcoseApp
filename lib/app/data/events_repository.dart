import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';

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
}
