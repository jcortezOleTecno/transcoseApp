import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit() : super(const MyAccountState());

  void updatePhoto(File file) {
    emit(state.copyWith(foto: file));
  }
}
