import 'package:freezed_annotation/freezed_annotation.dart';

part 'enroll_event_state.freezed.dart';

@freezed
class EnrollEventState with _$EnrollEventState {
  const factory EnrollEventState({
    @Default(0) int peopleCounter,
  }) = _EnrollTrainingState;
  const EnrollEventState._();
}
