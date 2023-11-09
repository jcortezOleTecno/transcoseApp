// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/albaran_product_model.dart';
import 'package:vemare/app/domain/model/albaran_returns_model.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_albaran_details.dart';

class ReturnsDetilsAlbaranProvider with ChangeNotifier{

  ReturnsDetilsAlbaranProvider(this._contratsRepository,this.contextReturns, this.albaranReturnsModel){
    initialData();
  }

  final ContratsRepository _contratsRepository;
  final BuildContext contextReturns;
  final AlbaranReturnsModel albaranReturnsModel;

  BuildContext? _contextProvider;
  BuildContext? get contextProvider => _contextProvider;
  set contextProvider (BuildContext? value) { if(contextProvider == null){
    _contextProvider = value; notifyListeners();
  }}

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  bool _sendCart = false;
  bool get sendCart => _sendCart;
  set sendCart(bool value){ _sendCart = value; notifyListeners();}

  bool _checkAccepted = true;
  bool get checkAccepted => _checkAccepted;
  set checkAccepted(bool value){ _checkAccepted = value; notifyListeners();}

  List<AlbaranProductModel> listProducts = [];

  DataTableSource? dataProductAlbaranFiltrado;

  Map<String,bool> checkData = {};


  Future initialData() async {
    listProducts = await _contratsRepository.getMisAlbaranProducts(codAlbaran: albaranReturnsModel.codigoAlbaran.toString());
    await Future.delayed(const Duration(seconds: 3));
    notifyListeners();
    initialData2();
  }

  Future initialData2() async {

    for (var element in listProducts) {
      checkData[element.referencia!] = false;
    }

    dataProductAlbaranFiltrado = MyDataReturnsProductsAlbaran(context: contextProvider,data: listProducts);

    loadData = false;
    notifyListeners();
  }

  void updateMapCheck({required String key}){
    checkData[key] = !checkData[key]!;
    dataProductAlbaranFiltrado = MyDataReturnsProductsAlbaran(context: contextProvider,data: listProducts);

    checkAccepted = true;
    checkData.forEach((key, value) {
      if(value){ checkAccepted = false; }
    });

    notifyListeners();
  }

  void filtroReturns(String? value) {

    if(value != null && value.isNotEmpty){
      dataProductAlbaranFiltrado = MyDataReturnsProductsAlbaran(data: listProducts.where((element){
        return element
            .toFilter()
            .toLowerCase()
            .contains(value.trim().toLowerCase());
      }).toList(),context: contextProvider!);
    }else{
      dataProductAlbaranFiltrado = MyDataReturnsProductsAlbaran(context: contextProvider!,data: listProducts);
    }

    notifyListeners();
  }

  Future<bool> addProductCart({required List<AlbaranProductModel> newList}) async{

    sendCart = true;

    String listRefe = '[';
    String listDes = '[';
    String listCant = '[';
    String listAlba = '[';

    for(int x = 0; x < newList.length; x++){
      listRefe = '$listRefe"${newList[x].referencia!}"';
      listDes = '$listDes"${newList[x].descripcion!}"';
      listCant = '$listCant"${newList[x].cantidad!}"';
      listAlba = '$listAlba"${newList[x].albaran!}"';

      if((x + 1) ==  newList.length){
        listRefe = '$listRefe]';
        listDes = '$listDes]';
        listCant = '$listCant]';
        listAlba = '$listAlba]';
      }else{
        listRefe = '$listRefe,';
        listDes = '$listDes,';
        listCant = '$listCant,';
        listAlba = '$listAlba,';
      }
    }

    log(listAlba.toString());

    Map<String,dynamic> body = {
      'codigo_albaran' : albaranReturnsModel.codigoAlbaran.toString(),
      'referencias' : listRefe,
      'descripciones' : listDes,
      'cantidades' : listCant,
      'albaranes' : listAlba,
    };

    bool result = await _contratsRepository.postAgregarProductoDevolucion(body: body);

    sendCart = false;

    return result;
  }


}