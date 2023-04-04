import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/center.dart';

class CenterRepository {
  final MyApiClient _apiClient;

  CenterRepository(this._apiClient);

  Future<List<Center>> getCenters({required int limit}) async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/centros',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(Center.fromJson).toList();
  }
}
