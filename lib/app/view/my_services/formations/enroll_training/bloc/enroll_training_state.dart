import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';

part 'enroll_training_state.freezed.dart';

@freezed
class EnrollTrainingState with _$EnrollTrainingState {
  const factory EnrollTrainingState({
    @Default(false) bool loading,
    @Default(0) int peopleCounter,
    @Default(<Horario>[]) List<Horario> horarios,
    Locations? locations,
    Formation? formation,
  }) = _EnrollTrainingState;
  const EnrollTrainingState._();
}
