import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';

part 'warranty_details_state.freezed.dart';

@freezed
class WarrantyDetailsState with _$WarrantyDetailsState {
  const factory WarrantyDetailsState({
    @Default(false) bool loading,
    WarrantyDetailModel? details,
    Warranty? warranty,
  }) = _WarrantyDetailsState;
  const WarrantyDetailsState._();
}
