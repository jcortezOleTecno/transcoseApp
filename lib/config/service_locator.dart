// ignore_for_file: always_use_package_imports

import 'package:get_it/get_it.dart';
import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/about_us_repository.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/brands_repository.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/data/home_repository.dart';
import 'package:vemare/app/data/library_repository.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/pills_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/data/workshops_repository.dart';

import '../app/data/contracts_repository.dart';
import '../app/data/encuestas_repository.dart';
import '../app/data/sat_repository.dart';

final getIt = GetIt.instance;

abstract class ServiceLocator {
  static Future<void> setup() async {
    final myApi = MyApi();
    getIt
      ..registerFactory(() => AuthRepository(myApi))
      ..registerFactory(() => HomeRepository(myApi))
      ..registerFactory(() => PromotionRepository(myApi))
      ..registerFactory(() => ProductsRepository(myApi))
      ..registerFactory(() => ServicesRepository(myApi))
      ..registerFactory(() => WorkShopsRepository(myApi))
      ..registerFactory(() => BrandsRepository(myApi))
      ..registerFactory(() => NoticesRepository(myApi))
      ..registerFactory(() => LibraryRepository(myApi))
      ..registerFactory(() => PillsRepository(myApi))
      ..registerFactory(() => CenterRepository(myApi))
      ..registerFactory(() => FormationsRepository(myApi))
      ..registerFactory(() => EventsRepository(myApi))
      ..registerFactory(() => WorkWithUsRepository(myApi))
      ..registerFactory(() => ShoppingCardRepository(myApi))
      ..registerFactory(() => BudgetRepository(myApi))
      ..registerFactory(() => MyAccountRepository(myApi))
      ..registerFactory(() => ContratsRepository(myApi))
      ..registerFactory(() => SatRepository(myApi))
      ..registerFactory(() => EncuestasRepository(myApi))
      ..registerFactory(() => AboutUsRepository(myApi));
  }
}
