import 'dart:convert';
import 'dart:developer';

import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/sat_forms.dart';

import '_api_classes.dart';
import '_base_api_url.dart';

class SatRepository {
  final MyApiClient _apiClient;

  SatRepository(this._apiClient);

  Future<List<SatForms>> getSatForms() async {
    final cliente = LocalDataRepository().user?.code;
    try {
      final dynamic res = await _apiClient.getRequest(
          '$BASE_API_URL/api/formularios_sat',
          params: <String, dynamic>{'cliente': cliente});
      log(jsonEncode(res));
      return (res as List).map(SatForms.fromJson).toList();
    } catch (e) {
      return <SatForms>[];
    }
  }

  Future<String> sendSatForms(Map<String, dynamic> data) async {
    final dynamic res = await _apiClient
        .postRequest('$BASE_API_URL/api/formularios_sat/enviar', body: data);
    return (res['mensaje'] as String);
  }

  Future<List<String>> diasOcupados() async {
    List<dynamic> res =
        await _apiClient.getRequest('$BASE_API_URL/api/dias_ocupados_sat');
    return res.cast<String>().toList();
  }
}
