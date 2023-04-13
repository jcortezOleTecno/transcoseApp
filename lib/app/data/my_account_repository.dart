import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';

class MyAccountRepository {
  final MyApiClient _apiClient;

  MyAccountRepository(this._apiClient);

  Future<List<Warranty>> getWarranties(
      {String? startDate = '', String? endDate = ''}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/garantias',
          body: <String, dynamic>{
            'start_date': startDate,
            'end_date': endDate
          });
      return (res["datos"]["garantias"] as List)
          .map(Warranty.fromJson)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Albaran>> getMyOrders(
      {String? startDate, String? endDate}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/pedidos',
          body: <String, dynamic>{
            'start_date': startDate ?? '01/01/${DateTime.now().year - 1}',
            'end_date': endDate ?? '01/01/${DateTime.now().year}',
          });
      return (res["datos"]["albaranes"] as List).map(Albaran.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<AlbaranDetails>> getOrderDetail(
      {required String contador,
      required String documento,
      required String ejercicio,
      required String tipoAlbaran}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/pedidos/detalle',
          body: <String, dynamic>{
            'contador': contador,
            'documento': documento,
            'ejercicio': ejercicio,
            'tipo_albaran': tipoAlbaran,
          });
      return (res["datos"]["filas"] as List)
          .map(AlbaranDetails.fromJson)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<WarrantyDetailModel> getWarrantyDetail(
      {required String codigoGarantia}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/garantias/detalle',
        body: <String, dynamic>{'codigo_garantia': codigoGarantia});
    return WarrantyDetailModel.fromJson(res["garantia"]);
  }
}
