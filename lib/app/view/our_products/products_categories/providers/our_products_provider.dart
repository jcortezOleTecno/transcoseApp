import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';

class OurProductsProvider with ChangeNotifier{

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value){ _searchText = value; notifyListeners();}

  String _searchChangeText = '';
  String get searchChangeText => _searchChangeText;
  set searchChangeText(String value){ _searchChangeText = value; notifyListeners();}

  void fetch(){
    searchText = searchChangeText;
    notifyListeners();
  }

}