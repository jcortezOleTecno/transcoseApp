import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';

import '../domain/model/filter.dart';
import 'local_data_repository.dart';

class BudgetRepository {
  final MyApiClient _apiClient;

  BudgetRepository(this._apiClient);

  Future<AnswerWithFilters> getBudget({
    Filter? filter,
  }) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/presupuestos',
        body: filter?.toJson());
    return AnswerWithFilters(
      filter: res["filters"],
      data: (res['data']['presupuestos'] as List).map(Budget.fromJson).toList(),
    );
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
      log('ERROR $e');
      return false;
    }
  }

  Future<void> downloadPdfBudget({
    required String codBudget,
    required String numeroProyecto,
    required String name,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res =
        await Dio().post('$BASE_API_URL/api/mi-cuenta/presupuestos/imprimir',
            data: {
              "codigo_presupuesto": codBudget,
              "numero_proyecto": numeroProyecto,
            },
            options: Options(headers: {'Authorization': 'Bearer $token'}));

    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/$name');
    await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    await OpenFile.open(file.path);
  }
}
