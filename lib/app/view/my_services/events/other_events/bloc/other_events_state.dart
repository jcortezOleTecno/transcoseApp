import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/header_events_held.dart';

part 'other_events_state.freezed.dart';

@freezed
class OtherEventsState with _$OtherEventsState {
  const factory OtherEventsState({
    @Default(false) bool loading,
    @Default(<Events>[]) List<Events> events,
    HeaderEvents? header,
  }) = _OtherEventsState;
  const OtherEventsState._();
}
