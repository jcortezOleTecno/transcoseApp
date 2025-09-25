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
      if(url[url.length - 1] == '/' || url[url.length - 1] == '/'){
        url = url.substring(0,(url.length - 1));
      }
    }catch(_){}
    if(url.isEmpty){
      url = 'https://desarrollo.transcose.com';
    }
    //url = 'https://transcose.oletecnologia.com';
    //url = 'https://desarrollo.transcose.com';
    url = 'https://transcose.com';
    //url = 'https://desarrollo.grupovemare.com';
    log('URL : $url');
    return url;
  }

  void finish(){
    appStatus = AppStatus.app;
    notifyListeners();
  }



}
