import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/events.dart';

part 'other_events_state.freezed.dart';

@freezed
class OtherEventsState with _$OtherEventsState {
  const factory OtherEventsState({
    @Default(false) bool loading,
    @Default(<Events>[]) List<Events> events,
  }) = _OtherEventsState;
  const OtherEventsState._();
}
