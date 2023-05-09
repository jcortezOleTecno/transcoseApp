import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/domain/model/notification.dart';

import '_base_api_url.dart';

class NotificationsRepository {
  final MyApiClient _apiClient;

  NotificationsRepository(this._apiClient);

  Future<List<Notification>> getNotifications({
    String visto = '',
    int delete = 0,
    String? limit,
    String? tipo,
  }) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/notificaciones',
        params: <String, dynamic>{
          'visto': visto,
          'delete': delete.toString(),
          'tipo': tipo ?? '',
          'limit': limit ?? '',
        });
    return (res as List).map(Notification.fromJson).toList();
  }

  Future<void> deleteNotification({required String id}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/notificaciones/delete',
        params: <String, dynamic>{'id': id});
    print(res);
  }

  Future<void> marckReadNotification({required String id}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/notificaciones/status',
        params: <String, dynamic>{'id': id});
    print(res);
  }
}
