import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool loading,
    @Default(<Brand>[]) List<Brand> brands,
    Category? category,
    CategoryDetail? details,
  }) = _ProductState;
  const ProductState._();
}
