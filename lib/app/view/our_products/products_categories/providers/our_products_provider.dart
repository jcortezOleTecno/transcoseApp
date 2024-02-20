import 'package:flutter/material.dart';

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