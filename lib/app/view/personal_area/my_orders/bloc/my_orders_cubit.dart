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

  Future<void> fetchData({bool isReset = false}) async {

    DateTime? dateEnd;
    DateTime? dateStar;
    String filt = '';
    int curr = 0;
    if(isReset){
      dateEnd = state.endDate;
      dateStar = state.startDate;
      filt = state.filterPedidos ?? '';
      curr = state.currentPage;

      emit(state.copyWith(loading: true,cantSelectedAlbaran: 0,));
    }else{
      emit(state.copyWith(loading: true,
        currentPage: 0,
        pageController: PageController(initialPage: 0,viewportFraction: 0.4),
        controllerText: TextEditingController(),));
    }

    List<AlbaranISI> orders = [];
    List<Warranty> guarantee = [];
    List<AlbaranISI> bills = [];
    List<AlbaranMotivos> albaranMotivos = [];
    StatusWarranty? status;
    int? totalImporteVemare;
    int? totalImporteCliente;
    int? totalImporteGarantias;

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
      statePedidosOpenViewMore: statePedidosOpen,
      ordersDetails: ordersDetails,
      albaranMotivos: albaranMotivos,
      endDate: DateTime.now(),
      startDate: DateTime.now().add(const Duration(days: -30)),
    ));

    if(isReset){
      await getMyOrders(filter: {'start_date' : dateStar, 'end_date' : dateEnd});
      filtroPedidos(filt);
      changePage(page: curr);
      emit(state.copyWith(
        controllerText: TextEditingController(text: filt),
      ));
      await Future.delayed(const Duration(seconds: 2));
      state.pageController!.jumpToPage(curr);
    }
  }

  Future<void> getMyOrders({Map<String,dynamic>? filter}) async {


    if(filter == null){
      emit(state.copyWith( loading: true, ));
    }else{
      DateTime startDate = filter['start_date'];
      DateTime endDate = filter['end_date'];

      if(startDate.isAfter(endDate)){
        filter['end_date'] = startDate;
      }else if(endDate.isBefore(startDate)){
        filter['start_date'] = endDate;
      }

      emit(state.copyWith(
        startDate: filter['start_date'],
        endDate: filter['end_date'],
        loading: true,
      ));
      if(filter.containsKey('currentPage')){
        emit(state.copyWith(
            currentPage: filter['currentPage']
        ));
      }
    }


    var data = await _myAccountRepository.getMyOrders(filter: filter);
    List<AlbaranISI> orders = [];
    Map<String,bool> statePedidosSelected = {};
    Map<String,bool> statePedidosOpen = {};
    Map<String,List<LineasAlbaran>>? ordersDetails = {};

    try{
      List<AlbaranISI> ordersAux = [];
      ordersAux.addAll(data.data as List<AlbaranISI>);

      for (var element in ordersAux) {
        bool isAdd = true;
        if(state.startDate != null && state.endDate == null && element.fecha.isBefore(state.startDate!)){
          isAdd = false;
        }else if(state.startDate == null && state.endDate != null && element.fecha.isAfter(state.endDate!)){
          isAdd = false;
        } else if(state.startDate != null && state.endDate != null && (element.fecha.isBefore(state.startDate!) || element.fecha.isAfter(state.endDate!))){
          isAdd = false;
        }
        if(isAdd){
          orders.add(element);
        }
        // if(element.albaran.contains('41861')){
        //   log('message');
        // }
        // for(LineasAlbaran albaranElement in element.lineas){
        //   if(albaranElement.referencia.contains('CV') || albaranElement.referencia.contains('CN')){
        //     log('message');
        //   }
        // }
      }

      //orders.addAll(data.data as List<AlbaranISI>);
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
      log('message ${e.toString()}');
    }


    emit(state.copyWith(
      orders: orders,
      loading: false,
      dataPedidos: MyDataOrders((orders), 'pedido'),
      dataPedidosFiltrado: MyDataOrders((orders), 'pedido'),
      statePedidosSelected: statePedidosSelected,
      statePedidosOpen: statePedidosOpen,
      statePedidosOpenViewMore: statePedidosOpen,
      ordersDetails: ordersDetails,
    ));

    if(state.filterPedidos != null){
      emit(state.copyWith( loading: true, ));
      filtroPedidos(state.filterPedidos ?? '');
    }
  }

  void changeSelected({required String key, bool isCabecera = false, bool valueCab = false, required String albaran, required String ref, bool isCasco = false}){
    final updatedMap = Map<String, bool>.from(state.statePedidosSelected!);
    bool isNewValue = false;
    if(isCabecera){
      for (var element in state.ordersDetails![key]!) {
        updatedMap['$key${element.referencia}'] = valueCab;
      }
    }else{
      if(isCasco){
        updatedMap[key] = valueCab;
      }else{
        updatedMap[key] = !state.statePedidosSelected![key]!;
      }
      isNewValue = updatedMap[key]!;
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

    if(albaran.isNotEmpty && ref.isNotEmpty){
      List<LineasAlbaran> listA = state.ordersDetails![albaran] ?? [];
      bool exist = false;
      String newRef = '';
      bool isCas = false;
      for (var action in listA) {
        if((ref.contains('CN') || ref.contains('CN')) && (ref.replaceAll('CN','') == action.referencia ||
            ref.replaceAll('CN','') == action.referencia) && updatedMap['$albaran${action.referencia}']!){
          exist = true; newRef = action.referencia;
          // if(ref.contains(action.referencia) && action.referencia != ref){
          //   exist = true; newRef = action.referencia;
          // }
        }else{
          if(action.referencia == '${ref}CV' || action.referencia == '${ref}CN' && action.cantidadTotal > 0){
            exist = true; newRef = action.referencia;
            isCas = true;
          }
        }
      }
      if(exist){
        changeSelected(key: '$albaran$newRef',albaran: '',ref: '',valueCab: isNewValue,isCasco: isCas);
        //cubit.changeSelected(key: '$albaranId${albaranDetails.referencia}',albaran: albaranId,ref: albaranDetails.referencia);
      }
    }
  }

  void changeOpen({required String key}){
    final updatedMap = Map<String, bool>.from(state.statePedidosOpen!);
    updatedMap[key] = !state.statePedidosOpen![key]!;


    emit(state.copyWith(
        statePedidosOpen: updatedMap
    ));
  }

  void changeOpenMore({required String key}){
    final updatedMap = Map<String, bool>.from(state.statePedidosOpenViewMore!);
    updatedMap[key] = !state.statePedidosOpenViewMore![key]!;


    emit(state.copyWith(
        statePedidosOpenViewMore: updatedMap
    ));
  }

  void changePage({required int page}){
    emit(state.copyWith(
      currentPage: page,
    ));
  }

  void changeTextField({required String value}){
    filtroPedidos(value);
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
    Map<String,bool> statePedidosOpenViewMore = {};
    Map<String,bool> statePedidosOpen = {};
    try{
      if(state.orders.isNotEmpty){
        for (var element in state.orders) {
          statePedidosOpen[element.albaran] = false;
          statePedidosOpenViewMore[element.albaran] = false;
        }
      }
    }catch(e){
      log('message');
    }

    List<AlbaranISI> resultAlbISi = [];
    if(value.isEmpty){
      resultAlbISi = state.orders.map((toElement) => toElement).toList();
    }else{
      for (var albaran in state.orders){
        bool albaranMatches = albaran.albaran.toLowerCase().trim().contains(value.toLowerCase().trim());
        List<LineasAlbaran> matchedIsiItems = [];
        for (var isiItem in albaran.lineas) {
          bool isiItemMatches = isiItem.ean.toLowerCase().trim().contains(value.toLowerCase().trim()) ||
              isiItem.referencia.toLowerCase().trim().contains(value.toLowerCase().trim()) ||
              isiItem.description.toLowerCase().trim().contains(value.toLowerCase().trim()) ||
              isiItem.refss.toLowerCase().trim().contains(value.toLowerCase().trim());

          if (isiItemMatches) {
            matchedIsiItems.add(isiItem);
          }
        }
        if (albaranMatches || matchedIsiItems.isNotEmpty) {
          resultAlbISi.add(albaran);
        }
        if(matchedIsiItems.isNotEmpty){
          statePedidosOpen[albaran.albaran] = true;
        }
      }
    }

    emit(
      state.copyWith(
        ordersFilter: resultAlbISi,
        filterPedidos: value.isEmpty ? null : value,
        statePedidosOpen: statePedidosOpen,
        statePedidosOpenViewMore: statePedidosOpenViewMore,
        currentPage: 0,
        loading: false,
      ),
    );

    // emit(
    //   state.copyWith(
    //     ordersFilter: state.orders.where((e) {
    //       return e.toFilter().toLowerCase().contains(value.trim().toLowerCase());
    //     }).toList(),
    //     filterPedidos: value.isEmpty ? null : value,
    //   ),
    // );
  }

  // void filtroPedidos2(String? value) {
  //   emit(
  //     state.copyWith(
  //       dataPedidosFiltrado: MyDataOrders(
  //           state.orders.where((e) {
  //             return e
  //                 .toFilter()
  //                 .toLowerCase()
  //                 .contains(value!.trim().toLowerCase());
  //           }).toList(),
  //           'pedido'),
  //     ),
  //   );
  // }

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
      emit(state.copyWith(startDate: date,currentPage: 0),);
    }else{
      emit(state.copyWith(endDate: date,currentPage: 0),);
    }
  }

  Future resetSelected() async{
    Map<String,bool> statePedidosSelected = {};
    Map<String,bool> statePedidosOpen = {};
    try{
      if(state.orders.isNotEmpty){
        for (var element in state.orders) {
          statePedidosOpen[element.albaran] = false;
          for (var lineaElement in element.lineas) {
            statePedidosSelected['${element.albaran}${lineaElement.referencia}'] = false;
          }
        }
      }
    }catch(e){
      log('message');
    }
    emit(state.copyWith(
      loading: false,
      statePedidosSelected: statePedidosSelected,
      statePedidosOpen: statePedidosOpen,
      statePedidosOpenViewMore: statePedidosOpen,
      cantSelectedAlbaran: 0,
    ));
  }
}
