import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/shopping_card_product.dart';

part 'shopping_cart_state.freezed.dart';

@freezed
class ShoppingCardState with _$ShoppingCardState {
  const factory ShoppingCardState({
    @Default(false) bool loading,
    @Default(false) bool deleting,
    @Default(false) bool buying,
    @Default(false) bool isCard,
    @Default(false) bool typePaySelected,
    @Default(0.0) double total,
    @Default(<ShoppingCardProduct>[]) List<ShoppingCardProduct> products,
  }) = _ShoppingCardState;
  const ShoppingCardState._();
}
