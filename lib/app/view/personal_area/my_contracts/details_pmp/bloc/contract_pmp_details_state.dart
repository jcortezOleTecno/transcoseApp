import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/contract_pmp_detail.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';

part 'contract_pmp_details_state.freezed.dart';

@freezed
class ContratPMPDetailState with _$ContratPMPDetailState {
  const factory ContratPMPDetailState({
    @Default(false) bool loading,
    ContratPmpDetail? detail,
    ContratoPmp? contract,
    DataTableSource? dataMaquinas,
    DataTableSource? dataServicios,
  }) = _ContratPMPDetailState;
}
