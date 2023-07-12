import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';

import 'recover_password_state.dart';

class RecoverPasswordCubit extends Cubit<RecoverPasswordState> {
  RecoverPasswordCubit(this._authRepository)
      : super(const RecoverPasswordState());

  final AuthRepository _authRepository;

  Future<void> recoverPassword() async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      var message = await _authRepository.recoverPassword(email: state.email!);
      emit(state.copyWith(successMessage: message, status: FormStatus.done));
    } catch (e) {
      log(e.toString());
      emit(
          state.copyWith(status: FormStatus.error, errorMessage: e.toString()));
    }
  }

  void email(String? email) {
    emit(state.copyWith(
      email: email,
      status: FormStatus.editing,
    ));
  }
}
