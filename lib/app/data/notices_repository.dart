import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/notices.dart';

class NoticesRepository {
  final MyApiClient _apiClient;

  NoticesRepository(this._apiClient);

  Future<List<News>> getNotices({int limit = 0}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/noticias',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(News.froJson).toList();
  }
}
