import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/observation.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'workshop_networks_state.freezed.dart';

@freezed
class WorkshopNetworksState with _$WorkshopNetworksState {
  const factory WorkshopNetworksState({
    WorkShop? workShop,
    @Default(FormStatus.editing) FormStatus status,
    @Default(<WorkShop>[]) List<WorkShop> workShops,
    Name? name,
    Email? email,
    Phone? phone,
    Observation? observation,
  }) = _WorkshopNetworksState;
  const WorkshopNetworksState._();

  bool get isComplete => name != null && email != null && phone != null;
}
