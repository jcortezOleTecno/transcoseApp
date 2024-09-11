import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/header.dart';

part 'events_state.freezed.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    @Default(false) bool loading,
    // @Default(<Header>[]) List<Header> headers,
    Header? hPage,
    Header? hMyEvents,
    Header? hEventosVemare,
    Header? hEventosCelebrados,
    // Header? hMisEventos,
  }) = _EventsState;
  const EventsState._();
}
