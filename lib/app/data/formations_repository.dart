import 'dart:convert';
import 'dart:developer';

import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/formation.dart';

class FormationsRepository {
  final MyApiClient _apiClient;

  FormationsRepository(this._apiClient);

  Future<List<Formations>> getFormations() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/formaciones');
    return (res as List).map(Formations.fromJson).toList();
  }

  Future<void> enrollFormations({
    required int dateId,
    List<int>? idsEmployees,
    List<Employee>? persons,
  }) async {
    final data = {
      'date_id': dateId,
      'employee': idsEmployees?.join(',').toString() ?? "",
      'persons': persons?.map((e) => e.toEnrollData()).toList(),
    };

    log(jsonEncode(data));

    await _apiClient.postRequest('$BASE_API_URL/api/formaciones/inscripcion',
        body: jsonEncode(data),
        customHeaders: headerContentTypeApplicationJson);
  }
}
