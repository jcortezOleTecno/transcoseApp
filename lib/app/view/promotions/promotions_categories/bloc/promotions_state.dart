import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/domain/model/promotion.dart';

part 'promotions_state.freezed.dart';

@freezed
class PromotionsState with _$PromotionsState {
  const factory PromotionsState({
    @Default(<Category>[]) List<Category> categories,
    Category? categorySelected,
    String? query,
    @Default(<Promotion>[]) List<Promotion> promotions,
    Header? header,
  }) = _PromotionsState;
  const PromotionsState._();
}
