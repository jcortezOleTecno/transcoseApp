import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/bloc/detail_sale_rent_state.dart';
import 'package:vemare/app/view/shared/shopping_car_counter_bloc/car_counter_cubit.dart';

class DetailSaleRentCubit extends Cubit<DetailSaleRentState> {
  DetailSaleRentCubit(
    this._shoppingCardRepository,
    this._carCounterCubit,
    Promotion? promotion,
  ) : super(DetailSaleRentState(promotion: promotion));

  final ShoppingCardRepository _shoppingCardRepository;
  final CarCounterCubit _carCounterCubit;

  void isTienda(bool value) {
    emit(state.copyWith(isTienda: value));
  }

  void quantity(int i) {
    emit(state.copyWith(quantity: i));
  }

  Future<void> addShoppingCard() async {
    emit(state.copyWith(loading: true));

    var message = await _shoppingCardRepository.shoppingAdd(
      id: state.promotion!.id,
      quantity: state.quantity,
      renting: state.isTienda ? 0 : 1,
    );

    unawaited(_carCounterCubit.getProducts());

    emit(state.copyWith(
      loading: false,
      message: message,
      quantity: 1,
      adds: state.adds + 1,
    ));
  }
}
