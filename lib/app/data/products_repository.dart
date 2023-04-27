import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';

class ProductsRepository {
  final MyApiClient _apiClient;

  ProductsRepository(this._apiClient);

  Future<List<Category>> getProductsCategories({int limit = 0}) async {
    try {
      final dynamic res = await _apiClient.getRequest(
          '$BASE_API_URL/api/productos',
          params: <String, dynamic>{'limit': '$limit'});
      return (res as List).map(Category.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<CategoryDetail> getCategoryDetail(
      {String? id, String search = ''}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/productos/detalle',
        params: <String, dynamic>{'category_id': '$id', 'search': search});
    return CategoryDetail.fromJson(res);
  }
}
