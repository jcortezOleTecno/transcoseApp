import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/expedition.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/intervencion_detalle.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/domain/model/modelo_347.dart';
import 'package:vemare/app/domain/model/sat.dart';
import 'package:vemare/app/domain/model/trainings_event.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';

class MyAccountRepository {
  final MyApiClient _apiClient;

  MyAccountRepository(this._apiClient);

  Future<AnswerWithFilters> getMyOrders({Filter? filter}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/pedidos',
        body: filter?.toJson() ?? {"anio": DateTime.now().year.toString()});
    return AnswerWithFilters(
      data: (res["data"]["status"] as bool)
          ? (res["data"]["datos"]["albaranes"] as List)
              .map(Albaran.fromJson)
              .toList()
          : <Albaran>[],
      filter: res["filters"],
    );
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

  Future<AnswerWithFilters> getWarranties({Filter? filter}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/garantias',
          body: filter?.toJson());
      return AnswerWithFilters(
          data: (res["data"]["datos"]["garantias"] as List)
              .map(Warranty.fromJson)
              .toList(),
          filter: res['filters']);
    } catch (e) {
      return AnswerWithFilters(data: []);
    }
  }

  Future<WarrantyDetailModel> getWarrantyDetail(
      {required String codigoGarantia}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/garantias/detalle',
        body: <String, dynamic>{'codigo_garantia': codigoGarantia});
    return WarrantyDetailModel.fromJson(res["garantia"]);
  }

  Future<bool> signWarranty(
      {required String codigoGarantia,
      required String persona,
      required String nif,
      required String firma}) async {
    final body = {
      'codigo_garantia': codigoGarantia,
      'firma_personaquefirma': persona,
      'nif_personaquefirma': nif,
      'firma_cliente': firma
    };
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/garantias/firmar',
          body: body);
      print(res);
      return res["type"] == 'error' ? false : true;
    } catch (e) {
      return false;
    }
  }

  Future<AnswerWithFilters> getMyBills({Filter? filter}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/abonos',
        body: filter?.toJson() ?? {"anio": DateTime.now().year.toString()});
    print(res);
    return AnswerWithFilters(
      data: (res["data"]["status"] as bool)
          ? (res["data"]["datos"]["albaranes"] as List)
              .map(Albaran.fromJson)
              .toList()
          : <Albaran>[],
      filter: res["filters"],
    );
  }

  Future<List<Modelo347>> getMy347({String? year}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/mis347',
          body: {"year": year ?? "2021"});
      print(res);
      return (res["data"] as List).map(Modelo347.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Intervenciones>> getMySAT({Filter? filter}) async {
    print(filter?.toJson());
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/sat',
          body: filter?.toJson());
      print(res);
      return (res["datos"]["intervenciones"] as List)
          .map(Intervenciones.fromJson)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<IntervencionesDetalle> getMySATDetails(
      {required String codigoIntervencion}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/sat/detalle',
        body: {"codigo_intervencion": codigoIntervencion});
    print(res);
    return IntervencionesDetalle.fromJson(res["intervencion"]);
  }

  Future<List<TrainingsEvents>> getTrainingsEvents({Filter? filter}) async {
    try {
      final dynamic res = await _apiClient.getRequest(
          '$BASE_API_URL/api/eventos/formacionesEventos',
          params: filter?.toJson());
      print(res);
      print('##############');
      return (res["data"] as List).map(TrainingsEvents.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<StatusWarranty> getStatusWarranty() async {
    final dynamic res = await _apiClient
        .postRequest('$BASE_API_URL/api/mi-cuenta/garantias/estados');
    return StatusWarranty.fromJson(res);
  }

  Future<Expedicion> getExpeditionPedidos({
    required String contador,
    required String documento,
    required String ejercicio,
  }) async {
    final dynamic res = await _apiClient
        .postRequest('$BASE_API_URL/api/mi-cuenta/pedidos/expedicion', body: {
      "contador": contador,
      "documento": documento,
      "ejercicio": ejercicio,
    });
    return Expedicion.fromJson(res["data"]);
  }

  Future<Expedicion> getExpeditionAbonos({
    required String contador,
    required String documento,
    required String ejercicio,
  }) async {
    final dynamic res = await _apiClient
        .postRequest('$BASE_API_URL/api/mi-cuenta/abonos/expedicion', body: {
      "contador": contador,
      "documento": documento,
      "ejercicio": ejercicio,
    });
    return Expedicion.fromJson(res["data"]);
  }
}
