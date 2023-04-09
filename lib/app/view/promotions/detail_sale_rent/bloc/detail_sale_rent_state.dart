import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/promotion.dart';

part 'detail_sale_rent_state.freezed.dart';

@freezed
class DetailSaleRentState with _$DetailSaleRentState {
  const factory DetailSaleRentState({
    @Default(false) bool loading,
    @Default(true) bool isTienda,
    @Default(1) int quantity,
    @Default(1) int adds,
    Promotion? promotion,
    String? message,
  }) = _DetailSaleRentState;
  const DetailSaleRentState._();
}
