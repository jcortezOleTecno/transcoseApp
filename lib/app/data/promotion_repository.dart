import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/promotion.dart';

class PromotionRepository {
  final MyApiClient _apiClient;

  PromotionRepository(this._apiClient);

  Future<List<Promotion>> getPromociones() async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/promociones',
        params: <String, dynamic>{'limit': '6'});
    return (res as List).map(Promotion.froJson).toList();
  }
}
