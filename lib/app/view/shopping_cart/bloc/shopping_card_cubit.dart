import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/view/shopping_cart/bloc/shopping_cart_state.dart';

class ShoppingCardCubit extends Cubit<ShoppingCardState> {
  ShoppingCardCubit(
    this._shoppingCardRepository,
  ) : super(const ShoppingCardState()) {
    fetchData();
  }

  final ShoppingCardRepository _shoppingCardRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    var products = await _shoppingCardRepository.getProducts();
    emit(state.copyWith(products: products, loading: false));
  }

  Future<void> deleteProduct(int id) async {
    unawaited(_shoppingCardRepository.shoppingDelete(id: id));
    emit(
      state.copyWith(
        products: state.products.where((e) => e.id != id).toList(),
      ),
    );
  }
}
