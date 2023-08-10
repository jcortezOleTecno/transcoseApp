import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_data_orders.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_data_warranty.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_state.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';
import 'package:data_table_2/data_table_2.dart';

import '../albaran_details/albaran_detail.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage._();

  static const route = '/my_orders';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyOrdersCubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const MyOrdersPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: const [
              spacerS,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TabBar(
                  labelColor: AppColor.primaryBlue,
                  indicatorColor: AppColor.primaryBlue,
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: AppColor.neutral20,
                  // physics: NeverScrollableScrollPhysics(),
                  tabs: [
                    Tab(text: 'Mis pedidos'),
                    Tab(text: 'Mis garantías'),
                    Tab(text: 'Mis abonos'),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
                indent: 15,
                endIndent: 15,
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _MyOrders(),
                    _MyWarranty(),
                    _MyBills(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyOrders extends StatelessWidget {
  const _MyOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyOrdersCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;
    return permissions!.where((e) => e.id == 7).isEmpty && isEmpleado
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: AccessDeniedWidget(),
          )
        : BlocBuilder<MyOrdersCubit, MyOrdersState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerS,
                    const Text('Mis pedidos', style: AppTextStyle.h2Style),
                    const UserName(),
                    spacerS,
                    MyIconButton(
                      onPressed: () {
                        myFilters(context).then((filter) {
                          if (filter != null) {
                            cubit.getMyOrders(filter: filter);
                          }
                        });
                      },
                      text: state.filterPedidos != null
                          ? 'Modificar filtros'
                          : 'Aplicar filtros',
                      icon: Image.asset(
                        'assets/icons/Filtro.png',
                        scale: 2,
                      ),
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    if (state.filterPedidos != null)
                      FiltersAppliedWidget(state.filterPedidos!,
                          onTap: () => cubit.getMyOrders(reset: true)),
                    spacerS,
                    if (!state.loading && state.orders.isEmpty)
                      const NoExistWidget('pedidos'),
                    if (state.loading)
                      const SizedBox(
                          height: 400,
                          child: MyShimmer.full(
                            borderRadius: 10,
                            margin: EdgeInsets.only(bottom: 20),
                          )),
                    if (!state.loading && state.orders.isNotEmpty)
                      SizedBox(
                        height: 500,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    spacerS,
                                    const Text(
                                      'Pedidos',
                                      style: AppTextStyle.h3Style,
                                    ),
                                    Text(
                                        '${state.dataPedidosFiltrado!.rowCount} Total'),
                                    // spacerM,
                                  ],
                                ),
                              ),
                              spacerS,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: MySearchInput(
                                  hintText: 'Buscar por palabras claves...',
                                  onChanged: cubit.filtroPedidos,
                                ),
                              ),
                              spacerS,
                              Expanded(
                                child: PaginatedDataTable2(
                                  wrapInCard: false,
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  minWidth: 1000,
                                  // smRatio: 0.5,
                                  columns: const [
                                    DataColumn2(
                                      label: Text('N° DOCUMENTO'),
                                      fixedWidth: 100,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('FECHA'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('CONTADOR'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('MODO DE ENTREGA'),
                                      fixedWidth: 125,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('ALMACÉN'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('IMPORTE'),
                                      fixedWidth: 100,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('ESTADO'),
                                      fixedWidth: 170,
                                      // size: ColumnSize.L,
                                    ),
                                  ],
                                  source: state.dataPedidosFiltrado!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
  }

  onTap(BuildContext context, Albaran albaran) {
    return Navigator.of(context).pushNamed(
      AlbaranDetailPage.route,
      arguments: albaran,
    );
  }
}

class StatusLabelWidget extends StatelessWidget {
  const StatusLabelWidget(this.facturado, {super.key});

  final bool facturado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: facturado ? AppColor.success200 : AppColor.error200,
      ),
      child: Text(
        facturado ? '• Facturado' : '• No Facturado',
        style: AppTextStyle.inputLabelStyle.copyWith(
            color: facturado ? AppColor.success500 : AppColor.error500),
      ),
    );
  }
}

class _MyWarranty extends StatelessWidget {
  const _MyWarranty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyOrdersCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return permissions!.where((e) => e.id == 12).isEmpty && isEmpleado
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: AccessDeniedWidget(),
          )
        : BlocBuilder<MyOrdersCubit, MyOrdersState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerS,
                    const Text('Mis garantías', style: AppTextStyle.h2Style),
                    const UserName(),
                    spacerS,
                    MyIconButton(
                      onPressed: () {
                        myFilters(context).then((filter) {
                          if (filter != null) {
                            cubit.getMyWarranty(filter: filter);
                          }
                        });
                      },
                      text: state.filterGarantias != null
                          ? 'Modificar filtros'
                          : 'Aplicar filtros',
                      icon: Image.asset(
                        'assets/icons/Filtro.png',
                        scale: 2,
                      ),
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    if (state.filterGarantias != null)
                      FiltersAppliedWidget(state.filterGarantias!,
                          onTap: () => cubit.getMyWarranty(reset: true)),
                    spacerS,
                    // spacerL,
                    if (state.guarantee.isNotEmpty && !state.loading)
                      const _Total(),
                    spacerS,
                    if (!state.loading && state.guarantee.isEmpty)
                      const NoExistWidget('garantías'),
                    if (state.loading)
                      const SizedBox(
                          height: 400,
                          child: MyShimmer.full(
                            borderRadius: 10,
                            margin: EdgeInsets.only(bottom: 20),
                          )),
                    if (!state.loading && state.guarantee.isNotEmpty)
                      SizedBox(
                        height: 500,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    spacerS,
                                    const Text(
                                      'Garantías',
                                      style: AppTextStyle.h3Style,
                                    ),
                                    Text(
                                        '${state.dataGarantiasFiltrado!.rowCount} Total'),
                                    // spacerM,
                                    spacerS,
                                    MySearchInput(
                                      hintText: 'Buscar por palabras claves...',
                                      onChanged: cubit.filtroGarantia,
                                    ),
                                    spacerS,
                                  ],
                                ),
                              ),
                              Expanded(
                                child: PaginatedDataTable2(
                                  wrapInCard: false,
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  minWidth: 1000,
                                  // smRatio: 0.5,
                                  columns: const [
                                    DataColumn2(
                                      label: Text('NÚMERO'),
                                      fixedWidth: 100,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('FECHA'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('CENTRO'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('VISAR'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('IMPORTE'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('LÍNEA'),
                                      fixedWidth: 100,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('FIRMADO'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('ESTADO SU'),
                                      fixedWidth: 120,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('ESTADO TR'),
                                      fixedWidth: 120,
                                      // size: ColumnSize.L,
                                    ),
                                  ],
                                  source: state.dataGarantiasFiltrado!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
  }
}

class _Total extends StatelessWidget {
  const _Total({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'TOTAL IMPORTE VEMARE:',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
                    Text(fmf
                        .copyWith(amount: state.totalImporteVemare!.toDouble())
                        .output
                        .symbolOnRight),
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'TOTAL IMPORTE CLIENTE:',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
                    Text(fmf
                        .copyWith(amount: state.totalImporteCliente!.toDouble())
                        .output
                        .symbolOnRight),
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'TOTAL IMPORTE GARANTÍAS:',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
                    Text(fmf
                        .copyWith(
                            amount: state.totalImporteGarantias!.toDouble())
                        .output
                        .symbolOnRight),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MyBills extends StatelessWidget {
  const _MyBills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyOrdersCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return permissions!.where((e) => e.id == 10).isEmpty && isEmpleado
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: AccessDeniedWidget(),
          )
        : BlocBuilder<MyOrdersCubit, MyOrdersState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerS,
                    const Text('Mis abonos', style: AppTextStyle.h2Style),
                    const UserName(),
                    spacerS,
                    MyIconButton(
                      onPressed: () {
                        myFilters(context).then((filter) {
                          if (filter != null) {
                            cubit.getMyBills(filter: filter);
                          }
                        });
                      },
                      text: state.filterAbonos != null
                          ? 'Modificar filtros'
                          : 'Aplicar filtros',
                      icon: Image.asset(
                        'assets/icons/Filtro.png',
                        scale: 2,
                      ),
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    if (state.filterAbonos != null)
                      FiltersAppliedWidget(state.filterAbonos!,
                          onTap: () => cubit.getMyBills(reset: true)),
                    spacerS,
                    if (!state.loading && state.bills.isEmpty)
                      const NoExistWidget('abonos'),
                    if (state.loading)
                      const SizedBox(
                          height: 400,
                          child: MyShimmer.full(
                            borderRadius: 10,
                            margin: EdgeInsets.only(bottom: 20),
                          )),
                    if (!state.loading && state.bills.isNotEmpty)
                      SizedBox(
                        height: 500,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    spacerS,
                                    const Text(
                                      'Abonos',
                                      style: AppTextStyle.h3Style,
                                    ),
                                    Text(
                                        '${state.dataAbonosFiltrado!.rowCount} Total'),
                                    // spacerM,
                                    spacerS,
                                    MySearchInput(
                                      hintText: 'Buscar por palabras claves...',
                                      onChanged: cubit.filtroAbono,
                                    ),
                                    spacerS,
                                  ],
                                ),
                              ),
                              Expanded(
                                child: PaginatedDataTable2(
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  wrapInCard: false,
                                  minWidth: 1000,
                                  // smRatio: 0.5,
                                  columns: const [
                                    DataColumn2(
                                      label: Text('N° DOCUMENTO'),
                                      fixedWidth: 100,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('FECHA'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('CONTADOR'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('MODO DE ENTREGA'),
                                      fixedWidth: 125,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('ALMACÉN'),
                                      fixedWidth: 80,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('IMPORTE'),
                                      fixedWidth: 100,
                                      // size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('ESTADO'),
                                      fixedWidth: 170,
                                      // size: ColumnSize.L,
                                    ),
                                  ],
                                  source: state.dataAbonosFiltrado!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
  }
}
