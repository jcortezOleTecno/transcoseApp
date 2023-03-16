import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/product.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/view/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._localDataRepository,
    this._promotionsRepository,
    this._productsRepository,
    this._servicesRepository,
    this._workShopsRepository,
    this._noticesRepository,
  ) : super(HomeState(
            user: _localDataRepository.user,
            isLogged: _localDataRepository.isLogged)) {
    fetchData();
  }

  final LocalDataRepository _localDataRepository;
  final PromotionRepository _promotionsRepository;
  final ProductsRepository _productsRepository;
  final ServicesRepository _servicesRepository;
  final WorkShopsRepository _workShopsRepository;
  final NoticesRepository _noticesRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    List<Product> products = [];
    List<Promotion> promotions = [];
    List<Services> services = [];
    List<WorkShop> workShops = [];
    List<Notices> notices = [];

    await Future.wait([
      _productsRepository.getProducts().then((v) => products = v),
      _promotionsRepository.getPromociones().then((v) => promotions = v),
      _servicesRepository.getServices().then((v) => services = v),
      _workShopsRepository.getWorkShops().then((v) => workShops = v),
      _noticesRepository.getNotices().then((v) => notices = v),
    ]);

    emit(state.copyWith(
      loading: false,
      promotions: promotions,
      products: products,
      services: services,
      workshop: workShops,
      notices: notices,
    ));
  }
}
