import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/filter.dart';

import 'my_trainigs_and_events_state.dart';

class MyTrainigsAndEventsCubit extends Cubit<MyTrainigsAndEventsState> {
  MyTrainigsAndEventsCubit(this._accountRepository)
      : super(const MyTrainigsAndEventsState()) {
    getData();
  }

  final MyAccountRepository _accountRepository;

  Future<void> getData({Filter? filter}) async {
    emit(state.copyWith(loading: true));
    var data = await _accountRepository.getTrainingsEvents(filter: filter);
    // data.sort((a, b) => a.fecha!.compareTo(b.fecha!));
    emit(state.copyWith(
      data: data,
      loading: false,
    ));
  }

  Future<void> cancelRegistration(int id) async {
    await _accountRepository.cancelRegistration(id: id.toString());
    emit(state.copyWith(data: state.data.where((e) => e.id != id).toList()));
  }
}
