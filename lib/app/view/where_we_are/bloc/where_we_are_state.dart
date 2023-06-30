import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vemare/app/domain/model/center.dart';

part 'where_we_are_state.freezed.dart';

@freezed
class WhereWeAreState with _$WhereWeAreState {
  const factory WhereWeAreState({
    @Default(false) bool loading,
    @Default(false) bool loadingCenters,
    @Default(false) bool loadingData,
    @Default(<Center>[]) List<Center> centers,
    @Default(<String>[]) List<String> countries,
    @Default(<String>[]) List<String> postalCodes,
    LatLng? location,
    LatLng? centerSelect,
  }) = _WhereWeAreState;
  const WhereWeAreState._();
}
