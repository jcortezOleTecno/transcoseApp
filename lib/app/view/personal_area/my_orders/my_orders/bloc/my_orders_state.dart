import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/warranty.dart';

part 'my_orders_state.freezed.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    @Default(false) bool loading,
    @Default(<Warranty>[]) List<Warranty> guarantee,
    @Default(<Albaran>[]) List<Albaran> albaranes,
  }) = _MyOrdersState;
  const MyOrdersState._();
}
