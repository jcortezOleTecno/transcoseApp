import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/shopping_card_product.dart';

class ShoppingCardRepository {
  final MyApiClient _apiClient;

  ShoppingCardRepository(this._apiClient);

  Future<List<ShoppingCardProduct>> getProducts() async {
    final dynamic res = await _apiClient
        .getRequest('$BASE_API_URL/api/promociones/listado_carrito');
    print(res);
    return (res as List).map(ShoppingCardProduct.fromJson).toList();
  }

  Future<String?> shoppingDelete({required int id}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/promociones/shoppingDelete',
        body: <String, dynamic>{"id": id.toString()});
    return res["message"];
  }

  Future<String?> shoppingAdd(
      {required int id, required int quantity, required int renting}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/promociones/shoppingAdd',
        body: <String, dynamic>{
          "productId": id.toString(),
          "quantity": quantity.toString(),
          "renting": renting.toString(),
        });
    return res["message"];
  }
}
