import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/type_of_vehicle.dart';

part 'type_of_vehicle_state.freezed.dart';

@freezed
class TypeOfVehicleState with _$TypeOfVehicleState {
  const factory TypeOfVehicleState({
    @Default(false) bool loading,
    @Default(<TypeOfVehicle>[]) List<TypeOfVehicle> types,
  }) = _TypeOfVehicleState;
  const TypeOfVehicleState._();
}
