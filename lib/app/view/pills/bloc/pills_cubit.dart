import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/pills_repository.dart';
import 'package:vemare/app/view/pills/bloc/pills_state.dart';

class PillsCubit extends Cubit<PillsState> {
  PillsCubit(
    this._pillsRepository,
  ) : super(const PillsState()) {
    fetchData();
  }

  final PillsRepository _pillsRepository;

  Future<void> fetchData() async {
    PillsResponse res = await _pillsRepository.getPills(limit: 0);
    emit(state.copyWith(
      pills: res.pills,
      mostRead: res.mostRead,
    ));
  }
}
