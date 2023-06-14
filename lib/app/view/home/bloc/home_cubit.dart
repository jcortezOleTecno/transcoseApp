import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/brands_repository.dart';
import 'package:vemare/app/data/encuestas_repository.dart';
import 'package:vemare/app/data/home_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/hero.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/view/home/bloc/home_state.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._homeRepository,
    this._promotionsRepository,
    this._productsRepository,
    this._servicesRepository,
    this._workShopsRepository,
    this._noticesRepository,
    this._brandsRepository,
    this._userCubit,
    this._workWithUsRepository,
    // this._encuestasRepository,
  ) : super(const HomeState()) {
    fetchData();
    // encuesta();
  }

  final HomeRepository _homeRepository;
  final PromotionRepository _promotionsRepository;
  final ProductsRepository _productsRepository;
  final ServicesRepository _servicesRepository;
  final WorkShopsRepository _workShopsRepository;
  final NoticesRepository _noticesRepository;
  final BrandsRepository _brandsRepository;
  final UserCubit _userCubit;
  final WorkWithUsRepository _workWithUsRepository;
  // final EncuestasRepository _encuestasRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    List<HeroHome> hero = [];
    List<Category> products = [];
    List<Category> promotions = [];
    List<Services> services = [];
    List<WorkShop> workShops = [];
    List<News> notices = [];
    List<Brand> brands = [];
    WorkWithUs? workWithUs;

    if (_userCubit.state.employees.isEmpty) {
      unawaited(_userCubit.getEmployeesAndEnterprises());
    }
    await Future.wait([
      _homeRepository.getHero().then((v) => hero = v),
      _productsRepository
          .getProductsCategories(limit: 3)
          .then((v) => products = v),
      _promotionsRepository
          .getPromocionesCategories(limit: 3)
          .then((v) => promotions = v),
      _servicesRepository.getServices().then((v) => services = v),
      _workShopsRepository.getWorkShops().then((v) => workShops = v),
      _noticesRepository.getNotices(limit: 3).then((v) => notices = v),
      _brandsRepository.getBrands().then((v) => brands = v),
      _workWithUsRepository.getData().then((value) => workWithUs = value),
    ]);

    emit(state.copyWith(
      loading: false,
      hero: hero,
      promotions: promotions,
      products: products,
      services: services,
      workshop: workShops,
      notices: notices,
      brands: brands,
      workWithUs: workWithUs,
    ));
  }

  /*void encuesta() {
    log('################   TIMER INIT   #################');
    if (!LocalDataRepository().isLogged) return;
    Timer.periodic(const Duration(seconds: 60), (timer) {
      _encuestasRepository.getEncuestas().then((value) {
        emit(state.copyWith(encuesta: value));
        if (!state.showSurvey) {
          log('################   BORRADO   #################');
          emit(state.copyWith(encuesta: null));
        }
      });
    });
  }*/

  void showSurvey() {
    emit(state.copyWith(showSurvey: true));
  }

  void openWhatsApp({
    required String phone,
  }) async {
    String url = "https://wa.me/$phone?text=${Uri.parse('')}";
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  void openEmail({
    required String toEmail,
  }) async {
    String url =
        "mailto:$toEmail?subject=${Uri.encodeQueryComponent('prueba')}&body=${Uri.encodeQueryComponent('')}";
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }
}
