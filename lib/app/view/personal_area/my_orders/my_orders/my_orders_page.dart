import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders/bloc/my_orders_state.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_details/warranty_details_page.dart';
import 'package:vemare/app/view/personal_area/widgets/albaran.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/personal_area/widgets/warranty.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

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
              return ListView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                children: [
                  spacerS,
                  const Text('Mis pedidos', style: AppTextStyle.h2Style),
                  Text(
                    LocalDataRepository().user?.name ?? '',
                    style: AppTextStyle.h3Style.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  spacerM,
                  MyIconButton(
                    onPressed: () {
                      myFilters(context).then((filter) {
                        if (filter != null) {
                          cubit.getMyOrders(filter: filter);
                        }
                      });
                    },
                    text: 'Aplicar filtros',
                    icon: Image.asset(
                      'assets/icons/Filtro.png',
                      scale: 2,
                    ),
                    variant: MyButtonVariant.outlinedBold,
                  ),
                  if (state.filterPedidos != null)
                    FiltersAppliedWidget(state.filterPedidos!),
                  spacerL,
                  if (!state.loading && state.orders.isEmpty)
                    const NoExistWidget('pedidos'),
                  if (state.loading)
                    ...List.generate(
                        3,
                        (_) => const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: MyShimmer(
                                  height: 230, margin: EdgeInsets.zero),
                            )),
                  if (!state.loading)
                    ...state.orders.map((e) => AlbaranCard(e)).toList(),
                  // MyIconButton(
                  //   onPressed: () {},
                  //   text: 'Firmar',
                  //   icon: Image.asset(
                  //     'assets/icons/firma.png',
                  //     scale: 2,
                  //   ),
                  // ),
                  // spacerM?,
                ],
              );
            },
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
              return ListView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                children: [
                  spacerS,
                  const Text('Mis garantías', style: AppTextStyle.h2Style),
                  Text(
                    LocalDataRepository().user?.name ?? '',
                    style: AppTextStyle.h3Style.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  spacerM,
                  Visibility(
                    visible: state.statusWarranty != null,
                    replacement: const MyShimmer(
                      margin: EdgeInsets.zero,
                      height: 55,
                      borderRadius: 30,
                    ),
                    child: MyIconButton(
                      onPressed: () {
                        myFilters(context,
                                estadosSustitucion:
                                    state.statusWarranty!.estadosSustitucion,
                                estadosTramitacion:
                                    state.statusWarranty!.estadosTramitacion)
                            .then((filter) {
                          if (filter != null) {
                            cubit.getMyWarranty(filter: filter);
                          }
                        });
                      },
                      text: 'Aplicar filtros',
                      icon: Image.asset(
                        'assets/icons/Filtro.png',
                        scale: 2,
                      ),
                      variant: MyButtonVariant.outlinedBold,
                    ),
                  ),
                  if (state.filterGarantias != null)
                    FiltersAppliedWidget(state.filterGarantias!),
                  spacerL,
                  if (state.guarantee.isNotEmpty && !state.loading)
                    const _Total(),
                  spacerL,
                  if (!state.loading && state.guarantee.isEmpty)
                    const NoExistWidget('garantías'),
                  if (state.loading)
                    ...List.generate(
                        3,
                        (_) => const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: MyShimmer(
                                  height: 160, margin: EdgeInsets.zero),
                            )),
                  if (!state.loading)
                    ...state.guarantee
                        .map(
                          (e) => WarrantyCard(
                            e,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                WarrantyDetailPage.route,
                                arguments: e,
                              );
                            },
                          ),
                        )
                        .toList(),
                ],
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
            padding: const EdgeInsets.all(15),
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
              return ListView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                children: [
                  spacerS,
                  const Text('Mis abonos', style: AppTextStyle.h2Style),
                  Text(
                    LocalDataRepository().user?.name ?? '',
                    style: AppTextStyle.h3Style.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  spacerM,
                  MyIconButton(
                    onPressed: () {
                      myFilters(context).then((filter) {
                        if (filter != null) {
                          cubit.getMyBills(filter: filter);
                        }
                      });
                    },
                    text: 'Aplicar filtros',
                    icon: Image.asset(
                      'assets/icons/Filtro.png',
                      scale: 2,
                    ),
                    variant: MyButtonVariant.outlinedBold,
                  ),
                  if (state.filterAbonos != null)
                    FiltersAppliedWidget(state.filterAbonos!),
                  spacerL,
                  if (!state.loading && state.bills.isEmpty)
                    const NoExistWidget('abonos'),
                  // spacerL,
                  if (state.loading)
                    ...List.generate(
                        3,
                        (_) => const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: MyShimmer(
                                  height: 230, margin: EdgeInsets.zero),
                            )),
                  if (!state.loading)
                    ...state.bills.map((e) => AlbaranCard(e)).toList(),
                ],
              );
            },
          );
  }
}
