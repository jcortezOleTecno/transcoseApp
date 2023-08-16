import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/answer_with_filters.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/view/personal_area/SAT/page/bloc/my_sat_state.dart';
import 'package:vemare/app/view/personal_area/SAT/page/my_sat_page.dart';

class MySatCubit extends Cubit<MySatState> {
  MySatCubit(this._accountRepository) : super(const MySatState()) {
    getSats();
  }

  final MyAccountRepository _accountRepository;

  Future<void> getSats({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true));
    AnswerWithFilters data = await _accountRepository.getMySAT(filter: filter);
    emit(state.copyWith(
      sats: data.data as List<Intervenciones>,
      data: MyDataSAT(data.data as List<Intervenciones>),
      dataFiltrada: MyDataSAT(data.data as List<Intervenciones>),
      filters: reset ? null : data.filter,
      loading: false,
    ));
  }

  void filtro(String? value) {
    emit(
      state.copyWith(
        dataFiltrada: MyDataSAT(state.sats.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList()),
      ),
    );
  }
}
