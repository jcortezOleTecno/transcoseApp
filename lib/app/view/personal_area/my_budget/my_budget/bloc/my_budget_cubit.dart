import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit(
    this._budgetRepository,
  ) : super(const BudgetState()) {
    fetchData();
  }

  final BudgetRepository _budgetRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Budget> budgets = await _budgetRepository.getBudget();
    emit(state.copyWith(budget: budgets, loading: false));
  }
}
