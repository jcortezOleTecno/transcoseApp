import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';

import 'car_counter_state.dart';

class CarCounterCubit extends Cubit<CarCounterState> {
  CarCounterCubit(this._shoppingCardRepository)
      : super(const CarCounterState()) {
    getProducts();
  }

  final ShoppingCardRepository _shoppingCardRepository;

  Future<void> getProducts() async {
    try {
      var data = await _shoppingCardRepository.getProducts();
      int counter = 0;
      for (var e in data) {
        counter = e.quantity! + counter;
      }
      addProduct(quantity: counter);
    } catch (e) {
      log("No tienes promociones en tu carrito");
    }
  }

  void addProduct({required int quantity}) {
    emit(state.copyWith(products: quantity));
  }

  void deleteProduct(int quantity) {
    emit(state.copyWith(products: state.products - quantity));
  }
}
