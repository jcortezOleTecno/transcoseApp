// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/albaran_returns_model.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/returns_cart_model.dart';
import 'package:vemare/app/domain/utils/months_list.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_cart.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_new_orders.dart';

class ReturnsNewOrdersProvider with ChangeNotifier{

  ReturnsNewOrdersProvider(this._contratsRepository,this.contextReturns){
    initialData();
  }

  int _typeView = 0;
  int get typeView => _typeView;
  set typeView (int value){ _typeView = value; notifyListeners(); }

  final ContratsRepository _contratsRepository;
  final BuildContext contextReturns;

  BuildContext? _contextProvider;
  BuildContext? get contextProvider => _contextProvider;
  set contextProvider (BuildContext? value) { if(contextProvider == null){
    _contextProvider = value; notifyListeners();
  }}

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  bool _sendData = false;
  bool get sendData => _sendData;
  set sendData(bool value){ _sendData = value; notifyListeners();}

  FilterReturnsNew filter = FilterReturnsNew();
  List<AlbaranReturnsModel> listAlbaran = [];
  DataTableSource? dataNewPedidosFiltrado;

  ReturnsCartModel? carts;
  DataTableSource? dataProductsCarts;

  TextEditingController controllerDate= TextEditingController();
  TextEditingController controllerEntrega = TextEditingController();
  TextEditingController controllerObservaciones = TextEditingController();
  DateTime? _dateSelected;
  DateTime? get dateSelected => _dateSelected;
  set dateSelected(DateTime? value){
    _dateSelected = value;
    controllerDate.text = DateFormat.yMd('es').format(value!);
    notifyListeners();
  }


  Future initialData() async {
    listAlbaran = await _contratsRepository.getMisAlbaran(filter: filter);
    await Future.delayed(const Duration(seconds: 3));
    notifyListeners();
    initialData2();
  }

  Future initialData2() async {

    loadData = true;
    notifyListeners();

    dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran,context: contextReturns,contextProvider: contextProvider!);

    carts = await _contratsRepository.postObtenerCarritoDevolucion();

    if(carts != null){
      dataProductsCarts = MyDataReturnsCart(data: carts!.items!);
    }


    controllerDate= TextEditingController();
    controllerEntrega = TextEditingController();
    controllerObservaciones = TextEditingController();
    dateSelected;

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
      }).toList(),context: contextReturns,contextProvider: contextProvider!);
    }else{
      dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran,context: contextReturns,contextProvider: contextProvider!);
    }

    notifyListeners();
  }

  Future filterReturnsHttp({required FilterReturnsNew filterWidget}) async{

    loadData = true;

    filter = filterWidget;

    listAlbaran = await _contratsRepository.getMisAlbaran(filter: filter);

    dataNewPedidosFiltrado = MyDataReturnsNew(data: listAlbaran,context: contextReturns,contextProvider: contextProvider!);

    notifyListeners();

    loadData = false;
  }

  String getDataFilter({required String value}) {
    String result = '';

    if(value == 'Fecha desde hasta'){ result = '${DateFormat.yMd('es').format(filter.startDate!)} - ${DateFormat.yMd('es').format(filter.endDate!)}'; }
    if(value == 'Fecha desde'){ result = DateFormat.yMd('es').format(filter.startDate!); }
    if(value == 'Fecha hasta'){ result = DateFormat.yMd('es').format(filter.endDate!); }
    if(value == 'Por Mes'){ result = monthsMap[filter.mes] ?? ''; }
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

  Future<bool> sendDataCart() async {
    bool result = false;
    sendData = true;

    try{

      Map<String,dynamic> body = {
        'fecha_solicitud' : '${dateSelected!.year}-${dateSelected!.month.toString().padLeft(2,'0')}-${dateSelected!.day.toString().padLeft(2,'0')}',
        'direccion_recogida' : controllerEntrega.text,
        'notas_recogida' : controllerObservaciones.text,
      };

      result = await _contratsRepository.postRealizarPedido(body: body);
    }catch(_){}

    sendData = false;
    return result;
  }
}