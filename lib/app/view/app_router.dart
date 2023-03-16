import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/view/about_us/about_us_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/formations.dart';
import 'package:vemare/app/view/my_services/service_general.dart';
import 'package:vemare/app/view/my_services/services_page.dart';
import 'package:vemare/app/view/my_services/skillful_formation.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/our_productos_page.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/search_my_product/search_my_product_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';
import 'package:vemare/app/view/promotions/promotions_page.dart';
import 'package:vemare/app/view/promotions/renting_store/card_payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/renting_store_page.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/splash/splash_page.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';

import 'promotions/promotion/promotion_page.dart';

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
          builder: (_) => LoginPage.create(),
        );
      case RegisterPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => RegisterPage.create(),
        );
      case HomePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => HomePage.create(),
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
        final typeVehicle = settings.arguments as String?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OurProductsPage(typeVehicle!),
        );
      case ProductPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ProductPage(),
        );
      case DetailProductPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const DetailProductPage(),
        );
      case SearchMyProductPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SearchMyProductPage(),
        );
      case PromotionsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PromotionsPage(),
        );
      case PromotionPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PromotionPage(),
        );
      case DetailSaleRent.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const DetailSaleRent(),
        );
      case RentingStorePage.route:
        final isStore = settings.arguments as bool?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => RentingStorePage(isStore!),
        );
      case CardPaymentPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const CardPaymentPage(),
        );
      case PaymentPage.route:
        final isCredit = settings.arguments as bool?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PaymentPage(isCredit: isCredit!),
        );
      case ServicesPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ServicesPage(),
        );
      case ServiceGeneralPage.route:
        final Services? service = settings.arguments as Services?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ServiceGeneralPage(service: service!),
        );
      case FormationsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const FormationsPage(),
        );
      case SkillFormationPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SkillFormationPage(),
        );
      case AboutUsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const AboutUsPage(),
        );

      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
