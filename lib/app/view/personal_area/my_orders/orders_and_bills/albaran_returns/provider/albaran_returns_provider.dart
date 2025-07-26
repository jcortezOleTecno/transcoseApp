import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_motivos.dart';

class AlbaranReturnsProvider with ChangeNotifier{

  AlbaranReturnsProvider({required this.repository, required Map<String,dynamic> data}){
    initial(data: data);
  }

  final MyAccountRepository repository;

  bool _loadData = false;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  late int _motivoSelected;
  int get motivoSelected => _motivoSelected;
  set motivoSelected(int value){ _motivoSelected = value; notifyListeners(); }

  List<AlbaranISI> orders = [];
  List<AlbaranMotivos> albaranMotivos = [];
  Map<String,bool> statePedidosSelected = {};
  Map<String,dynamic> ordersReturns = {};
  Map<String,dynamic> ordersAlbaranReturns = {};
  List<String> deleteKeys = [];

  Future initial({required Map<String,dynamic> data}) async {

    orders = data['orders'];
    albaranMotivos = data['albaranMotivos'];
    statePedidosSelected = data['statePedidosSelected'];

    if(albaranMotivos.isNotEmpty){
      motivoSelected = albaranMotivos[0].code;
    }

    await getOrders();

    notifyListeners();
  }

  Future getOrders() async{
    for (var order in orders) {
      for (var product in order.lineas) {
        if(statePedidosSelected['${order.albaran}${product.referencia}']!){
          ordersReturns['${order.albaran}${product.referencia}'] = {
            'albaran' : order.albaran,
            'cant' : product.cantidadTotal,
            'cantTotal' : product.cantidadTotal,
            'producto' : product.referencia,
          };
          if(albaranMotivos.isNotEmpty){
            ordersReturns['${order.albaran}${product.referencia}']['motivo'] = albaranMotivos[0].code;
          }
          ordersAlbaranReturns[order.albaran] = order;
        }
      }
    }
    notifyListeners();
  }

  changeCode({required String key, required int code}){
    ordersReturns[key]['motivo'] = code;
    notifyListeners();
  }

  changeAllCode({required int code}){
    ordersReturns.forEach((key, value) {
      ordersReturns[key]['motivo'] = code;
    });
    notifyListeners();
  }

  changeCant({required String key, required int cant}){
    ordersReturns[key]['cant'] = cant;
    notifyListeners();
  }

  Future deleteKey({required String key}) async {
    deleteKeys.add(key);
    notifyListeners();
  }

  Future<bool> sendData({required String comment, required String address}) async{

    bool res = false;
    try{
      List<Map<String,dynamic>> listRef = [];
      ordersReturns.forEach((key, value) {
        listRef.add({
          'referencia' : value['producto'],
          'albaran' : value['albaran'],
          'cantidad' : value['cant'],
          'motivo_devolucion' : value['motivo'],
        });
      });
      Map<String,dynamic> body = {
        'direccion_recogida' : address,
        'notas_recogida' : comment,
        'referencias' : listRef,
      };

      res = await repository.postSendOrder(body: body);
    }catch(_){}

    return res;
  }

}