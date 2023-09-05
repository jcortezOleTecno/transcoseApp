import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/bloc/budget_detail_state.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/budget_detail.dart';

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
    emit(state.copyWith(
      budgetDetails: budgetDetails,
      dataBudgetDetail:
          MyDataBudgetDetails(budgetDetails.lineasPresupuesto ?? []),
      loading: false,
    ));
  }

  Future<void> sign({
    required String name,
    required String nif,
    required String signature,
  }) async {
    await _budgetRepository
        .signBudget(
      codPresupuesto: state.budget!.codigoPresupuesto.toString(),
      numeroProyecto: state.budget!.numero!,
      persona: name,
      nif: nif,
      firma: signature,
    )
        .then((value) {
      if (value) {
        fetchData();
      }
    });
  }

  void filtro(String? value) {
    emit(
      state.copyWith(
        dataBudgetDetail: MyDataBudgetDetails(
          state.budgetDetails!.lineasPresupuesto!.where((e) {
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
