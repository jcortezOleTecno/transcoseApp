import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/SAT/details/sat_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';
import 'package:vemare/main.dart';

import 'bloc/my_sat_state.dart';
import 'bloc/my_sat_cubit.dart';

class MySatPage extends StatelessWidget {
  const MySatPage._();
  static const route = '/sat';

  static Widget create() {
    return BlocProvider(
      create: (context) => MySatCubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const MySatPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MySatCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return Scaffold(
      body: MyBody(
        child: permissions!.where((e) => e.id == 4).isEmpty && isEmpleado
            ? const AccessDeniedWidget()
            : BlocBuilder<MySatCubit, MySatState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('SAT', style: AppTextStyle.h1Style),
                        Text(
                          LocalDataRepository().user?.name ?? '',
                          style: AppTextStyle.h3Style.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        spacerM,
                        MyIconButton(
                          onPressed: () {
                            myFilters(context, status: true).then((filter) {
                              if (filter != null) {
                                cubit.getSats(filter: filter);
                              }
                            });
                          },
                          text: state.filters != null
                              ? 'Modificar filtros'
                              : 'Aplicar filtros',
                          icon: Image.asset(
                            'assets/icons/Filtro.png',
                            scale: 2,
                          ),
                          variant: MyButtonVariant.outlinedBold,
                        ),
                        if (state.filters != null)
                          FiltersAppliedWidget(state.filters!,
                              onTap: () => cubit.getSats(reset: true)),
                        spacerM,
                        if (state.loading)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: MyShimmer(
                              height: 450,
                              margin: EdgeInsets.zero,
                            ),
                          ),
                        if (!state.loading) const _SATCard(),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _SATCard extends StatelessWidget {
  const _SATCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MySatCubit>();
    return BlocBuilder<MySatCubit, MySatState>(
      builder: (context, state) {
        return SizedBox(
          height: 450,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacerS,
                      const Text(
                        'Intervenciones',
                        style: AppTextStyle.h3Style,
                      ),
                      Text('${state.dataFiltrada!.rowCount} Total'),
                      // spacerM,
                    ],
                  ),
                ),
                spacerS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtro,
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
                        label: Text('INTERVENCIÓN'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('ASUNTO'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA CIERRE'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('TALLER'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('TIPO AGRUPACIÓN'),
                        fixedWidth: 120,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('TIPO INTERVENCIÓN'),
                        fixedWidth: 170,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: state.dataFiltrada!,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyDataSAT extends DataTableSource {
  final List<Intervenciones> data;

  MyDataSAT(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(
        onLongPress: () => navigator.pushNamed(
              SatDetailPage.route,
              arguments: data[index],
            ),
        cells: [
          DataCell(Text(data[index].codigoIntervencion.toString())),
          DataCell(Text(data[index].fechaIntervencion ?? '')),
          DataCell(Text(data[index].asuntoIntervencion ?? '')),
          DataCell(Text(data[index].fechaCierreIntervencion ?? '')),
          DataCell(Text(data[index].taller ?? '')),
          DataCell(Text(data[index].tipoAgrupacion ?? '')),
          DataCell(Row(
            children: [
              Expanded(child: Text(data[index].tipoIntervencion ?? '')),
              Image.asset('assets/icons/arrow_next.png', scale: 2)
            ],
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
