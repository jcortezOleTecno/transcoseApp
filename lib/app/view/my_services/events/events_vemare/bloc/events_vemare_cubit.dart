import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';
import 'package:vemare/app/domain/model/header_events_held.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/bloc/events_vemare_state.dart';

class EventsVemareCubit extends Cubit<EventsVemareState> {
  EventsVemareCubit(
    this._eventsRepository,
  ) : super(const EventsVemareState()) {
    fetchData();
  }

  final EventsRepository _eventsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    EventsHeldData eventsVemare = await _eventsRepository.getEventsVemare();
    HeaderEvents header = await _eventsRepository.getHeaderEventsHeld();
    emit(state.copyWith(
        eventsVemare: eventsVemare.data,
        header: header,
        loading: false,
        yearSelected: eventsVemare.yearSelected,
        yearsList: eventsVemare.years
    ));
  }

  Future changeSelectedYear({required String year}) async {
    emit(state.copyWith(loading: true));
    EventsHeldData eventsVemare = await _eventsRepository.getEventsVemare(year: year);
    emit(state.copyWith(
        eventsVemare: eventsVemare.data,
        loading: false,
        yearSelected: eventsVemare.yearSelected,
        yearsList: eventsVemare.years
    ));
  }
}
