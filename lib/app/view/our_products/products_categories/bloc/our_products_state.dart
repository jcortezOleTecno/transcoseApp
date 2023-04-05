import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/category.dart';

part 'our_products_state.freezed.dart';

@freezed
class OurProductsState with _$OurProductsState {
  const factory OurProductsState({
    @Default(<Category>[]) List<Category> categories,
    @Default(false) bool loading,
    Category? category,
    String? query,
  }) = _OurProductsState;
  const OurProductsState._();
}
