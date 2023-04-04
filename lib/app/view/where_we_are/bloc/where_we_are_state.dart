import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/center.dart';

part 'where_we_are_state.freezed.dart';

@freezed
class WhereWeAreState with _$WhereWeAreState {
  const factory WhereWeAreState({
    @Default(<Center>[]) List<Center> centers,
  }) = _WhereWeAreState;
  const WhereWeAreState._();
}
