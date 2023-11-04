// import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/contract_detail.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contract_pmp_detail.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/model/returns_model.dart';

import '../domain/model/contract_conventions.dart';
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
      return ContratoMillenium.fromJson(res["contrato_mll"]);
    } catch (e) {
      return null;
    }
  }

  Future<ContratoConventionsModel?> getContratConventions({String? anio}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_convenciones',
        body: <String, dynamic>{"year": anio ?? DateTime.now().year.toString()},
      );
      return ContratoConventionsModel.fromJson(res["contrato_convencion"]);
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

  Future<bool> signConvencion({required String codigoContrato,required String name,required String nif,required String signature,}) async {
    final body = {
      "codigo_contrato": codigoContrato,
      "firma_personaquefirma": name,
      "nif_personaquefirma": nif,
      "firma_cliente": signature,
    };
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/convencion/firmar',
        body: body,
      );
      log('message');
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
      return (res["contratos_pmp"] as List).map(ContratoPmp.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<ContratoRappel?> getContratReppel({String? anio}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/contratos_rappel',
        body: <String, dynamic>{"year": anio ?? ''},
      );
      return ContratoRappel.fromJson(res["contrato_rappel"]);
    } catch (e) {
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

  Future<void> downloadPdfCrd({
    required String codContrato,
    required String numProyecto,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res =
        await Dio().post('$BASE_API_URL/api/mi-cuenta/contratos_crd/imprimir',
            data: {
              "codigo_contrato": codContrato,
              "numero_proyecto": numProyecto,
              "convert_base64": "1"
            },
            options: Options(headers: {'Authorization': 'Bearer $token'}));
    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/contrato_$codContrato.pdf');
    // await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    List<int> pdfBytes = base64Decode(pdfBase64(res.data["pdf_base64"]));
    await file.writeAsBytes(pdfBytes);
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfPmp({
    required String codContrato,
    required String codDocumento,
    required String name,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res =
        await Dio().post('$BASE_API_URL/api/mi-cuenta/contratos_pmp/imprimir',
            data: {
              "codigo_contrato": codContrato,
              "codigo_documento": codDocumento,
              "convert_base64": "1"
            },
            options: Options(headers: {'Authorization': 'Bearer $token'}));
    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/$name');
    // await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    List<int> pdfBytes = base64Decode(pdfBase64(res.data["pdf_base64"]));
    await file.writeAsBytes(pdfBytes);
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfMill({
    required String anio,
    required String codContrato,
    required String codDocumento,
    required String name,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res =
    await Dio().post('$BASE_API_URL/api/mi-cuenta/contratos_mll/imprimir',
        data: {
          "anio": anio,
          "codigo_contrato": codContrato,
          "codigo_documento": codDocumento,
          "convert_base64": "1"
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/$name');
    // await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    List<int> pdfBytes = base64Decode(pdfBase64(res.data["pdf_base64"]));
    await file.writeAsBytes(pdfBytes);
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfConvenciones({
    required String codContrato,
    required String codDocumento,
    required String name,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res =
    await Dio().post('$BASE_API_URL/api/mi-cuenta/convencion/imprimir',
        data: {
          "codigo_contrato": codContrato,
          "codigo_documento": codDocumento,
          "convert_base64": "1"
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/$name');
    // await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    List<int> pdfBytes = base64Decode(pdfBase64(res.data["pdf_base64"]));
    await file.writeAsBytes(pdfBytes);
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfRappel({
    required String codContrato,
    required String codDocumento,
    required String name,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res = await Dio()
        .post('$BASE_API_URL/api/mi-cuenta/contratos_rappel/imprimir',
            data: {
              "codigo_contrato": codContrato,
              "codigo_documento": codDocumento,
              "convert_base64": "1"
            },
            options: Options(headers: {'Authorization': 'Bearer $token'}));

    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/$name');
    // await file.writeAsBytes(List<int>.from(res.data.codeUnits));
    List<int> pdfBytes = base64Decode(pdfBase64(res.data["pdf_base64"]));
    await file.writeAsBytes(pdfBytes);
    await OpenFile.open(file.path);
  }

  Future<void> downloadPdfRappelDetalles({
    required String codContrato,
    required String name,
  }) async {
    final token = LocalDataRepository().authToken;
    final Response res = await Dio()
        .post('$BASE_API_URL/api/mi-cuenta/contratos_rappel/detalles',
            data: {"codigo_contrato": codContrato, "convert_base64": "1"},
            options: Options(
              headers: {
                // 'Accept': 'application/json',
                'Authorization': 'Bearer $token'
              },
              contentType: 'application/json',
            ));

    final directory = await getApplicationDocumentsDirectory();
    final savedDir = directory.path;
    final file = File('$savedDir/$name');
    // await file.writeAsBytes(List<int>.from(res.data.codeUnits), flush: true);
    List<int> pdfBytes = base64Decode(pdfBase64(res.data["pdf_base64"]));
    await file.writeAsBytes(pdfBytes);
    await OpenFile.open(
      file.path,
    );
  }

  Future<List<ReturnsModel>> getMisDevoluciones({FilterReturns? filter}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/mis_devoluciones',
        body: filter?.toJson(),
        customHeaders: allHeaders
      );
      return (res["data"] as List).map(ReturnsModel.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<ReturnsStatusModel>> getMisDevolucionesEstados() async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/mis_devoluciones/estados',
        customHeaders: allHeaders
      );
      return (res["data"] as List).map(ReturnsStatusModel.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<String>> getMisDevolucionesSituaciones() async {
    try {
      final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/mis_devoluciones/situaciones',
        customHeaders: allHeaders
      );
      return (res["situaciones"] as List).map((e) => e.toString()).toList();
    } catch (e) {
      log('message ${e.toString()}');
      return [];
    }
  }

  Future<Map<String,dynamic>> getDevolucionesDetails({required String code}) async {

    Map<String,dynamic> data = {};
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/mis_devoluciones/detalles',
          body: { 'codigo_devolucion' : code },
          customHeaders: allHeaders
      );
      data['data'] = ReturnsModel.fromJson(res['data']);
      data['items'] = (res["items"] as List).map(ReturnsItemsModel.fromJson).toList();
    } catch (_) {}

    return data;
  }
}

String pdfBase64(String base64) {
  if (base64.length % 4 > 0) {
    return base64 += '=' * (4 - base64.length % 4);
  } else {
    return base64;
  }
}
