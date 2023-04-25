import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/sat_forms.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'sat_state.freezed.dart';

@freezed
class SatState with _$SatState {
  const factory SatState({
    @Default(false) bool loading,
    @Default(<SatForms>[]) List<SatForms> dataForms,
    @Default(<String>[]) List<String> forms,
    @Default(<String>[]) List<String> tipoMaquinaValores,
    @Default(<DateTime>[]) List<DateTime> diasOcupados,
    @Default(FormStatus.editing) FormStatus status,
    String? formSelect,
    String? tipoMaquina,
    Name? marca,
    Name? modelo,
    Name? producto,
    Name? numeroSerie,
    Name? tipoAveria,
    String? tipoIncidencia,
    Name? codCliente,
    Name? razonSocial,
    Name? poblacion,
    Name? persona,
    Phone? telefono,
    Email? email,
    String? fechaCita,
    String? franjaHoraria,
  }) = _SatState;

  const SatState._();

  bool get equipamentoComplete =>
      tipoMaquina != null &&
      marca != null &&
      modelo != null &&
      numeroSerie != null &&
      tipoAveria != null &&
      tipoIncidencia != null &&
      codCliente != null &&
      razonSocial != null &&
      poblacion != null &&
      persona != null &&
      telefono != null &&
      fechaCita != null &&
      franjaHoraria != null &&
      email != null;

  bool get pinturaComplete =>
      marca != null &&
      modelo != null &&
      tipoAveria != null &&
      tipoIncidencia != null &&
      codCliente != null &&
      razonSocial != null &&
      poblacion != null &&
      persona != null &&
      telefono != null &&
      fechaCita != null &&
      franjaHoraria != null &&
      email != null;

  bool get tallerComplete =>
      tipoAveria != null &&
      tipoIncidencia != null &&
      codCliente != null &&
      razonSocial != null &&
      poblacion != null &&
      persona != null &&
      telefono != null &&
      fechaCita != null &&
      franjaHoraria != null &&
      email != null;
}
