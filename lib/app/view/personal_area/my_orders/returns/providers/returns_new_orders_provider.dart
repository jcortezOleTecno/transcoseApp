// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/albaran_returns_model.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_new_orders.dart';

class ReturnsNewOrdersProvider with ChangeNotifier{

  ReturnsNewOrdersProvider(this._contratsRepository,this.contextReturns){
    initialData();
  }

  final ContratsRepository _contratsRepository;
  final BuildContext contextReturns;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  FilterReturnsNew filter = FilterReturnsNew();
  List<AlbaranReturnsModel> listAlbaran = [];

  DataTableSource? dataNewPedidosFiltrado;


  Future initialData() async {

    listAlbaran = await _contratsRepository.getMisAlbaran(filter: filter);

    dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran,context: contextReturns);

    loadData = false;
    notifyListeners();
  }

  void filtroReturns(String? value) {

    if(value != null && value.isNotEmpty){
      dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran.where((element){
        return element
            .toFilter()
            .toLowerCase()
            .contains(value.trim().toLowerCase());
      }).toList(),context: contextReturns);
    }else{
      dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran,context: contextReturns);
    }

    notifyListeners();
  }

  Future filterReturnsHttp({required FilterReturnsNew filterWidget}) async{

    loadData = true;

    filter = filterWidget;

    listAlbaran = await _contratsRepository.getMisAlbaran(filter: filter);

    dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran,context: contextReturns);

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
    notifyListeners();
    filterReturnsHttp(filterWidget: filter);
  }



}