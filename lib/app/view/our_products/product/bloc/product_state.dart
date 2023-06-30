import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool loading,
    @Default(<Category>[]) List<Category> categories,
    // @Default(<Brand>[]) List<Brand> brands,
    Category? category,
    String? query,
    CategoryDetail? details,
  }) = _ProductState;
  const ProductState._();
}
