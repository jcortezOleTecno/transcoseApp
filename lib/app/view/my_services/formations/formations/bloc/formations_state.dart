import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/formation.dart';

part 'formations_state.freezed.dart';

@freezed
class FormationsState with _$FormationsState {
  const factory FormationsState({
    @Default(false) bool loading,
    @Default(<Formations>[]) List<Formations> formations,
  }) = _FormationsState;
  const FormationsState._();
}
