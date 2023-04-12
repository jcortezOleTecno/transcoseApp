import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/warranty.dart';

part 'my_orders_state.freezed.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    @Default(false) bool loading,
    @Default(<Warranty>[]) List<Warranty> guarantee,
  }) = _MyOrdersState;
  const MyOrdersState._();
}
