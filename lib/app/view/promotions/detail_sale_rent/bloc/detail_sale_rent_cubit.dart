import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/bloc/detail_sale_rent_state.dart';

class DetailSaleRentCubit extends Cubit<DetailSaleRentState> {
  DetailSaleRentCubit(
    this._shoppingCardRepository,
    Promotion? promotion,
  ) : super(DetailSaleRentState(promotion: promotion));

  final ShoppingCardRepository _shoppingCardRepository;

  void isTienda(bool value) {
    emit(state.copyWith(isTienda: value));
  }

  void quantity(int i) {
    emit(state.copyWith(quantity: i));
  }

  Future<void> addShoppingCard() async {
    emit(state.copyWith(loading: true));

    var message = await _shoppingCardRepository.shoppingAdd(
        id: state.promotion!.id, quantity: state.quantity);

    emit(state.copyWith(
      loading: false,
      message: message,
      adds: state.adds + 1,
    ));
  }
}
