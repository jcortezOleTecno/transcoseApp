import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../bloc/my_orders_cubit.dart';
import '../bloc/my_orders_state.dart';

class MyWarranty extends StatelessWidget {
  const MyWarranty({
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
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
                                        empty: const NoResultTable(),
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
                                            fixedWidth: 150,
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
                    ),
                    const Footer(),
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
