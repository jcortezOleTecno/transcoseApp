import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/password.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/login/bloc/login_state.dart';
import 'package:vemare/app/view/shared/bloc/user_cubit.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._authRepository,
    this._localDataRepository,
    this._userCubit,
    String? msgGoBack,
  ) : super(LoginState(msgGoBack: msgGoBack)) {
    getRememberData();
  }

  final AuthRepository _authRepository;
  final LocalDataRepository _localDataRepository;
  final UserCubit _userCubit;

  void getRememberData() {
    var email = _localDataRepository.loginDataEmail;
    var password = _localDataRepository.loginDataPassword;

    if (email != null && password != null) {
      emit(
        state.copyWith(
          email: Email(email.trim()),
          initialEmail: email.trim(),
          password: Password(password.trim()),
          initialPassword: password.trim(),
        ),
      );
    }
  }

  void email(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          email: Email(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          email: null,
        ),
      );
    }
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

  Future<void> login() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      await _authRepository.login(
        email: state.email!.value,
        password: state.password!.value,
      );
      if (state.rememberData) {
        _localDataRepository
          ..loginDataEmail = state.email!.value
          ..loginDataPassword = state.password!.value;
      } else {
        _localDataRepository
          ..deleteLoginDataEmail()
          ..deleteLoginDataPassword();
      }
      unawaited(_userCubit.getEmployees());
      emit(
        state.copyWith(
          status: FormStatus.done,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(status: FormStatus.error, msgError: e.toString()),
      );
    }
  }

  void rememberData(bool? rememberData) {
    emit(state.copyWith(rememberData: rememberData!));
  }
}
