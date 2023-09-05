import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_state.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/my_budget_page.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit(
    this._budgetRepository,
  ) : super(const BudgetState()) {
    fetchData(reset: true);
  }

  final BudgetRepository _budgetRepository;

  Future<void> fetchData({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filters: null));
    var data = await _budgetRepository.getBudget(filter: filter);
    emit(state.copyWith(
      budget: data.data as List<Budget>,
      filters: reset ? null : data.filter,
      dataBudget: MyDataBudget(data.data as List<Budget>),
      loading: false,
    ));
  }

  void filtro(String? value) {
    emit(
      state.copyWith(
        dataBudget: MyDataBudget(
          state.budget.where((e) {
            return e
                .toFilter()
                .toString()
                .toLowerCase()
                .contains(value!.trim().toLowerCase());
          }).toList(),
        ),
      ),
    );
  }
}
