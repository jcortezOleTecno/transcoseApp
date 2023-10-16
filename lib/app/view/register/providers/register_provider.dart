import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier{

  bool _checkData = false;
  bool get checkData => _checkData;
  set checkData(bool value){ _checkData = value; notifyListeners();}

}