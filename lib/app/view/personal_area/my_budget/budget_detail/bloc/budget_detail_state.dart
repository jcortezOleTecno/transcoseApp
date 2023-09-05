import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';

part 'budget_detail_state.freezed.dart';

@freezed
class BudgetDetailState with _$BudgetDetailState {
  const factory BudgetDetailState({
    @Default(false) bool loading,
    BudgetDetail? budgetDetails,
    Budget? budget,
    DataTableSource? dataBudgetDetail,
  }) = _BudgetDetailState;
  const BudgetDetailState._();
}
