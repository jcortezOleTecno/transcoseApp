import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';

part 'events_vemare_state.freezed.dart';

@freezed
class EventsVemareState with _$EventsVemareState {
  const factory EventsVemareState({
    @Default(false) bool loading,
    @Default(<EventsVemare>[]) List<EventsVemare> eventsVemare,
  }) = _EventsVemareState;
  const EventsVemareState._();
}
