import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/promotion.dart';

class PromotionRepository {
  final MyApiClient _apiClient;

  PromotionRepository(this._apiClient);

  Future<List<Category>> getPromocionesCategories({int limit = 0}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/promociones/categorias',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(Category.fromJson).toList();
  }

  Future<List<Promotion>> getPromociones(
      {int categotyId = 0, String search = ''}) async {
    final dynamic res = await _apiClient.getRequest(
      '$BASE_API_URL/api/promociones',
      params: <String, dynamic>{'category_id': '$categotyId', 'search': search},
    );
    return (res as List).map(Promotion.fromJson).toList();
  }
}
