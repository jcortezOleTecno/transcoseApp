import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';
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

    List<Albaran> orders = [];
    List<Warranty> guarantee = [];
    List<Albaran> bills = [];
    StatusWarranty? status;

    await Future.wait([
      _myAccountRepository.getMyOrders().then(orders.addAll),
      _myAccountRepository.getWarranties().then(guarantee.addAll),
      _myAccountRepository.getMyBills().then(bills.addAll),
      _myAccountRepository.getStatusWarranty().then((value) => status = value),
    ]);

    emit(state.copyWith(
      orders: orders,
      guarantee: guarantee,
      bills: bills,
      statusWarranty: status,
      loading: false,
    ));
  }

  Future<void> getMyOrders({Filter? filter}) async {
    emit(state.copyWith(loading: true));
    var data = await _myAccountRepository.getMyOrders(filter: filter);
    emit(state.copyWith(orders: data, loading: false));
  }

  Future<void> getMyWarranty({Filter? filter}) async {
    emit(state.copyWith(loading: true));
    var data = await _myAccountRepository.getWarranties(filter: filter);
    emit(state.copyWith(guarantee: data, loading: false));
  }

  Future<void> getMyBills({Filter? filter}) async {
    emit(state.copyWith(loading: true));
    var data = await _myAccountRepository.getMyBills(filter: filter);
    emit(state.copyWith(bills: data, loading: false));
  }
}
