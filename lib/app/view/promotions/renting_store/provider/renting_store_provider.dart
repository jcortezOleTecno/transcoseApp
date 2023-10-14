import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';

class RentingStoreProvider with ChangeNotifier{

  RentingStoreProvider (BuildContext contxt) {
    context = contxt;
    getUser();
  }

  BuildContext? context;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  bool _viewData = false;
  bool get viewData => _viewData;
  set viewData(bool value){ _viewData = value; notifyListeners();}

  bool _check = false;
  bool get check => _check;
  set check(bool value){ _check = value; notifyListeners();}

  UserData? userData;

  Future getUser() async{
    final cubit = context!.read<UserCubit>();
    userData = cubit.state.user;
    loadData = false;
    notifyListeners();
  }
}