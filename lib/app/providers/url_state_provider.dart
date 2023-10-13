import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vemare/app/data/url_dynamic_repository.dart';
import 'package:vemare/config/service_locator.dart';

enum AppStatus {
  urlDynamic,app
}

class UrlDynamicProvider extends ChangeNotifier {

  AppStatus appStatus = AppStatus.urlDynamic;

  Future<String> getUrl() async{
    String url = '';
    try{
      String totem = await getIt.get<UrlDynamicRepository>().getTotem() ?? '';
      log('totem: $totem');
      url = await getIt.get<UrlDynamicRepository>().getUrl(totem: totem) ?? '';
      log('URL : $url');
      url = 'https://vemare.ole.agency';
    }catch(_){}
    return url;
  }

  void finish(){
    appStatus = AppStatus.app;
    notifyListeners();
  }



}
