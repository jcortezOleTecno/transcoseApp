import 'package:flutter/material.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/our_products/our_productos_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/splash/splash_page.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';

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
      case HomePage.route:
        final logged = settings.arguments as bool?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => HomePage(logged: logged!),
        );
      case WorkWithUsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const WorkWithUsPage(),
        );
      case TypeOfVehiclePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TypeOfVehiclePage(),
        );
      case OurProductsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const OurProductsPage(),
        );

      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
