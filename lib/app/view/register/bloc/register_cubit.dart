import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_rol.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/password.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/register/bloc/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(const RegisterState()) {
    getUserOpt();
  }

  final AuthRepository _authRepository;

  Future<void> getUserOpt() async {
    print("================>>   getEnterprise");
    // var roles = await _authRepository.getUserRoles();
    var enterprises = await _authRepository.getEnterprise();
    emit(state.copyWith(
      // roles: roles,
      enterprises: enterprises,
    ));
  }

  void enterprise(Enterprise? enterprise) {
    emit(state.copyWith(selectedEnterprise: enterprise!));
  }

  // void rol(UserRol? rol) {
  //   emit(state.copyWith(selectedRol: rol!));
  // }

  void name(String name) {
    emit(state.copyWith(status: FormStatus.editing, name: name));
  }

  void cif(String cif) {
    emit(state.copyWith(status: FormStatus.editing, cif: cif));
  }

  void email(String value) {
    try {
      emit(
        state.copyWith(status: FormStatus.editing, email: Email(value.trim())),
      );
    } catch (e) {
      emit(
        state.copyWith(status: FormStatus.editing, email: null),
      );
    }
  }

  void phone(String phone) {
    emit(
      state.copyWith(status: FormStatus.editing, phone: phone),
    );
  }

  void responsibleName(String responsibleName) {
    emit(state.copyWith(
      status: FormStatus.editing,
      responsibleName: responsibleName,
    ));
  }

  void responsibleLastName(String responsibleLastName) {
    emit(state.copyWith(
      status: FormStatus.editing,
      responsibleLastName: responsibleLastName,
    ));
  }

  void password(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          password: Password(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          password: null,
        ),
      );
    }
  }

  void confirmPassword(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          confirmPassword: Password(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          confirmPassword: null,
        ),
      );
    }
  }

  Future<void> registerEnterprise() async {
    emit(state.copyWith(status: FormStatus.loading));
    if (state.password!.value != state.confirmPassword!.value) {
      emit(state.copyWith(
          status: FormStatus.error, msgError: 'Las contraseñas no coinciden'));
      return;
    }
    try {
      final data = <String, dynamic>{
        "name": state.name,
        "cif": state.cif,
        "email": state.email!.value,
        "phone": state.phone,
        "responsible_name": state.responsibleName,
        "responsible_lastname": state.responsibleLastName,
        "password": state.password!.value,
        "password_confirmation": state.confirmPassword!.value,
        "terms": "1"
      };
      await _authRepository.registerEnterprise(data);
      emit(
        state.copyWith(status: FormStatus.done),
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(status: FormStatus.error, msgError: e.toString()),
      );
    }
  }

  Future<void> registerEmployee() async {
    emit(state.copyWith(status: FormStatus.loading));
    if (state.password!.value != state.confirmPassword!.value) {
      emit(state.copyWith(
          status: FormStatus.error, msgError: 'Las contraseñas no coinciden'));
      return;
    }
    try {
      final data = <String, dynamic>{
        "parent_id": state.selectedEnterprise!.id.toString(),
        "name": state.responsibleName,
        "lastname": state.responsibleLastName,
        // "role_id": state.selectedRol!.id.toString(),
        "phone": state.phone,
        "email": state.email!.value,
        "password": state.password!.value,
        "password_confirmation": state.confirmPassword!.value,
        "terms": "1"
      };
      await _authRepository.registerEmployee(data);
      emit(
        state.copyWith(status: FormStatus.done),
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(status: FormStatus.error, msgError: e.toString()),
      );
    }
  }

  void privacyPolicy(bool? privacyPolicy) {
    emit(state.copyWith(privacyPolicy: privacyPolicy!));
  }

  void receiveInformation(bool? receiveInformation) {
    emit(state.copyWith(receiveInformation: receiveInformation!));
  }
}
