import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/domain/model/notification.dart';

import '_base_api_url.dart';
import 'dart:developer';

class NotificationsRepository {
  final MyApiClient _apiClient;

  NotificationsRepository(this._apiClient);

  Future<List<Notification>> getNotifications({
    String visto = '',
    int delete = 0,
    String? limit,
    String? tipo,
  }) async {
    List<Notification> data = [];
    dynamic res;
    try{
      res = await _apiClient.getRequest(
          '$BASE_API_URL/api/notificaciones',
          params: <String, dynamic>{
            'visto': visto,
            'delete': delete.toString(),
            'tipo': tipo ?? '',
            'limit': limit ?? '',
          });
      //data = (res['data'] as List).map(Notification.fromJson).toList();
      data = (res as List).map(Notification.fromJson).toList();
    }catch(e){
      log('Error: ${e.toString()}');
    }
    return data;
  }

  Future<void> deleteNotification({required String id}) async {
    await _apiClient.getRequest('$BASE_API_URL/api/notificaciones/delete',
        params: <String, dynamic>{'id': id});
  }

  Future<void> marckReadNotification({required String id}) async {
    await _apiClient.getRequest('$BASE_API_URL/api/notificaciones/status',
        params: <String, dynamic>{'id': id});
  }
}
