import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit(this._authRepository)
      : super(MyAccountState(
          name: LocalDataRepository().user?.name,
          email: LocalDataRepository().user?.email,
          code: LocalDataRepository().user?.code,
          cif: LocalDataRepository().user?.cif,
          phone: LocalDataRepository().user?.phone,
          address: LocalDataRepository().user?.address,
          city: LocalDataRepository().user?.city,
          province: LocalDataRepository().user?.province,
          postalCode: LocalDataRepository().user?.postalCode,
        ));

  final AuthRepository _authRepository;

  void updatePhoto(File file) {
    emit(state.copyWith(
      foto: file,
      status: FormStatus.editing,
    ));
  }

  void name(String? name) {
    emit(state.copyWith(
      name: name,
      status: FormStatus.editing,
    ));
  }

  void email(String? email) {
    emit(state.copyWith(
      email: email,
      status: FormStatus.editing,
    ));
  }

  void code(String? code) {
    emit(state.copyWith(
      code: code,
      status: FormStatus.editing,
    ));
  }

  void cif(String? cif) {
    emit(state.copyWith(
      cif: cif,
      status: FormStatus.editing,
    ));
  }

  void phone(String? phone) {
    emit(state.copyWith(
      phone: phone,
      status: FormStatus.editing,
    ));
  }

  void address(String? address) {
    emit(state.copyWith(
      address: address,
      status: FormStatus.editing,
    ));
  }

  void city(String? city) {
    emit(state.copyWith(
      city: city,
      status: FormStatus.editing,
    ));
  }

  void province(String? province) {
    emit(state.copyWith(
      province: province,
      status: FormStatus.editing,
    ));
  }

  void postalCode(String? postalCode) {
    emit(state.copyWith(
      postalCode: postalCode,
      status: FormStatus.editing,
    ));
  }

  void restartChanges() {
    emit(state.copyWith(
      name: LocalDataRepository().user?.name,
      email: LocalDataRepository().user?.email,
      code: LocalDataRepository().user?.code,
      cif: LocalDataRepository().user?.cif,
      phone: LocalDataRepository().user?.phone,
      address: LocalDataRepository().user?.address,
      city: LocalDataRepository().user?.city,
      province: LocalDataRepository().user?.province,
      postalCode: LocalDataRepository().user?.postalCode,
    ));
  }

  Future<String?> updateUser() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      var res = await _authRepository.updateUser(
        name: state.name,
        email: state.email,
        code: state.code,
        cif: state.cif,
        phone: state.phone,
        address: state.address,
        city: state.city,
        province: state.province,
        postalCode: state.postalCode,
        logo: state.foto,
      );

      emit(state.copyWith(status: FormStatus.done));

      return res;
    } catch (e) {
      log('ERROR $e');
      emit(state.copyWith(status: FormStatus.error));
      return null;
    }
  }
}
