import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/view/shared/shopping_car_counter_bloc/car_counter_cubit.dart';
import 'package:vemare/app/view/shopping_cart/bloc/shopping_cart_state.dart';

class ShoppingCardCubit extends Cubit<ShoppingCardState> {
  ShoppingCardCubit(
    this._shoppingCardRepository,
    this._carCounterCubit,
  ) : super(const ShoppingCardState()) {
    fetchData();
  }

  final ShoppingCardRepository _shoppingCardRepository;
  final CarCounterCubit _carCounterCubit;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    var products = await _shoppingCardRepository.getProducts();
    int counterTemp = 0;
    for (var e in products) {
      counterTemp = e.quantity! + counterTemp;
    }

    emit(state.copyWith(
        products: products, counter: counterTemp, loading: false));
  }

  Future<void> deleteProduct({required int id, required int quantity}) async {
    unawaited(_shoppingCardRepository.shoppingDelete(id: id));
    _carCounterCubit.deleteProduct(quantity);
    emit(
      state.copyWith(
        products: state.products.where((e) => e.id != id).toList(),
        counter: state.counter - quantity,
      ),
    );
  }

  void buy() {
    var total = 0.0;
    for (var e in state.products) {
      var totalTemp =
          e.quantity!.toDouble() * double.parse(e.promotionPriceLowered!);
      total = total + totalTemp;
    }

    emit(state.copyWith(buying: true, total: total));
  }

  void cancelBuy() {
    emit(state.copyWith(buying: false, typePaySelected: false));
  }

  void typePaySelect(String value) {
    emit(state.copyWith(
      isCard: value == 'Tarjeta',
      typePaySelected: true,
    ));
  }
}
