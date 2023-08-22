import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/locations.dart';

import 'available_destinations_state.dart';

class AvailableDestinationsCubit extends Cubit<AvailableDestinationsState> {
  AvailableDestinationsCubit(
    this._eventsRepository,
    Events event,
  ) : super(AvailableDestinationsState(event: event)) {
    fetchData();
  }

  final EventsRepository _eventsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Locations> data =
        await _eventsRepository.getLocationsEvents(state.event!.id!);
    emit(state.copyWith(location: data, loading: false));
  }
}
