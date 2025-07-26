import 'dart:convert';
import 'dart:developer';

import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/model/albaran_motivos.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/detail_event.dart';
import 'package:vemare/app/domain/model/expedition.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/intervencion_detalle.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/domain/model/modelo_347.dart';
import 'package:vemare/app/domain/model/trainings_event.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';

class MyAccountRepository {
  final MyApiClient _apiClient;

  MyAccountRepository(this._apiClient);

  Future<AnswerWithFilters> getMyOrders({Map<String,dynamic>? filter}) async {

    DateTime date30 = DateTime.now().add(const Duration(days: -30));
    DateTime date = DateTime.now();

    String date30St = '${date30.day.toString().padLeft(2,'0')}/${date30.month.toString().padLeft(2,'0')}/${date30.year} 00:00:00';
    String dateSt = '${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year} 00:00:00';
    if(filter != null){
      date30 = filter['start_date'];
      date = filter['end_date'];
      date30St = '${date30.day.toString().padLeft(2,'0')}/${date30.month.toString().padLeft(2,'0')}/${date30.year}';
      dateSt = '${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year}';
    }
    try{
      final dynamic res = await _apiClient.postRequest('$BASE_API_URL/api/mi-cuenta/pedidos_isi'
          ,body: {'start_date' : date30St,'end_date' : dateSt});
      return AnswerWithFilters(
        data: (res["data"]["status"] as bool)
            ? (res["data"]["datos"]["albaranes"] as List).map(AlbaranISI.fromJson).toList()
            : <AlbaranISI>[],
        filter: res["filters"],
      );
    }catch(e){
      log('message ${e.toString()}');
    }
    return AnswerWithFilters(
      filter: '',
      data: [],
      totalImporteCliente: 0,
      totalImporteGarantia: 0,
      totalImporteVemare: 0,
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
        filter: res['filters'],
        totalImporteCliente:
            res["data"]["datos"]["total_importe_cliente"] as int?,
        totalImporteVemare:
            res["data"]["datos"]["total_importe_vemare"] as int?,
        totalImporteGarantia:
            res["data"]["datos"]["total_importe_garantias"] as int?,
      );
    } catch (e) {
      return AnswerWithFilters(data: []);
    }
  }


  Future<bool> postSendOrder({required Map<String,dynamic> body}) async {
    bool result = false;
    try {
      await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/mis_devoluciones/guardar_pedido',
          body: jsonEncode(body));
      result = true;
    } catch (e) {
      result = false;
    }
    return result;
  }

  Future<List<AlbaranMotivos>> getMotivosAlbaranes() async {

    List<AlbaranMotivos> list = [];
    try{
      final dynamic res = await _apiClient.postRequest('$BASE_API_URL/api/mi-cuenta/mis_devoluciones/motivos');
      list = !res["status"] ? [] : (res['estados'] as List).map((e) => AlbaranMotivos.fromJson(e)).toList();
    }catch(e){
      log('message ${e.toString()}');
    }
    return list;
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
      return res["type"] == 'error' ? false : true;
    } catch (e) {
      return false;
    }
  }

  Future<AnswerWithFilters> getMyBills({Filter? filter}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/abonos',
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

  Future<List<Modelo347>> getMy347({String? year}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/mis347',
          body: {"year": year ?? "2021"});
      return (res["data"] as List).map(Modelo347.fromJson).toList();
    } catch (e) {
      return [];
    }
  }

  Future<AnswerWithFilters> getMySAT({Filter? filter}) async {
    try {
      final dynamic res = await _apiClient.postRequest(
          '$BASE_API_URL/api/mi-cuenta/sat',
          body: filter?.toJson());
      if (res["data"] == null) {
        return AnswerWithFilters(
            data: (res["datos"]["intervenciones"] as List)
                .map(Intervenciones.fromJson)
                .toList());
      } else {
        return AnswerWithFilters(
            data: (res["data"]["datos"]["intervenciones"] as List)
                .map(Intervenciones.fromJson)
                .toList(),
            filter: res["filters"]);
      }
    } catch (e) {
      return AnswerWithFilters(data: []);
    }
  }

  Future<IntervencionesDetalle> getMySATDetails(
      {required String codigoIntervencion}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/sat/detalle',
        body: {"codigo_intervencion": codigoIntervencion});
    return IntervencionesDetalle.fromJson(res["intervencion"]);
  }

  Future<List<TrainingsEvents>> getTrainingsEvents({Filter? filter}) async {
    try {
      final dynamic res = await _apiClient.getRequest(
          '$BASE_API_URL/api/eventos/formacionesEventos',
          params: filter?.toJson());
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

  Future<DetailEvent> getDetail(
      {required String id, required String type}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/eventos/formacionesEventos/detalles',
        params: {"id": id, "type": type});
    return DetailEvent.fromJson(res);
  }

  Future<void> cancelRegistration({required String id}) async {
    await _apiClient.postRequest(
        '$BASE_API_URL/api/eventos/formacionesEventos/cancelar',
        body: {"id": id});
  }
}
