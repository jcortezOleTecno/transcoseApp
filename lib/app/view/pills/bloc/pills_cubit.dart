import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/pills_repository.dart';
import 'package:vemare/app/domain/model/pills.dart';
import 'package:vemare/app/view/pills/bloc/pills_state.dart';

class PillsCubit extends Cubit<PillsState> {
  PillsCubit(
    this._pillsRepository,
  ) : super(const PillsState()) {
    fetchData();
  }

  final PillsRepository _pillsRepository;

  Future<void> fetchData() async {
    List<Pills> pills = await _pillsRepository.getPills(limit: 0);
    emit(state.copyWith(pills: pills));
  }
}
