import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/formation.dart';

part 'skillful_formation_state.freezed.dart';

@freezed
class SkillfulFormationState with _$SkillfulFormationState {
  const factory SkillfulFormationState({
    @Default(<Formation>[]) List<Formation> formations,
    @Default(false) bool loading,
    TrainigGroup? trainigGroup,
  }) = _SkillfulFormationState;
  const SkillfulFormationState._();
}
