// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';

class ReturnsNewOrdersProvider with ChangeNotifier{

  ReturnsNewOrdersProvider(this._contratsRepository,this.contextReturns){
    initialData();
  }

  final ContratsRepository _contratsRepository;
  final BuildContext contextReturns;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  FilterReturns filter = FilterReturns();

  Future initialData() async {


    loadData = false;
    notifyListeners();
  }

}