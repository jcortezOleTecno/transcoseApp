import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/services.dart';

class ServicesRepository {
  final MyApiClient _apiClient;

  ServicesRepository(this._apiClient);

  Future<List<Services>> getServices({int limit = 0}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/servicios',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(Services.froJson).toList();
  }
}
