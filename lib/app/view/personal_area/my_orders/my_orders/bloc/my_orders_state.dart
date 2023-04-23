import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';

part 'my_orders_state.freezed.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    @Default(false) bool loading,
    @Default(<Warranty>[]) List<Warranty> guarantee,
    @Default(<Albaran>[]) List<Albaran> orders,
    @Default(<Albaran>[]) List<Albaran> bills,
    StatusWarranty? statusWarranty,
    String? filterPedidos,
    String? filterGarantias,
    String? filterAbonos,
  }) = _MyOrdersState;
  const MyOrdersState._();
}
