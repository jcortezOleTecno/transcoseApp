import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/pay_response.dart';
import 'package:vemare/app/domain/model/shopping_card_product.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'shopping_cart_state.freezed.dart';

@freezed
class ShoppingCardState with _$ShoppingCardState {
  const factory ShoppingCardState({
    @Default(false) bool loading,
    @Default(FormStatus.editing) FormStatus status,
    @Default(false) bool deleting,
    @Default(false) bool buying,
    @Default(false) bool isCard,
    @Default(false) bool typePaySelected,
    @Default(0.0) double total,
    @Default(0) int counter,
    @Default(<ShoppingCardProduct>[]) List<ShoppingCardProduct> products,
    PayResponse? payResponse,
  }) = _ShoppingCardState;
  const ShoppingCardState._();
}
