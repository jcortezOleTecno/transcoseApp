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
    var data = await _shoppingCardRepository.getProducts();
    addProduct(quantity: data.length);
  }

  void addProduct({required int quantity}) {
    emit(state.copyWith(products: quantity));
  }

  void deleteProduct() {
    emit(state.copyWith(products: state.products - 1));
  }
}
