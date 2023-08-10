import 'package:freezed_annotation/freezed_annotation.dart';

part 'enroll_training_state.freezed.dart';

@freezed
class EnrollTrainingState with _$EnrollTrainingState {
  const factory EnrollTrainingState({
    // @Default(false) bool loading,
    @Default(0) int peopleCounter,
  }) = _EnrollTrainingState;
  const EnrollTrainingState._();
}
