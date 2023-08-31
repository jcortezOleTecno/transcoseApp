import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';

part 'albaran_details_state.freezed.dart';

@freezed
class AlbaranDetailState with _$AlbaranDetailState {
  const factory AlbaranDetailState({
    @Default(false) bool loading,
    @Default(<AlbaranDetails>[]) List<AlbaranDetails> details,
    Albaran? albaran,
  }) = _AlbaranDetailState;
  const AlbaranDetailState._();
}
