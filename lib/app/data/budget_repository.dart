import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';

class BudgetRepository {
  final MyApiClient _apiClient;

  BudgetRepository(this._apiClient);

  Future<List<Budget>> getBudget(
      {String? startDate = '', String? endDate = ''}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/presupuestos',
        body: <String, dynamic>{'start_date': startDate, 'end_date': endDate});
    return (res['presupuestos'] as List).map(Budget.fromJson).toList();
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
}
