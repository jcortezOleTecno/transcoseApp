import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/modelo_347.dart';

part 'modelo_347_state.freezed.dart';

@freezed
class Modelo347State with _$Modelo347State {
  const factory Modelo347State({
    @Default(false) bool loading,
    @Default(<Modelo347>[]) List<Modelo347> modelos,
    @Default('2021') String? yearSelect,
  }) = _Modelo347State;
}
