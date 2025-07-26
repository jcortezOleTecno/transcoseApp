import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_conventions.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/conventions.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_details.dart';
import 'package:vemare/app/view/theme/color.dart';

class ReturnsDetailsProvider with ChangeNotifier{

  ReturnsDetailsProvider(this._contratsRepository, {required this.codReturns}){
    initialData();
  }

  final ContratsRepository _contratsRepository;
  final String codReturns;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  ReturnsModel? returnsModel;
  List<ReturnsItemsModel> listReturnsItems = [];
  DataTableSource? dataTable;

  Future initialData() async {

    Map<String,dynamic> data = await _contratsRepository.getDevolucionesDetails(code: codReturns);

    if(data.containsKey('data')){
      returnsModel = data['data'];
    }
    if(data.containsKey('items')){
      listReturnsItems = data['items'];
      dataTable = MyDataReturnsMerchandise(listReturnsItems);
    }

    loadData = false;
    notifyListeners();
  }

  Map<String,String> statusTraduccion = {
    'Pendiente' : 'Solicitada',
    'En Gestión' : 'En gestión',
    'Abonada' : 'Reembolsada',
    'Anulada' : 'Cancelada',
  };
  Map<String,Color> statusColorBg = {
    'Pendiente' : AppColor.statusReturn1,
    'En Gestión' : AppColor.statusReturn2,
    'Abonada' : AppColor.statusReturn3,
    'Anulada' : AppColor.statusReturn4,
  };
  Map<String,Color> statusColorText = {
    'Pendiente' : AppColor.statusReturnText1,
    'En Gestión' : AppColor.statusReturnText2,
    'Abonada' : AppColor.statusReturnText3,
    'Anulada' : AppColor.statusReturnText3,
  };

  void filtroReturns(String? value) {

    if(value != null && value.isNotEmpty){
      dataTable = MyDataReturnsMerchandise(listReturnsItems.where((element){
        return element
            .toFilter()
            .toLowerCase()
            .contains(value.trim().toLowerCase());
      }).toList());
    }else{
      dataTable = MyDataReturnsMerchandise(listReturnsItems);
    }

    notifyListeners();
  }

}