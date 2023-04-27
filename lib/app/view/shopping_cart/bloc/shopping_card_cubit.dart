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
    emit(state.copyWith(products: products, loading: false));
  }

  Future<void> deleteProduct(int id) async {
    unawaited(_shoppingCardRepository.shoppingDelete(id: id));
    _carCounterCubit.deleteProduct();
    emit(
      state.copyWith(
        products: state.products.where((e) => e.id != id).toList(),
      ),
    );
  }
}
