import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/campus_model.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/pills.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/domain/model/rrhh_models.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/type_of_vehicle.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/we_help_you.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/view/about_us/about_us_page.dart';
import 'package:vemare/app/view/claims/claims_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/library/library_details/library_detail.dart';
import 'package:vemare/app/view/library/library_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_notifications/my_notifications_page.dart';
import 'package:vemare/app/view/my_services/campus/campus_page.dart';
import 'package:vemare/app/view/my_services/campus/provider/campus_detail_provider.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_detail_page.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_test.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_test_question.dart';
import 'package:vemare/app/view/my_services/events/other_events/available_destinations/available_destinations_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/enroll_event.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/event_detail_page.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/events_vemare_page.dart';
import 'package:vemare/app/view/my_services/events/my_events/my_events_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_event_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_events_list.dart';
import 'package:vemare/app/view/my_services/formations/available_destinations_formations/available_destinations_formations_page.dart';
import 'package:vemare/app/view/news/news_details/news_detail.dart';
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
import 'package:vemare/app/view/my_services/formations/skillful_formation/skillful_formation.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/products_categories/our_products_page.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/search_my_product/search_my_product_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle/type_of_vehicle_page.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/budget_detail.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/my_budget_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details/contract_detail.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details_pmp/contract_pmp_detail.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/my_contracts_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_details/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty/warranty_details/warranty_details_page.dart';
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
import 'package:vemare/app/view/work_with_us/work_with_us_general.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_home.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';
import 'package:vemare/app/view/workshop_networks/workshop_networks_page.dart';

import '../domain/model/contrato_pmp.dart';
import 'my_services/sat/sat_intro_page.dart';
import 'my_services/sat/sat_page.dart';
import 'pills/pills_details.dart';
import 'promotions/promotion/promotion_page.dart';
import 'recover_password/recover_password_page.dart';

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
      case RecoverPasswordPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => RecoverPasswordPage.create(),
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
        final workWithUs = settings.arguments as WorkWithUs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => WorkWithUsPage.create(workWithUs!),
        );
      case WorkWithUsHome.route:
        final workWithUs = settings.arguments as WorkWithUs;
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => WorkWithUsHome(workWithUs: workWithUs,)
        );
      case ClaimsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ClaimsPage(),
        );
      case TypeOfVehiclePage.route:
        final category = settings.arguments as Category?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => TypeOfVehiclePage.create(category),
        );
      case OurProductsPage.route:
        final typeVehicle = settings.arguments as TypeOfVehicle?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OurProductsPage.create(typeVehicle!),
        );
      case ProductPage.route:
        final cat = settings.arguments as SearchArgs?;
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
        final args = settings.arguments as SearchArgs?;
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
        final args = settings.arguments as StoreArgs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => RentingStorePage.create(args!),
        );
      case CardPaymentPage.route:
        final args = settings.arguments as StoreArgs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CardPaymentPage(args!),
        );
      case PaymentPage.route:
        final args = settings.arguments as StoreArgs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PaymentPage(args!),
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
      case WorkWithUsGeneral.route:
        final event = settings.arguments as RrhhModels?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => WorkWithUsGeneral(rrhhModels: event!),
        );
      case FormationsPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => FormationsPage.create(),
        );
      case SkillFormationPage.route:
        final TrainigGroup? formations = settings.arguments as TrainigGroup?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => SkillFormationPage.create(formations!),
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
      case CampusPage.route:
        var campusArg = settings.arguments as CampusArg?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CampusPage(
            title: campusArg!.title,
            image: campusArg.image,
            description: campusArg.description,
          ),
        );
      case CampusDetailPage.route:
        final CampusModel campusModel = settings.arguments as CampusModel;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CampusDetailPage(campusModel: campusModel),
        );
      case CampusTest.route:
        final CampusDetailProvider campusModel = settings.arguments as CampusDetailProvider;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CampusTest(campusDetailProvider: campusModel),
        );
      case CampusTestQuestion.route:
        final List campusModel = settings.arguments as List;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CampusTestQuestion(campusDetailProvider: campusModel[0],viewResult: campusModel[1],testResult: campusModel[2]),
        );
      case EnrollTrainingPage.route:
        final args = settings.arguments as EnrollTrainingPageArg?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => EnrollTrainingPage.create(args!),
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

      case AlbaranDetailPage.route:
        final arg = settings.arguments as AlbaranDetailArg?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AlbaranDetailPage.create(arg!),
        );
      case WarrantyDetailPage.route:
        final Warranty? warranty = settings.arguments as Warranty?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => WarrantyDetailPage.create(warranty!),
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
          builder: (_) => EventsPage.create(),
        );
      case OtherEventPage.route:
        final event = settings.arguments as Events?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OtherEventPage(event!),
        );
      case EnrollEventPage.route:
        final event = settings.arguments as EnrollEventPageArgs?;
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
        final event = settings.arguments as Map;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => EventDetailPage(event['event'],anio: event['anio']),
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
        final title = settings.arguments as String;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OurHistoryPage(title: title),
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
          builder: (_) => NewsDetailPage.create(data!),
        );
      case LibraryDetailPage.route:
        final data = settings.arguments as Library?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => LibraryDetailPage.create(data!),
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
        final data = settings.arguments as WeHelpYouData?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => SatIntroPage(data!),
        );
      case AvailableDestinationsPage.route:
        final event = settings.arguments as Events?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AvailableDestinationsPage.create(event!),
        );
      case AvailableDestinationsFormationsPage.route:
        final data = settings.arguments as Formation?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AvailableDestinationsFormationsPage.create(data!),
        );
    /*case ShippingDataPage.route:
        final data = settings.arguments as ShoppingCarArgs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ShippingDataPage(data!),
        );
      case DataPayPage.route:
        final data = settings.arguments as ShoppingCarArgs?;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => DataPayPage(data!),
        );*/

      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
