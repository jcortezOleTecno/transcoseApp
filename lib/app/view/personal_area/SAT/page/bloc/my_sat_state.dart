import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';

part 'my_sat_state.freezed.dart';

@freezed
class MySatState with _$MySatState {
  const factory MySatState({
    @Default(false) bool loading,
    @Default(<Intervenciones>[]) List<Intervenciones> sats,
    DataTableSource? data,
    DataTableSource? dataFiltrada,
    String? filters,
  }) = _MySatState;
}
