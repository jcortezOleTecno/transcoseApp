import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/contract_conventions.dart';
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
    @Default(true) bool loadDataConvention,
    ContratoMillenium? mill,
    @Default(<ContratoPmp>[]) List<ContratoPmp> pmp,
    @Default(<ContratoMillenium>[]) List<ContratoMillenium> millList,
    @Default(<ContratoConventionsModel>[]) List<ContratoConventionsModel> contratoConventionsList,
    ContratoRappel? rappel,
    ContratoConventionsModel? contratoConventionsModel,
    String? yearSelectMill,
    String? yearSelectRappel,
    String? filtersCRD,
    String? filtersMILL,
    String? filtersRAPPEL,
    String? yearSelectedConvention,
    DataTableSource? dataRappels,
    DataTableSource? dataRappelsFiltrado,
    DataTableSource? dataMillennium,
    DataTableSource? dataMillenniumFiltrado,
    DataTableSource? dataMillenniumHiredServices,
    DataTableSource? dataPMPFiltrado,
    DataTableSource? dataCRDFiltrado,
    DataTableSource? dataConventionHiredServicesConvention,
    DataTableSource? dataConventionFiltradoConvention,
  }) = _MyContratsState;
}
