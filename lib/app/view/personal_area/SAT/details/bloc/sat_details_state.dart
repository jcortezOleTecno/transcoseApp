import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/intervencion_detalle.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';

part 'sat_details_state.freezed.dart';

@freezed
class SatDetailState with _$SatDetailState {
  const factory SatDetailState({
    @Default(false) bool loading,
    IntervencionesDetalle? detail,
    Intervenciones? intervencion,
    DataTableSource? dataMaquinas,
    DataTableSource? dataMateriales,
  }) = _SatDetailState;
}
