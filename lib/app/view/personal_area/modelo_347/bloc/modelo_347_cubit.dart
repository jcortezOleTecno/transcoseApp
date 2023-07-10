import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';

import 'modelo_347_state.dart';

class Modelo347Cubit extends Cubit<Modelo347State> {
  Modelo347Cubit(this._accountRepository) : super(const Modelo347State()) {
    getMy347(
      year: DateTime(DateTime.now().year - 1).year.toString(),
    );
  }

  final MyAccountRepository _accountRepository;

  Future<void> getMy347({String? year}) async {
    emit(state.copyWith(loading: true, yearSelect: year));
    var data = await _accountRepository.getMy347(year: year);
    emit(state.copyWith(
      modelos: data,
      loading: false,
    ));
  }
}
