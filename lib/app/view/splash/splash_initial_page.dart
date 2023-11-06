// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/providers/footer_provider.dart';
import 'package:vemare/app/providers/url_state_provider.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/theme.dart';


class SplashInitialPage extends StatefulWidget {
  const SplashInitialPage({Key? key}) : super(key: key);

  static const String route = '/SplashInitialPage';

  @override
  State<SplashInitialPage> createState() => _SplashInitialPageState();
}

class _SplashInitialPageState extends State<SplashInitialPage> {


  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async{

    String url = await Provider.of<UrlDynamicProvider>(context,listen: false).getUrl();
    if(url.isNotEmpty){
      BASE_API_URL = url;

      if(SharedPreferencesLocal.veraneUrlDynamic.isNotEmpty && SharedPreferencesLocal.veraneUrlDynamic != url){
        SharedPreferencesLocal.veraneDeleteUser = true;
      }

      SharedPreferencesLocal.veraneUrlDynamic = BASE_API_URL;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      Provider.of<UrlDynamicProvider>(context,listen: false).finish();
      Provider.of<FooterProvider>(context,listen: false).getDataFooter();
    }else{
      getData();
    }

    // BASE_API_URL = SharedPreferencesLocal.veraneUrlDynamic;
    //
    // if(BASE_API_URL.isEmpty){
    //   String url = await Provider.of<UrlDynamicProvider>(context,listen: false).getUrl();
    //   if(url.isNotEmpty){
    //     BASE_API_URL = url;
    //     SharedPreferencesLocal.veraneUrlDynamic = BASE_API_URL;
    //     setState(() {});
    //   }
    // }
    //
    // if(BASE_API_URL.isNotEmpty){
    //   await Future.delayed(const Duration(seconds: 2));
    //   Provider.of<UrlDynamicProvider>(context,listen: false).finish();
    //   Provider.of<FooterProvider>(context,listen: false).getDataFooter();
    // }else{
    //   getData();
    // }

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Vemare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColor.primary,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/logo_splash.svg',
                  semanticsLabel: 'Logo',
                ),
                spacerXL,
                const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 6,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
