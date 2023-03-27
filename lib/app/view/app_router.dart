import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/view/about_us/about_us_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_notifications/my_notifications_page.dart';
import 'package:vemare/app/view/personal_area/SAT/sat_page.dart';
import 'package:vemare/app/view/personal_area/modelo_347/modelo_347_page.dart';
import 'package:vemare/app/view/personal_area/my_account/my_account_page.dart';
import 'package:vemare/app/view/my_services/formations/detail_formation.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training.dart';
import 'package:vemare/app/view/my_services/formations/formations.dart';
import 'package:vemare/app/view/my_services/service_general.dart';
import 'package:vemare/app/view/my_services/services_page.dart';
import 'package:vemare/app/view/my_services/formations/skillful_formation.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/our_productos_page.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/search_my_product/search_my_product_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/contract_detail.dart';
import 'package:vemare/app/view/personal_area/my_contracts/my_contracts_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/bill_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/order_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_detail.dart';
import 'package:vemare/app/view/personal_area/my_trainigs_and_events/my_trainigs_and_events_page.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';
import 'package:vemare/app/view/promotions/promotions_page.dart';
import 'package:vemare/app/view/promotions/renting_store/card_payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/renting_store_page.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/shopping_cart/shopping_cart.dart';
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
          builder: (_) => const ServicesPage(),
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
      case ShoppingCartPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ShoppingCartPage(),
        );
      case DetailFormationPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const DetailFormationPage(),
        );
      case EnrollTrainingPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const EnrollTrainingPage(),
        );
      case MyAccountPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyAccountPage.create(),
        );
      case MyContractsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MyContractsPage(),
        );
      case ContractDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ContractDetailPage(),
        );
      case MyBudgetPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MyBudgetPage(),
        );
      case BudgetDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const BudgetDetailPage(),
        );
      case MyOrdersPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MyOrdersPage(),
        );
      case OrderDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const OrderDetailPage(),
        );
      case AlbaranDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const AlbaranDetailPage(),
        );
      case WarrantyDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const WarrantyDetailPage(),
        );
      case BillDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const BillDetailPage(),
        );
      case MyTrainingAndEventsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MyTrainingAndEventsPage(),
        );
      case SatPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SatPage(),
        );
      case Modelo347Page.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const Modelo347Page(),
        );
      case MyNotificationsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyNotificationsPage.create(),
        );

      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
