import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/model/albaran_motivos.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';

part 'my_orders_state.freezed.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    @Default(false) bool loading,
    @Default(false) bool selectedAlbaran,
    @Default(0) int cantSelectedAlbaran,
    @Default(<Warranty>[]) List<Warranty> guarantee,
    @Default(<AlbaranISI>[]) List<AlbaranISI> orders,
    @Default(<AlbaranISI>[]) List<AlbaranISI> ordersFilter,
    @Default(<AlbaranISI>[]) List<AlbaranISI> bills,
    @Default(<AlbaranMotivos>[]) List<AlbaranMotivos> albaranMotivos,
    @Default(<String,bool>{})Map<String,bool>? statePedidosSelected,
    @Default(<String,bool>{})Map<String,bool>? statePedidosOpen,
    @Default(<String,bool>{})Map<String,bool>? statePedidosOpenViewMore,
    @Default(<String,List<LineasAlbaran>>{})Map<String,List<LineasAlbaran>>? ordersDetails,

    @Default(0) int currentPage,
    PageController? pageController,
    TextEditingController? controllerText,
    ScrollController? scrollController,

    StatusWarranty? statusWarranty,
    String? filterPedidos,
    String? filterGarantias,
    String? filterAbonos,
    int? totalImporteCliente,
    int? totalImporteGarantias,
    int? totalImporteVemare,
    DataTableSource? dataPedidos,
    DataTableSource? dataPedidosFiltrado,
    DataTableSource? dataGarantias,
    DataTableSource? dataAbonosFiltrado,
    DataTableSource? dataGarantiasFiltrado,
    DataTableSource? dataAbonos,
    DateTime? startDate,
    DateTime? endDate,
  }) = _MyOrdersState;
  const MyOrdersState._();
}
