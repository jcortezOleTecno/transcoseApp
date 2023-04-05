import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/category.dart';

class ProductsRepository {
  final MyApiClient _apiClient;

  ProductsRepository(this._apiClient);

  Future<List<Category>> getProductsCategories({int limit = 0}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/productos',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(Category.fromJson).toList();
  }
}
