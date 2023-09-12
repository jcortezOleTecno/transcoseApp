import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';

part 'enroll_event_state.freezed.dart';

@freezed
class EnrollEventState with _$EnrollEventState {
  const factory EnrollEventState({
    @Default(false) bool loading,
    @Default(false) bool showCalendar,
    @Default(0) int peopleCounter,
    @Default(<Horario>[]) List<Horario> horarios,
    Locations? locations,
    Events? event,
    Horario? horarioSelected,
  }) = _EnrollTrainingState;
  const EnrollEventState._();
}
