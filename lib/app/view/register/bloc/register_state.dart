import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/password.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(FormStatus.editing) FormStatus status,
    @Default(false) bool privacyPolicy,
    @Default(false) bool receiveInformation,
    String? msgError,
    String? name,
    String? cif,
    Email? email,
    String? phone,
    String? responsibleName,
    String? responsibleLastName,
    Password? password,
    Password? confirmPassword,
    String? roleId,
    String? parentId,
  }) = _RegisterState;

  const RegisterState._();

  bool get isCompleted =>
      name != null &&
      name != '' &&
      cif != null &&
      email != null &&
      phone != null &&
      phone != '' &&
      responsibleName != null &&
      responsibleName != '' &&
      responsibleLastName != null &&
      responsibleLastName != '' &&
      password != null &&
      confirmPassword != null &&
      privacyPolicy;
}
