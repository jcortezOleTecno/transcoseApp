import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/services.dart';

part 'services_state.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState({
    @Default(false) bool loading,
    @Default(<Services>[]) List<Services> services,
  }) = _ServicesState;
  const ServicesState._();
}
