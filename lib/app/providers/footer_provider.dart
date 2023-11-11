import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/data/url_dynamic_repository.dart';
import 'package:vemare/config/service_locator.dart';

class FooterProvider extends ChangeNotifier {

  Map<String,dynamic> _dataFooter = {};
  Map<String,dynamic> get dataFooter => _dataFooter;
  set dataFooter (Map<String,dynamic> value){ _dataFooter = value; notifyListeners(); }

  Future getDataFooter() async{
    try{
      if(SharedPreferencesLocal.veraneDataFooter.isNotEmpty){
        dataFooter = jsonDecode(SharedPreferencesLocal.veraneDataFooter);
      }
      dataFooter = await getIt.get<UrlDynamicRepository>().getFooter();
      SharedPreferencesLocal.veraneDataFooter = jsonEncode(dataFooter);

      SharedPreferencesLocal.veraneAppDevoluciones = dataFooter['app_devoluciones'];

    }catch(e){
      log(e.toString());
    }
  }

}
