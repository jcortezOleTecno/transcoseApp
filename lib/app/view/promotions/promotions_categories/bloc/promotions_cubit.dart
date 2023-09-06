import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/header.dart';
// import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/view/promotions/promotions_categories/bloc/promotions_state.dart';

class PromotionsCubit extends Cubit<PromotionsState> {
  PromotionsCubit(
    this._promotionRepository,
    this._headerRepository,
  ) : super(const PromotionsState()) {
    fetchData();
  }

  final PromotionRepository _promotionRepository;
  final HeaderRepository _headerRepository;

  Future<void> fetchData() async {
    List<Category> categories =
        await _promotionRepository.getPromocionesCategories();
    Header header = await _headerRepository.getHeaders(module: "Promotion");

    emit(state.copyWith(
      categories: categories,
      header: header,
    ));
  }

  void category(Category? category) {
    emit(state.copyWith(categorySelected: category));
  }

  void query(String? value) {
    emit(state.copyWith(query: value));
  }
}
