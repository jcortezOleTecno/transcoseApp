import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/domain/model/sat.dart';

part 'sat_state.freezed.dart';

@freezed
class SatState with _$SatState {
  const factory SatState({
    @Default(false) bool loading,
    @Default(<Intervenciones>[]) List<Intervenciones> sats,
  }) = _SatState;
}
