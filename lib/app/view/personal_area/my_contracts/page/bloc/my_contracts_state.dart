import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/model/contrats.dart';

part 'my_contracts_state.freezed.dart';

@freezed
class MyContratsState with _$MyContratsState {
  const factory MyContratsState({
    @Default(false) bool loading,
    @Default(<Contrats>[]) List<Contrats> crd,
    ContratoMillenium? mill,
    @Default(<ContratoPmp>[]) List<ContratoPmp> pmp,
    @Default(<ContratoMillenium>[]) List<ContratoMillenium> millList,
    ContratoRappel? rappel,
    String? yearSelectMill,
    String? yearSelectRappel,
    String? filtersCRD,
    String? filtersMILL,
    String? filtersRAPPEL,
    DataTableSource? dataRappels,
    DataTableSource? dataRappelsFiltrado,
    DataTableSource? dataMillennium,
    DataTableSource? dataMillenniumFiltrado,
    DataTableSource? dataMillenniumHiredServices,
    DataTableSource? dataPMPFiltrado,
    DataTableSource? dataCRDFiltrado,
  }) = _MyContratsState;
}
