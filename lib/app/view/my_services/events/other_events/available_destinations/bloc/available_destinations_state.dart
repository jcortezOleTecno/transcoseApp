import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/locations.dart';

part 'available_destinations_state.freezed.dart';

@freezed
class AvailableDestinationsState with _$AvailableDestinationsState {
  const factory AvailableDestinationsState({
    Events? event,
    @Default(false) bool loading,
    @Default(<Locations>[]) List<Locations> location,
  }) = _AvailableDestinationsState;
  const AvailableDestinationsState._();
}
