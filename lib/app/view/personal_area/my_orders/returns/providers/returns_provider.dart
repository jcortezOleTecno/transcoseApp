// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';

class ReturnsProvider with ChangeNotifier{

  ReturnsProvider(this._contratsRepository,this.contextReturns){
    initialData();
  }

  final ContratsRepository _contratsRepository;
  final BuildContext contextReturns;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  FilterReturns filter = FilterReturns();

  List<ReturnsModel> listReturns = [];
  List<ReturnsStatusModel> listStatusReturns = [];
  List<String> listSituaReturns = [];

  DataTableSource? dataPedidosFiltrado;

  Future initialData() async {

    loadData = true;

    listReturns = await _contratsRepository.getMisDevoluciones(filter: filter);

    dataPedidosFiltrado = MyDataReturns(data: listReturns,context: contextReturns);

    listStatusReturns = await _contratsRepository.getMisDevolucionesEstados();

    listSituaReturns = await _contratsRepository.getMisDevolucionesSituaciones();

    loadData = false;
    notifyListeners();
  }

  void filtroReturns(String? value) {

    if(value != null && value.isNotEmpty){
      dataPedidosFiltrado = MyDataReturns(data: listReturns.where((element){
        return element
            .toFilter()
            .toLowerCase()
            .contains(value.trim().toLowerCase());
      }).toList(),context: contextReturns);
    }else{
      dataPedidosFiltrado = MyDataReturns(data: listReturns,context: contextReturns);
    }

    notifyListeners();
  }

  Future filterReturnsHttp({required FilterReturns filterWidget}) async{

    loadData = true;

    filter = filterWidget;

    listReturns = await _contratsRepository.getMisDevoluciones(filter: filter);

    dataPedidosFiltrado = MyDataReturns(data: listReturns,context: contextReturns);

    notifyListeners();

    loadData = false;
  }

  String getDataFilter({required String value}) {
    String result = '';

    if(value == 'Fecha desde hasta'){ result = '${DateFormat.yMd('es').format(filter.startDate!)} - ${DateFormat.yMd('es').format(filter.endDate!)}'; }
    if(value == 'Fecha desde'){ result = DateFormat.yMd('es').format(filter.startDate!); }
    if(value == 'Fecha hasta'){ result = DateFormat.yMd('es').format(filter.endDate!); }
    if(value == 'Por Mes'){ result = filter.mes ?? ''; }
    if(value == 'Por año'){ result = filter.anio ?? ''; }
    if(value == 'Por trimestre'){ result = filter.quarter.toString(); }
    if(value == 'Por referencia'){ result = filter.referencia ?? ''; }
    if(value == 'Por situación'){ result = filter.situacion ?? ''; }

    if(value == 'Por estado'){
      for (var element in listStatusReturns) {
        if(element.codigoEstado.toString() == filter.estado){
          result = element.nombre!;
        }
      }
    }

    return result;
  }

  void setValueDataFilter({required String value}) {
    if(value == 'Fecha desde hasta'){ filter.startDate = null; filter.endDate = null; }
    if(value == 'Fecha desde'){ filter.startDate = null; }
    if(value == 'Fecha hasta'){ filter.endDate = null; }
    if(value == 'Por Mes'){ filter.mes = null; }
    if(value == 'Por año'){ filter.anio = null; }
    if(value == 'Por trimestre'){ filter.quarter = null; }
    if(value == 'Por referencia'){ filter.referencia = null; }
    if(value == 'Por situación'){ filter.situacion = null; }
    if(value == 'Por estado'){ filter.estado = null; }
    notifyListeners();
    filterReturnsHttp(filterWidget: filter);
  }

}