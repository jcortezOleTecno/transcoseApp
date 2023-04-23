// import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/contract_detail.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contract_pmp_detail.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/model/contrats.dart';

import '../domain/model/filter.dart';
import '_api_classes.dart';
import '_base_api_url.dart';

class ContratsRepository {
  final MyApiClient _apiClient;

  ContratsRepository(this._apiClient);

  Future<AnswerWithFilters> getContratsCRD({
    Filter? filter,
  }) async {
    final dynamic res = await _apiClient.postRequest(
      '$BASE_API_URL/api/mi-cuenta/contratos_crd',
      body: filter?.toJson(),
    );
    print(res);
    return AnswerWithFilters(
      data: (res["data"]["contratos_crd"] as List)
          .map(Contrats.fromJson)
          .toList(),
      filter: res["filters"],
    );
  }

  Future<ContratDetail> getContratDetail(
      {required String numeroProyecto, required String codigoContrato}) async {
    final body = {
      "numero_proyecto": numeroProyecto,
      "codigo_contrato": codigoContrato
    };
    final dynamic res = await _apiClient.postRequest(
      '$BASE_API_URL/api/mi-cuenta/contratos_crd/detalle',
      body: body,
    );
    return ContratDetail.fromJson(res["contrato_crd"]);
  }

  Future<bool> signCRD({
    required String numeroProyecto,
    required String codigoContrato,
    required String name,
    required String nif,
    required String signature,
  }) async {
    final body = {
      "numero_proyecto": numeroProyecto,
      "codigo_contrato": codigoContrato,
      "firma_personaquefirma": name,
      "nif_personaquefirma": nif,
      "firma_cliente": signature,
    };
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_crd/firmar',
        body: body,
      );
      return res["type"] == 'error' ? false : true;
    } catch (e) {
      return false;
    }
  }

  Future<ContratoMillenium?> getContratMill({String? anio}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_mll',
        body: <String, dynamic>{"year": anio ?? DateTime.now().year.toString()},
      );
      print(res);
      return ContratoMillenium.fromJson(res["contrato_mll"]);
    } catch (e) {
      return null;
    }
  }

  Future<bool> signMill({
    required String codigoContrato,
    required String name,
    required String nif,
    required String signature,
  }) async {
    final body = {
      "codigo_contrato": codigoContrato,
      "firma_personaquefirma": name,
      "nif_personaquefirma": nif,
      "firma_cliente": signature,
    };
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_mll/firmar',
        body: body,
      );
      return res["type"] == 'error' ? false : true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ContratoPmp>> getContratsPMP({Filter? filter}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_pmp',
        body: filter?.toJson(),
      );
      print(res);
      return (res["contratos_pmp"] as List).map(ContratoPmp.fromJson).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<ContratoRappel?> getContratReppel({String? anio}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_rappel',
        body: <String, dynamic>{"year": anio ?? ''},
      );
      print(res);
      return ContratoRappel.fromJson(res["contrato_rappel"]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> signRappel({
    required String codigoContrato,
    required String name,
    required String nif,
    required String signature,
  }) async {
    final body = {
      "codigo_contrato": codigoContrato,
      "firma_personaquefirma": name,
      "nif_personaquefirma": nif,
      "firma_cliente": signature,
    };
    print(body);
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_rappel/firmar',
        body: body,
      );
      return res["type"] == 'error' ? false : true;
    } catch (e) {
      return false;
    }
  }

  Future<ContratPmpDetail> getContratPmpDetail(
      {required String codigoContrato}) async {
    final body = {"codigo_contrato": codigoContrato};
    final dynamic res = await _apiClient.postRequest(
      '$BASE_API_URL/api/mi-cuenta/contratos_pmp/detalle',
      body: body,
    );
    return ContratPmpDetail.fromJson(res["contrato"]);
  }

  Future<void> downloadPdfCrd(
      {required String codContrato, required String numProyecto}) async {
    final token = LocalDataRepository().authToken;
    final Response res = await Dio().post(
        '$BASE_API_URL/api/mi-cuenta/contratos_crd/imprimir',
        data: {"codigo_contrato": codContrato, "numero_proyecto": numProyecto},
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/contrato_$codContrato.pdf');
    await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfPmp(
      {required String codContrato, required String codDocumento}) async {
    final token = LocalDataRepository().authToken;
    final Response res = await Dio().post(
        '$BASE_API_URL/api/mi-cuenta/contratos_pmp/imprimir',
        data: {
          "codigo_contrato": codContrato,
          "codigo_documento": codDocumento
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/contrato_$codContrato.pdf');
    await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfMill({
    required String anio,
    required String codContrato,
    required String codDocumento,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res = await Dio().post(
        '$BASE_API_URL/api/mi-cuenta/contratos_mll/imprimir',
        data: {
          "anio": anio,
          "codigo_contrato": codContrato,
          "codigo_documento": codContrato
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/contrato_$codContrato.pdf');
    await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    await OpenFile.open(file.path);
  }
}
