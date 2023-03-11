import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/password.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
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
}
