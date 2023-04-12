import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';
import 'package:vemare/app/domain/model/months.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/bloc/budget_detail_state.dart';

class BudgetDetailCubit extends Cubit<BudgetDetailState> {
  BudgetDetailCubit(this._budgetRepository, Budget budget)
      : super(BudgetDetailState(budget: budget)) {
    fetchData();
  }

  final BudgetRepository _budgetRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    BudgetDetail budgetDetails = await _budgetRepository.getBudgetDetail(
      codigoPresupuesto: state.budget!.codigoPresupuesto.toString(),
      numeroProyecto: state.budget!.numero.toString(),
    );
    emit(state.copyWith(budgetDetails: budgetDetails, loading: false));
  }

  void months(Months? months) {
    // emit(state.copyWith(monthsSelect: months));
  }
}
