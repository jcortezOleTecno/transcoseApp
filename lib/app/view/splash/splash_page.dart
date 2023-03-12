import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/config/service_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool logo = true;

  @override
  void initState() {
    final logged = getIt.get<LocalDataRepository>().isLogged;
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (logged) {
        Navigator.pushReplacementNamed(context, HomePage.route);
      } else {
        Navigator.pushReplacementNamed(context, LoginPage.route);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
