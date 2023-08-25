import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';

part 'available_destinations_formations_state.freezed.dart';

@freezed
class AvailableDestinationsFormationsState
    with _$AvailableDestinationsFormationsState {
  const factory AvailableDestinationsFormationsState({
    @Default(false) bool loading,
    @Default(<Locations>[]) List<Locations> location,
    Formation? formation,
  }) = _AvailableDestinationsFormationsState;
  const AvailableDestinationsFormationsState._();
}
