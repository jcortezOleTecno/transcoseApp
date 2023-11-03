import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_conventions.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/conventions.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';

class ReturnsProvider with ChangeNotifier{

  ReturnsProvider(this._contratsRepository){
    initialData();
  }

  final ContratsRepository _contratsRepository;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  Filter? filter;

  List<ReturnsModel> listReturns = [];
  List<ReturnsStatusModel> listStatusReturns = [];
  List<String> listSituaReturns = [];

  DataTableSource? dataPedidosFiltrado;

  Future initialData() async {

    listReturns = await _contratsRepository.getMisDevoluciones(filter: filter);

    dataPedidosFiltrado = MyDataReturns(data: listReturns);

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
      }).toList());
    }else{
      dataPedidosFiltrado = MyDataReturns(data: listReturns);
    }

    notifyListeners();
  }

}