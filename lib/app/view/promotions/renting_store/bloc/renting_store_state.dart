import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/pay_response.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';

part 'renting_store_state.freezed.dart';

@freezed
class RentingStoreState with _$RentingStoreState {
  const factory RentingStoreState({
    @Default(FormStatus.editing) FormStatus status,
    @Default(true) bool tarjeta,
    StoreArgs? arg,
    String? type,
    PayResponse? payResponse,
  }) = _RentingStoreState;
  const RentingStoreState._();
}
