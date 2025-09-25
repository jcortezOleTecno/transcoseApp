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

  int? _motivoSelected;
  int? get motivoSelected => _motivoSelected;
  set motivoSelected(int? value){ _motivoSelected = value; notifyListeners(); }

  String _text1Comment = '';
  String get text1Comment => _text1Comment;
  set text1Comment(String value){ _text1Comment = value; notifyListeners();}

  String _text2Comment = '';
  String get text2Comment => _text2Comment;
  set text2Comment(String value){ _text2Comment = value; notifyListeners();}

  List<AlbaranISI> orders = [];
  List<AlbaranMotivos> albaranMotivos = [];
  Map<String,bool> statePedidosSelected = {};
  Map<String,dynamic> ordersReturns = {};
  Map<String,dynamic> ordersAlbaranReturns = {};
  List<String> deleteKeys = [];
  Map<String,LineasAlbaran> productWithCasco = {};

  Future initial({required Map<String,dynamic> data}) async {

    orders = data['orders'];
    albaranMotivos = data['albaranMotivos'];
    statePedidosSelected = data['statePedidosSelected'];

    // if(albaranMotivos.isNotEmpty){
    //   motivoSelected = albaranMotivos[0].code;
    // }

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
            'descripcion' : product.description,
            'alb_pb' : order.albPb,
            'motivo' : null,
          };
          // if(albaranMotivos.isNotEmpty){
          //   ordersReturns['${order.albaran}${product.referencia}']['motivo'] = albaranMotivos[0].code;
          // }
          ordersAlbaranReturns[order.albaran] = order;
        }

        //verificar que tenga casco
        for (var productLinea in order.lineas){
          if(productLinea.referencia.contains('CV') || productLinea.referencia.contains('CN')){
            if(productLinea.referencia.replaceAll('CV', '').replaceAll('CN', '') == product.referencia){
              productWithCasco[product.referencia] = productLinea;
            }
          }
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

    if(key.length > 3 && (key.substring((key.length - 2),(key.length)) == 'CN' || key.substring((key.length - 2),(key.length)) == 'CV')){
      bool exists = false;
      String newKey = '';
      ordersReturns.forEach((key2,value2){
        if(value2['producto'] == ordersReturns[key]['producto'].toString().replaceAll('CN', '').replaceAll('CV', '')){
          exists = true; newKey = key2;
        }
      });
      if(exists){
        deleteKey(key: newKey);
      }
    }
  }

  Future<Map<String,dynamic>> sendData({required String comment, required String address}) async{

    Map<String,dynamic> res = { 'result' : false, 'error' : ''};
    try{
      bool notComplet = false;
      ordersReturns.forEach((key, value) {
        if(value['motivo'] == null){
          notComplet = true;
        }
      });

      if(!notComplet){
        //Verificar si hay un casco
        String refCasco = '';
        ordersReturns.forEach((key, value) {
          if((value['producto'].substring((value['producto'].length - 2),(value['producto'].length)) == 'CN' || value['producto'].substring((value['producto'].length - 2),(value['producto'].length)) == 'CV')){
            refCasco = value['producto'];
          }
        });
        bool exists = false;
        if(refCasco.isNotEmpty){
          ordersReturns.forEach((key, value) {
            if(refCasco.toString().replaceAll('CN', '').replaceAll('CV', '') == value['producto']){
              exists = true;
            }
          });
        }

        List<Map<String,dynamic>> listRef = [];
        ordersReturns.forEach((key, value) {
          String ref = value['producto'];
          if(!exists && refCasco.isNotEmpty && ref == refCasco){
            ref = ref.replaceAll('CN', 'CV');
          }

          listRef.add({
            'referencia' : ref,
            'albaran' : value['albaran'],
            'cantidad' : value['cant'],
            'motivo_devolucion' : value['motivo'],
            'descripcion' : value['descripcion']
          });
        });
        Map<String,dynamic> body = {
          'direccion_recogida' : address,
          'notas_recogida' : comment,
          'referencias' : jsonEncode(listRef) ,
        };

        res = await repository.postSendOrder(body: body);
      }else{
        res = { 'result' : false, 'error' : 'Todos los productos deben tener un motivo de devolución.'};
      }
    }catch(_){}

    return res;
  }

}