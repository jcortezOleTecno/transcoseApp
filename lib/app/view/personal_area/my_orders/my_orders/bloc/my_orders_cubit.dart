import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(
    this._myAccountRepository,
  ) : super(const MyOrdersState()) {
    fetchData();
  }

  final MyAccountRepository _myAccountRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    List<Warranty> guarantee = [];
    List<Albaran> albaranes = [];

    await Future.wait([
      _myAccountRepository.getWarranties().then(guarantee.addAll),
      _myAccountRepository.getMyOrders().then(albaranes.addAll),
    ]);

    emit(state.copyWith(
      guarantee: guarantee,
      albaranes: albaranes,
      loading: false,
    ));
  }
}
