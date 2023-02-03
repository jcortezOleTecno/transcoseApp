import 'package:flutter/material.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/splash/splash_page.dart';

abstract class AppRouter {
  static String get initialPage => SplashPage.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SplashPage(),
        );
      case LoginPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
      case RegisterPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const RegisterPage(),
        );

      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
