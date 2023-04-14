import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_state.dart';

class EnrollEventCubit extends Cubit<EnrollEventState> {
  EnrollEventCubit(
    this._eventsRepository,
  ) : super(const EnrollEventState());

  final EventsRepository _eventsRepository;

  Future<void> enrollEvent({
    required int id,
    required List<int> idsEmployees,
    required List<Employee> persons,
  }) async {
    try {
      await _eventsRepository.enrollEvents(
          eventId: id, idsEmployees: idsEmployees, persons: persons);
    } catch (e) {
      print(e);
    }
  }
}
