import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_status.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_data_warranty.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_state.dart';

import 'my_data_orders.dart';

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
    int? totalImporteVemare;
    int? totalImporteCliente;
    int? totalImporteGarantias;

    await Future.wait([
      _myAccountRepository
          .getMyOrders()
          .then((v) => orders.addAll(v.data as List<Albaran>)),
      _myAccountRepository.getWarranties().then((v) {
        guarantee.addAll(v.data as List<Warranty>);
        totalImporteVemare = v.totalImporteVemare;
        totalImporteCliente = v.totalImporteCliente;
        totalImporteGarantias = v.totalImporteGarantia;
      }),
      _myAccountRepository.getMyBills().then((v) {
        bills.addAll(v.data as List<Albaran>);
      }),
      _myAccountRepository.getStatusWarranty().then((value) => status = value),
    ]);

    emit(state.copyWith(
      orders: orders,
      guarantee: guarantee,
      bills: bills,
      statusWarranty: status,
      totalImporteCliente: totalImporteCliente,
      totalImporteVemare: totalImporteVemare,
      totalImporteGarantias: totalImporteGarantias,
      dataPedidos: MyDataOrders(orders, 'pedido'),
      dataPedidosFiltrado: MyDataOrders(orders, 'pedido'),
      dataGarantias: MyDataWarranty(guarantee),
      dataGarantiasFiltrado: MyDataWarranty(guarantee),
      dataAbonos: MyDataOrders(bills, 'abono'),
      dataAbonosFiltrado: MyDataOrders(bills, 'abono'),
      loading: false,
    ));
  }

  Future<void> getMyOrders({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filterPedidos: null));
    var data = await _myAccountRepository.getMyOrders(filter: filter);
    emit(state.copyWith(
      orders: data.data as List<Albaran>,
      loading: false,
      filterPedidos: reset ? null : data.filter,
      dataPedidos: MyDataOrders((data.data as List<Albaran>), 'pedido'),
      dataPedidosFiltrado: MyDataOrders((data.data as List<Albaran>), 'pedido'),
    ));
  }

  Future<void> getMyWarranty({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filterGarantias: null));
    var data = await _myAccountRepository.getWarranties(filter: filter);
    emit(state.copyWith(
      guarantee: data.data as List<Warranty>,
      filterGarantias: reset ? null : data.filter,
      totalImporteCliente: data.totalImporteCliente,
      totalImporteVemare: data.totalImporteVemare,
      totalImporteGarantias: data.totalImporteGarantia,
      dataGarantias: MyDataWarranty(data.data as List<Warranty>),
      dataGarantiasFiltrado: MyDataWarranty(data.data as List<Warranty>),
      loading: false,
    ));
  }

  Future<void> getMyBills({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filterAbonos: null));
    var data = await _myAccountRepository.getMyBills(filter: filter);
    emit(state.copyWith(
      bills: data.data as List<Albaran>,
      loading: false,
      filterAbonos: reset ? null : data.filter,
      dataAbonos: MyDataOrders((data.data as List<Albaran>), 'abono'),
      dataAbonosFiltrado: MyDataOrders((data.data as List<Albaran>), 'abono'),
    ));
  }

  void filtroPedidos(String? value) {
    emit(
      state.copyWith(
        dataPedidosFiltrado: MyDataOrders(
            state.orders.where((e) {
              return e
                  .toFilter()
                  .toLowerCase()
                  .contains(value!.trim().toLowerCase());
            }).toList(),
            'pedido'),
      ),
    );
  }

  void filtroGarantia(String? value) {
    emit(
      state.copyWith(
        dataGarantiasFiltrado: MyDataWarranty(
          state.guarantee.where((e) {
            return e
                .toFilter()
                .toString()
                .toLowerCase()
                .contains(value!.trim().toLowerCase());
          }).toList(),
        ),
      ),
    );
  }

  void filtroAbono(String? value) {
    emit(
      state.copyWith(
        dataAbonosFiltrado: MyDataOrders(
            state.bills.where((e) {
              return e
                  .toFilter()
                  .toString()
                  .toLowerCase()
                  .contains(value!.trim().toLowerCase());
            }).toList(),
            'abono'),
      ),
    );
  }
}
