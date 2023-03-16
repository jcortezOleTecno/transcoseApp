import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/product.dart';

class ProductsRepository {
  final MyApiClient _apiClient;

  ProductsRepository(this._apiClient);

  Future<List<Product>> getProducts() async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/productos',
        params: <String, dynamic>{'limit': '6'});
    return (res as List).map(Product.froJson).toList();
  }
}
