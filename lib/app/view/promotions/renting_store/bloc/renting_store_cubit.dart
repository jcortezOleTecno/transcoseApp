import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/pay_response.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';
import 'package:vemare/app/view/promotions/renting_store/bloc/renting_store_state.dart';

class RentingStoreCubit extends Cubit<RentingStoreState> {
  RentingStoreCubit(
    this._shoppingCardRepository,
    StoreArgs arg,
  ) : super(RentingStoreState(arg: arg));

  final ShoppingCardRepository _shoppingCardRepository;

  void selectType(String? value) {
    emit(state.copyWith(tarjeta: !state.tarjeta, type: value == 'Tarjeta' ? 'CARD' : 'CREDIT'));
  }

  Future<void> orderPaymentUnique() async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      PayResponse data = await _shoppingCardRepository.roderPaymentUnique(
        type: state.type  ?? 'CREDIT',
        idProduct: state.arg!.promotion.id.toString(),
        quantity: state.arg!.quantity,
        renting: !state.arg!.isTienda,
      );
      emit(state.copyWith(payResponse: data, status: FormStatus.done));
    } catch (e) {
      emit(state.copyWith(
        payResponse: PayResponse(message: e.toString()),
        status: FormStatus.error,
      ));
    }
  }
}
