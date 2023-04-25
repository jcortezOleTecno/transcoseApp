import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/pills.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/view/about_us/about_us_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/library/library_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_notifications/my_notifications_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/enroll_event.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/event_detail_page.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/events_vemare_page.dart';
import 'package:vemare/app/view/my_services/events/my_events/my_events_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_event_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_events_list.dart';
import 'package:vemare/app/view/news/news_detail.dart';
import 'package:vemare/app/view/news/news_page.dart';
import 'package:vemare/app/view/our_history/our_history.dart';
import 'package:vemare/app/view/personal_area/SAT/details/sat_detail.dart';
import 'package:vemare/app/view/personal_area/SAT/page/my_sat_page.dart';
import 'package:vemare/app/view/personal_area/modelo_347/modelo_347_page.dart';
import 'package:vemare/app/view/personal_area/my_account/my_account_page.dart';
import 'package:vemare/app/view/my_services/formations/detail_formation.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/enroll_training.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_page.dart';
import 'package:vemare/app/view/my_services/services/service_general.dart';
import 'package:vemare/app/view/my_services/services/services_page.dart';
import 'package:vemare/app/view/my_services/formations/skillful_formation.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/products_categories/our_products_page.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/search_my_product/search_my_product_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/budget_detail.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/my_budget_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details/contract_detail.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details_pmp/contract_pmp_detail.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/my_contracts_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_details/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/bill_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/my_orders_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/order_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_details/warranty_details_page.dart';
import 'package:vemare/app/view/personal_area/my_trainigs_and_events/my_trainigs_and_events_page.dart';
import 'package:vemare/app/view/pills/pills_page.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';
import 'package:vemare/app/view/promotions/promotions_categories/promotions_page.dart';
import 'package:vemare/app/view/promotions/renting_store/card_payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/renting_store_page.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/shopping_cart/shopping_cart.dart';
import 'package:vemare/app/view/splash/splash_page.dart';
import 'package:vemare/app/view/where_we_are/where_we_are_page.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';
import 'package:vemare/app/view/workshop_networks/workshop_networks_page.dart';

import '../domain/model/contrato_pmp.dart';
import 'library/library_detail.dart';
import 'my_services/sat/sat_intro_page.dart';
import 'my_services/sat/sat_page.dart';
import 'pills/pills_details.dart';
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
        final String? msgGoBack = settings.arguments as String?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => LoginPage.create(msgGoBack: msgGoBack),
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
          builder: (_) => WorkWithUsPage.create(),
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
          builder: (_) => OurProductsPage.create(typeVehicle!),
        );
      case ProductPage.route:
        final cat = settings.arguments as Category?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ProductPage.create(cat!),
        );
      case DetailProductPage.route:
        final cat = settings.arguments as DetailProductPageArg?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => DetailProductPage(cat!),
        );
      case SearchMyProductPage.route:
        final cat = settings.arguments as Category?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => SearchMyProductPage(cat!),
        );
      case PromotionsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PromotionsPage.create(),
        );
      case PromotionPage.route:
        final args = settings.arguments as PromotionArgs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PromotionPage.create(args!),
        );
      case DetailSaleRent.route:
        final promotion = settings.arguments as Promotion?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => DetailSaleRent.create(promotion!),
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
          builder: (_) => ServicesPage.create(),
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
          builder: (_) => FormationsPage.create(),
        );
      case SkillFormationPage.route:
        final Formations? formations = settings.arguments as Formations?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => SkillFormationPage(formations!),
        );
      case AboutUsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AboutUsPage.create(),
        );
      case ShoppingCartPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ShoppingCartPage.create(),
        );
      case DetailFormationPage.route:
        final Formation? formation = settings.arguments as Formation?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => DetailFormationPage(formation!),
        );
      case EnrollTrainingPage.route:
        final Formation? formation = settings.arguments as Formation?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => EnrollTrainingPage.create(formation!),
        );
      case MyAccountPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyAccountPage.create(),
        );
      case MyContractsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyContractsPage.create(),
        );
      case ContractDetailPage.route:
        final contract = settings.arguments as Contrats?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ContractDetailPage.create(contract!),
        );
      case MyBudgetPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyBudgetPage.create(),
        );
      case BudgetDetailPage.route:
        final Budget? budget = settings.arguments as Budget?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => BudgetDetailPage.create(budget!),
        );
      case MyOrdersPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyOrdersPage.create(),
        );
      case OrderDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const OrderDetailPage(),
        );
      case AlbaranDetailPage.route:
        final Albaran? albaran = settings.arguments as Albaran?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AlbaranDetailPage.create(albaran!),
        );
      case WarrantyDetailPage.route:
        final Warranty? warranty = settings.arguments as Warranty?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => WarrantyDetailPage.create(warranty!),
        );
      case BillDetailPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const BillDetailPage(),
        );
      case MyTrainingAndEventsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyTrainingAndEventsPage.create(),
        );
      case MySatPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MySatPage.create(),
        );
      case Modelo347Page.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => Modelo347Page.create(),
        );
      case MyNotificationsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyNotificationsPage.create(),
        );
      case EventsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const EventsPage(),
        );
      case OtherEventPage.route:
        final event = settings.arguments as Events?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OtherEventPage(event!),
        );
      case EnrollEventPage.route:
        final event = settings.arguments as Events?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => EnrollEventPage.create(event!),
        );
      case EventsVemarePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => EventsVemarePage.create(),
        );
      case MyEventsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => MyEventsPage.create(),
        );
      case EventDetailPage.route:
        final event = settings.arguments as EventsVemare?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => EventDetailPage(event!),
        );
      case WorkshopNetworksPage.route:
        final int? id = settings.arguments as int?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => WorkshopNetworksPage.create(id),
        );
      case WhereWeArePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => WhereWeArePage.create(),
        );
      case NewsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => NewsPage.create(),
        );
      case LibraryPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => LibraryPage.create(),
        );
      case PillsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PillsPage.create(),
        );
      case OurHistoryPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const OurHistoryPage(),
        );
      case OtherEventsListPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OtherEventsListPage.create(),
        );
      case ContractPMPDetailPage.route:
        final contrat = settings.arguments as ContratoPmp?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ContractPMPDetailPage.create(contrat!),
        );
      case SatDetailPage.route:
        final data = settings.arguments as Intervenciones?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => SatDetailPage.create(data!),
        );
      case NewsDetailPage.route:
        final data = settings.arguments as News?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => NewsDetailPage(data!),
        );
      case LibraryDetailPage.route:
        final data = settings.arguments as Library?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => LibraryDetailPage(data!),
        );
      case PillsDetailPage.route:
        final data = settings.arguments as Pills?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PillsDetailPage(data!),
        );
      case SatPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => SatPage.create(),
        );
      case SatIntroPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SatIntroPage(),
        );

      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
