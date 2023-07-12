import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'recover_password_state.freezed.dart';

@freezed
class RecoverPasswordState with _$RecoverPasswordState {
  const factory RecoverPasswordState({
    @Default(FormStatus.editing) FormStatus status,
    String? email,
    String? successMessage,
    String? errorMessage,
  }) = _RecoverPasswordState;
  const RecoverPasswordState._();
}
