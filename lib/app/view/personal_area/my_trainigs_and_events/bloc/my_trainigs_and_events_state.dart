import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/trainings_event.dart';

part 'my_trainigs_and_events_state.freezed.dart';

@freezed
class MyTrainigsAndEventsState with _$MyTrainigsAndEventsState {
  const factory MyTrainigsAndEventsState({
    @Default(false) bool loading,
    @Default(<TrainingsEvents>[]) List<TrainingsEvents> data,
  }) = _MyTrainigsAndEventsState;
}
