import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/model/albaran_motivos.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty/my_data_warranty.dart';

import '../orders_and_bills/my_data_orders.dart';
import 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(
    this._myAccountRepository,
  ) : super(const MyOrdersState()) {
    fetchData();
  }

  final MyAccountRepository _myAccountRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true,));

    List<AlbaranISI> orders = [];
    List<Warranty> guarantee = [];
    List<AlbaranISI> bills = [];
    List<AlbaranMotivos> albaranMotivos = [];
    StatusWarranty? status;
    int? totalImporteVemare;
    int? totalImporteCliente;
    int? totalImporteGarantias;

    // await Future.wait([
    //   // _myAccountRepository.getMyOrders().then((v) => orders.addAll(v.data as List<AlbaranISI>)),
    //   // _myAccountRepository.getWarranties().then((v) {
    //   //   guarantee.addAll(v.data as List<Warranty>);
    //   //   totalImporteVemare = v.totalImporteVemare;
    //   //   totalImporteCliente = v.totalImporteCliente;
    //   //   totalImporteGarantias = v.totalImporteGarantia;
    //   // }),
    //   // _myAccountRepository.getMyBills().then((v) {
    //   //   bills.addAll(v.data as List<AlbaranISI>);
    //   // }),
    //   // _myAccountRepository.getStatusWarranty().then((value) => status = value),
    // ]);

    try{
      albaranMotivos = await _myAccountRepository.getMotivosAlbaranes();
    }catch(e){
      log(e.toString());
    }

    try{
      AnswerWithFilters v = await _myAccountRepository.getMyOrders();
      orders.addAll(v.data as List<AlbaranISI>);
    }catch(e){
      log(e.toString());
    }

    try{
      AnswerWithFilters warran = await _myAccountRepository.getWarranties();
      guarantee.addAll(warran.data as List<Warranty>);
      totalImporteVemare = warran.totalImporteVemare;
      totalImporteCliente = warran.totalImporteCliente;
      totalImporteGarantias = warran.totalImporteGarantia;
    }catch(e){
      log(e.toString());
    }

    try{
      AnswerWithFilters v = await _myAccountRepository.getMyBills();
      bills.addAll(v.data as List<AlbaranISI>);
    }catch(e){
      log(e.toString());
    }

    try{
      StatusWarranty v = await _myAccountRepository.getStatusWarranty();
      status = v;
    }catch(e){
      log(e.toString());
    }


    Map<String,bool> statePedidosSelected = {};
    Map<String,bool> statePedidosOpen = {};

    Map<String,List<LineasAlbaran>>? ordersDetails = {};
    if(orders.isNotEmpty){
      for (var element in orders) {
        statePedidosOpen[element.albaran] = false;
        ordersDetails[element.albaran] = element.lineas;
        for (var lineaElement in element.lineas) {
          statePedidosSelected['${element.albaran}${lineaElement.referencia}'] = false;
        }
      }
    }

    emit(state.copyWith(
      orders: orders,
      guarantee: guarantee,
      bills: bills,
      statusWarranty: status,
      totalImporteCliente: totalImporteCliente,
      totalImporteVemare: totalImporteVemare,
      totalImporteGarantias: totalImporteGarantias,
      dataPedidos: MyDataOrders(orders, 'pedido'),
      dataPedidosFiltrado: MyDataOrders(orders, 'pedido'),
      dataGarantias: MyDataWarranty(guarantee),
      dataGarantiasFiltrado: MyDataWarranty(guarantee),
      dataAbonos: MyDataOrders(bills, 'abono'),
      dataAbonosFiltrado: MyDataOrders(bills, 'abono'),
      loading: false,
      statePedidosSelected: statePedidosSelected,
      statePedidosOpen: statePedidosOpen,
      ordersDetails: ordersDetails,
      albaranMotivos: albaranMotivos,
      endDate: DateTime.now(),
      startDate: DateTime.now().add(const Duration(days: -30)),
      pageController: PageController(initialPage: 0,viewportFraction: 0.4),
      controllerText: TextEditingController(),
      scrollController : ScrollController(),
      currentPage: 0,
    ));
  }

  Future<void> getMyOrders({Map<String,dynamic>? filter}) async {

    if(filter == null){
      emit(state.copyWith( loading: true, ));
    }else{
      emit(state.copyWith(
        startDate: filter['start_date'],
        endDate: filter['end_date'],
        loading: true,
      ));
    }


    var data = await _myAccountRepository.getMyOrders(filter: filter);
    List<AlbaranISI> orders = [];
    Map<String,bool> statePedidosSelected = {};
    Map<String,bool> statePedidosOpen = {};
    Map<String,List<LineasAlbaran>>? ordersDetails = {};

    try{
      orders.addAll(data.data as List<AlbaranISI>);
      if(orders.isNotEmpty){
        for (var element in orders) {
          statePedidosOpen[element.albaran] = false;
          ordersDetails[element.albaran] = element.lineas;
          for (var lineaElement in element.lineas) {
            statePedidosSelected['${element.albaran}${lineaElement.referencia}'] = false;
          }
        }
      }
    }catch(e){
      log('message');
    }


    emit(state.copyWith(
      orders: orders,
      loading: false,
      dataPedidos: MyDataOrders((orders), 'pedido'),
      dataPedidosFiltrado: MyDataOrders((orders), 'pedido'),
      statePedidosSelected: statePedidosSelected,
      statePedidosOpen: statePedidosOpen,
      ordersDetails: ordersDetails,
    ));
  }

  void changeSelected({required String key, bool isCabecera = false, bool valueCab = false}){
    final updatedMap = Map<String, bool>.from(state.statePedidosSelected!);
    if(isCabecera){
      for (var element in state.ordersDetails![key]!) {
        updatedMap['$key${element.referencia}'] = valueCab;
      }
    }else{
      updatedMap[key] = !state.statePedidosSelected![key]!;
    }

    int cant = 0;
    bool selectedAlbaran = false;

    updatedMap.forEach((key, value) {
      if(value){ cant++; }
    });

    emit(state.copyWith(
      statePedidosSelected: updatedMap,
      selectedAlbaran: selectedAlbaran,
      cantSelectedAlbaran: cant,
    ));
  }

  void changeOpen({required String key}){
    final updatedMap = Map<String, bool>.from(state.statePedidosOpen!);
    updatedMap[key] = !state.statePedidosOpen![key]!;


    emit(state.copyWith(
      statePedidosOpen: updatedMap
    ));
  }

  void changePage({required int page}){
    emit(state.copyWith(
      currentPage: page,
    ));
  }

  void changeTextField({required String value}){
    emit(state.copyWith(
      controllerText: TextEditingController(text: value),
    ));
  }

  Future<void> getMyWarranty({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filterGarantias: null));
    var data = await _myAccountRepository.getWarranties(filter: filter);
    emit(state.copyWith(
      guarantee: data.data as List<Warranty>,
      filterGarantias: reset ? null : data.filter,
      totalImporteCliente: data.totalImporteCliente,
      totalImporteVemare: data.totalImporteVemare,
      totalImporteGarantias: data.totalImporteGarantia,
      dataGarantias: MyDataWarranty(data.data as List<Warranty>),
      dataGarantiasFiltrado: MyDataWarranty(data.data as List<Warranty>),
      loading: false,
    ));
  }

  Future<void> getMyBills({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filterAbonos: null));
    var data = await _myAccountRepository.getMyBills(filter: filter);
    emit(state.copyWith(
      bills: data.data as List<AlbaranISI>,
      loading: false,
      filterAbonos: reset ? null : data.filter,
      dataAbonos: MyDataOrders((data.data as List<AlbaranISI>), 'abono'),
      dataAbonosFiltrado: MyDataOrders((data.data as List<AlbaranISI>), 'abono'),
    ));
  }

  void filtroPedidos(String value) {
    emit(
      state.copyWith(
        ordersFilter: state.orders.where((e) {
          return e.toFilter().toLowerCase().contains(value.trim().toLowerCase());
        }).toList(),
        filterPedidos: value.isEmpty ? null : value,
      ),
    );
  }

  void filtroPedidos2(String? value) {
    emit(
      state.copyWith(
        dataPedidosFiltrado: MyDataOrders(
            state.orders.where((e) {
              return e
                  .toFilter()
                  .toLowerCase()
                  .contains(value!.trim().toLowerCase());
            }).toList(),
            'pedido'),
      ),
    );
  }

  void filtroGarantia(String? value) {
    emit(
      state.copyWith(
        dataGarantiasFiltrado: MyDataWarranty(
          state.guarantee.where((e) {
            return e
                .toFilter()
                .toString()
                .toLowerCase()
                .contains(value!.trim().toLowerCase());
          }).toList(),
        ),
      ),
    );
  }

  void filtroAbono(String? value) {
    emit(
      state.copyWith(
        dataAbonosFiltrado: MyDataOrders(
            state.bills.where((e) {
              return e
                  .toFilter()
                  .toString()
                  .toLowerCase()
                  .contains(value!.trim().toLowerCase());
            }).toList(),
            'abono'),
      ),
    );
  }

  void changeDate({required DateTime date, required bool isStar}) {
    if(isStar){
      emit(state.copyWith(startDate: date),);
    }else{
      emit(state.copyWith(endDate: date),);
    }
  }
}
