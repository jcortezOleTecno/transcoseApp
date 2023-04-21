import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/my_event.dart';

import 'my_events_state.dart';

class MyEventsCubit extends Cubit<MyEventsState> {
  MyEventsCubit(
    this._eventsRepository,
  ) : super(const MyEventsState()) {
    fetchData();
  }

  final EventsRepository _eventsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<MyEvents> eventsVemare = await _eventsRepository.getMyEvents();
    emit(state.copyWith(eventsVemare: eventsVemare, loading: false));
  }
}
