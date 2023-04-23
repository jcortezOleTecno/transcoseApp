import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit(
    this._budgetRepository,
  ) : super(const BudgetState()) {
    fetchData();
  }

  final BudgetRepository _budgetRepository;

  Future<void> fetchData({Filter? filter}) async {
    emit(state.copyWith(loading: true));
    var data = await _budgetRepository.getBudget(filter: filter);
    emit(state.copyWith(
      budget: data.data as List<Budget>,
      filters: filter != null ? data.filter : null,
      loading: false,
    ));
  }
}
