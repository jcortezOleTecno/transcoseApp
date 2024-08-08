import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/domain/model/header.dart';

import 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit(
    this._eventsRepository,
  ) : super(const EventsState()) {
    fetchData();
  }

  final HeaderRepository _eventsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Header> res = await _eventsRepository.getHeaders();
    emit(state.copyWith(
      hPage: res.firstWhere((e) => e.module == "EventModule"),
      hMyEvents: res.firstWhere((e) => e.module == "MyEvents"),
      hEventosVemare: res.firstWhere((e) => e.module == "Event"),
      hEventosCelebrados: res.firstWhere((e) => e.module == "EventVemare"),
      loading: false,
    ));
  }
}
