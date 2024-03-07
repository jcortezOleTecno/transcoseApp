import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_rol.dart';
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
    @Default(<UserRol>[]) List<UserRol> roles,
    @Default(<Enterprise>[]) List<Enterprise> enterprises,
    Enterprise? selectedEnterprise,
    UserRol? selectedRol,
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

  bool get isCompletedEnterprise =>
      name != null &&
      name != '' &&
      cif != null &&
      email != null &&
      responsibleName != null &&
      responsibleName != '' &&
      responsibleLastName != null &&
      responsibleLastName != '' &&
      password != null &&
      confirmPassword != null &&
      privacyPolicy;

  bool get isCompletedEmployee =>
      selectedEnterprise != null &&
      responsibleName != null &&
      responsibleName != '' &&
      responsibleLastName != null &&
      responsibleLastName != '' &&
      // selectedRol != null &&
      phone != null &&
      phone != '' &&
      email != null &&
      password != null &&
      confirmPassword != null &&
      privacyPolicy;
}
