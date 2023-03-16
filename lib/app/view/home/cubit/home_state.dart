import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/product.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/domain/model/workshop.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLogged,
    @Default(false) bool loading,
    @Default(<Promotion>[]) List<Promotion> promotions,
    @Default(<Product>[]) List<Product> products,
    @Default(<Services>[]) List<Services> services,
    @Default(<WorkShop>[]) List<WorkShop> workshop,
    @Default(<Notices>[]) List<Notices> notices,
    UserData? user,
  }) = _HomeState;
  const HomeState._();
}
