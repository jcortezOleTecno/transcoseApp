import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/header_events_held.dart';
import 'package:vemare/app/view/my_services/events/other_events/bloc/other_events_state.dart';

class OtherEventsCubit extends Cubit<OtherEventsState> {
  OtherEventsCubit(
    this._eventsRepository,
  ) : super(const OtherEventsState()) {
    fetchData();
  }

  final EventsRepository _eventsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Events> events = await _eventsRepository.getEvents();
    HeaderEvents header = await _eventsRepository.getHeaderEventsVemare();
    emit(state.copyWith(
      events: events,
      header: header,
      loading: false,
    ));
  }
}
