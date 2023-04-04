import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/pills.dart';

part 'pills_state.freezed.dart';

@freezed
class PillsState with _$PillsState {
  const factory PillsState({
    @Default(<Pills>[]) List<Pills> pills,
  }) = _PillsState;
  const PillsState._();
}
