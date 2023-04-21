import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';

import '../domain/model/filter.dart';

class BudgetRepository {
  final MyApiClient _apiClient;

  BudgetRepository(this._apiClient);

  Future<List<Budget>> getBudget({
    Filter? filter,
  }) async {
    print(filter?.toJson());
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/presupuestos',
        body: filter?.toJson());
    print(res);
    return (res['data']['presupuestos'] as List).map(Budget.fromJson).toList();
  }

  Future<BudgetDetail> getBudgetDetail({
    required String numeroProyecto,
    required String codigoPresupuesto,
  }) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/presupuestos/detalle',
        body: <String, dynamic>{
          'numero_proyecto': numeroProyecto,
          'codigo_presupuesto': codigoPresupuesto
        });
    print(res);
    return BudgetDetail.fromJson(res['presupuesto']);
  }

  Future<bool> signBudget({
    required String numeroProyecto,
    required String codPresupuesto,
    required String persona,
    required String nif,
    required String firma,
  }) async {
    try {
      final body = <String, dynamic>{
        "numero_proyecto": numeroProyecto,
        "codigo_presupuesto": codPresupuesto,
        "firma_personaquefirma": persona,
        "nif_personaquefirma": nif,
        "firma_cliente": firma,
      };
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/presupuestos/firmar',
          body: body);
      return res["type"] == 'error' ? false : true;
    } catch (e) {
      print('ERROR $e');
      return false;
    }
  }
}
