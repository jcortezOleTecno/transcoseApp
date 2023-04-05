import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/promotion.dart';

part 'promotion_state.freezed.dart';

@freezed
class PromotionState with _$PromotionState {
  const factory PromotionState({
    @Default(<Promotion>[]) List<Promotion> promotions,
    @Default(<Category>[]) List<Category> categories,
    @Default(false) bool loading,
    Category? category,
    Category? categoryTemp,
    String? query,
  }) = _PromotionState;
  const PromotionState._();
}
