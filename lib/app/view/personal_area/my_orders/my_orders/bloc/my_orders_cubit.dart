import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/warranty_repository.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(
    this._warrantyRepository,
  ) : super(const MyOrdersState()) {
    fetchData();
  }

  final WarrantyRepository _warrantyRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Warranty> guarantee = [];

    await Future.wait([
      _warrantyRepository.getWarranties().then(guarantee.addAll),
    ]);
    emit(state.copyWith(
      guarantee: guarantee,
      loading: false,
    ));
  }
}
