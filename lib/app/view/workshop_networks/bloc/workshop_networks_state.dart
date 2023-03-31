import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'workshop_networks_state.freezed.dart';

@freezed
class WorkshopNetworksState with _$WorkshopNetworksState {
  const factory WorkshopNetworksState({
    WorkShop? workShop,
    @Default(FormStatus.editing) FormStatus status,
    @Default(<WorkShop>[]) List<WorkShop> workShops,
  }) = _WorkshopNetworksState;
  const WorkshopNetworksState._();
}
