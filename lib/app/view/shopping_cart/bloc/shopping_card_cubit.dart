import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/pay_response.dart';
import 'package:vemare/app/domain/value_object/status.dart';
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
    try {
      var products = await _shoppingCardRepository.getProducts();

      var renting = products.where((e) => e.renting).toList();
      var tienda = products.where((e) => !e.renting).toList();

      int counterTemp = 0;
      for (var e in products) {
        counterTemp = e.quantity! + counterTemp;
      }

      _carCounterCubit.addProduct(quantity: counterTemp);

      int totalRenting = 0;
      for (var e in renting) {
        totalRenting = e.total! + totalRenting;
      }
      int totalTienda = 0;
      for (var e in tienda) {
        totalTienda = e.total! + totalTienda;
      }

      emit(
        state.copyWith(
          products: products,
          productsRenting: renting,
          productsTienda: tienda,
          counter: counterTemp,
          totalRenting: totalRenting,
          totalTienda: totalTienda,
          loading: false,
        ),
      );
    } catch (e) {
      _carCounterCubit.addProduct(quantity: 0);
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> deleteProductTienda(
      {required int id, required int quantity}) async {
    unawaited(_shoppingCardRepository.shoppingDelete(id: id));
    _carCounterCubit.deleteProduct(quantity);
    emit(
      state.copyWith(
        productsTienda: state.productsTienda.where((e) => e.id != id).toList(),
        totalTienda: state.totalTienda -
            state.productsTienda.firstWhere((e) => e.id == id).total!,
        products: state.products.where((e) => e.id != id).toList(),
        counter: state.counter - quantity,
      ),
    );
  }

  Future<void> deleteProductRenting(
      {required int id, required int quantity}) async {
    unawaited(_shoppingCardRepository.shoppingDelete(id: id));
    _carCounterCubit.deleteProduct(quantity);
    emit(
      state.copyWith(
        products: state.products.where((e) => e.id != id).toList(),
        productsRenting:
            state.productsRenting.where((e) => e.id != id).toList(),
        totalRenting: state.totalRenting -
            state.productsRenting.firstWhere((e) => e.id == id).total!,
        counter: state.counter - quantity,
      ),
    );
  }

  void buy() {
    var total = 0.0;
    for (var e in state.products) {
      var totalTemp = (e.quantity!.toDouble()) * (e.priceSale ?? 0.0);
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

  Future<void> orderPayment() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      var data = await _shoppingCardRepository.roderPayment(
          type: state.isCard ? 'CARD' : 'CREDIT');

      if (data.response == "success") {
        emit(state.copyWith(payResponse: data, status: FormStatus.done));
      } else {
        emit(state.copyWith(payResponse: data, status: FormStatus.error));
      }
    } catch (e) {
      emit(
        state.copyWith(
          payResponse: PayResponse(message: e.toString()),
          status: FormStatus.error,
        ),
      );
    }
  }
}
