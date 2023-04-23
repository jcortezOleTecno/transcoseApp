import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/budget.dart';

part 'my_budget_state.freezed.dart';

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState({
    @Default(false) bool loading,
    @Default(<Budget>[]) List<Budget> budget,
    String? filters,
  }) = _BudgetState;
  const BudgetState._();
}
