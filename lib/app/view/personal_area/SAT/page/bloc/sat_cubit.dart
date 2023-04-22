import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/view/personal_area/SAT/page/bloc/sat_state.dart';

class SatCubit extends Cubit<SatState> {
  SatCubit(this._accountRepository) : super(const SatState()) {
    getSats();
  }

  final MyAccountRepository _accountRepository;

  Future<void> getSats({Filter? filter}) async {
    emit(state.copyWith(loading: true));
    var data = await _accountRepository.getMySAT(filter: filter);
    emit(state.copyWith(sats: data, loading: false));
  }
}
