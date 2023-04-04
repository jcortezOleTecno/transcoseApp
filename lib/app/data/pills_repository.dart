import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/pills.dart';

class PillsRepository {
  final MyApiClient _apiClient;

  PillsRepository(this._apiClient);

  Future<List<Pills>> getPills({required int limit}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/pildoras',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(Pills.fromJson).toList();
  }
}
