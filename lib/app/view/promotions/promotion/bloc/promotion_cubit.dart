import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/view/promotions/promotion/bloc/promotion_state.dart';

class PromotionCubit extends Cubit<PromotionState> {
  PromotionCubit(
    this._promotionRepository,
    Category? category,
    String? query,
  ) : super(PromotionState(categoryTemp: category, query: query)) {
    fetchData();
  }

  final PromotionRepository _promotionRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Promotion> promotions = [];
    List<Category> categories = [
      Category(id: 0, name: 'Todas las promociones')
    ];

    await Future.wait([
      _promotionRepository
          .getPromocionesCategories()
          .then((v) => categories.addAll(v)),
      _promotionRepository
          .getPromociones(
              categotyId: state.categoryTemp?.id ?? 0,
              search: state.query ?? '')
          .then((v) => promotions = v),
    ]);

    emit(state.copyWith(
      loading: false,
      promotions: promotions,
      categories: categories,
      category: state.categoryTemp != null
          ? categories.firstWhere((e) => e.id == state.categoryTemp!.id!)
          : null,
    ));
  }

  void category(Category? category) {
    emit(state.copyWith(category: category));
    search();
  }

  Future<void> search() async {
    emit(state.copyWith(loading: true));
    var data = await _promotionRepository.getPromociones(
        categotyId: state.category?.id ?? 0, search: state.query ?? '');
    emit(state.copyWith(loading: false, promotions: data));
  }

  void query(String? value) {
    emit(state.copyWith(query: value));
  }
}
