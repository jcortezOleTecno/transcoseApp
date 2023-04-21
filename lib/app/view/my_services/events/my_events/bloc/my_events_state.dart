import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/my_event.dart';

part 'my_events_state.freezed.dart';

@freezed
class MyEventsState with _$MyEventsState {
  const factory MyEventsState({
    @Default(false) bool loading,
    @Default(<MyEvents>[]) List<MyEvents> eventsVemare,
  }) = _MyEventsState;
  const MyEventsState._();
}
