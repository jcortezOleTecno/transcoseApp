import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/main.dart';

import '../details/contract_detail.dart';
import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';

class CRD extends StatelessWidget {
  const CRD({
    Key? key,
    required this.scrollBottomBarController
  }) : super(key: key);

  final ScrollController scrollBottomBarController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();
    return SingleChildScrollView(
      controller: scrollBottomBarController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contratos CRD', style: AppTextStyle.h1Style),
                const UserName(),
                spacerM,
                BlocBuilder<MyContratsCubit, MyContratsState>(
                  builder: (context, state) {
                    return MyIconButton(
                      onPressed: () {
                        myFilters(context).then((filter) {
                          if (filter != null) {
                            cubit.getCRD(filter: filter);
                          }
                        });
                      },
                      text: state.filtersCRD != null
                          ? 'Modificar filtros'
                          : 'Aplicar filtros',
                      icon: Image.asset(
                        'assets/icons/Filtro.png',
                        scale: 2,
                      ),
                      variant: MyButtonVariant.outlinedBold,
                    );
                  },
                ),
                BlocBuilder<MyContratsCubit, MyContratsState>(
                  builder: (context, state) {
                    if (state.filtersCRD != null) {
                      return FiltersAppliedWidget(state.filtersCRD!,
                          onTap: () => cubit.getCRD(reset: true));
                    }
                    return const SizedBox();
                  },
                ),
                //spacerL,
                BlocBuilder<MyContratsCubit, MyContratsState>(
                  builder: (context, state) {

                    return Column(
                      children: [
                        if (state.loading)...[
                          spacerL,
                          const MyShimmer(
                            margin: EdgeInsets.zero,
                            height: 500,
                            borderRadius: 12,
                          )
                        ]else...[
                          if (state.crd.isEmpty)...[
                            const NoExistWidget('contratos'),
                            spacerM,spacerM,spacerM,spacerM,
                          ]else...[
                            spacerL,
                            const _CRD(),
                          ]
                        ]
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

class _CRD extends StatelessWidget {
  const _CRD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();

    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {

        double hSize = 200;
        if(state.dataCRDFiltrado!.rowCount <= 5){
          if(state.dataCRDFiltrado!.rowCount > 2){
            hSize = hSize + (20 * state.dataCRDFiltrado!.rowCount);
          }
        }else{
          hSize = 500;
        }

        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerS,
                    const Text(
                      'Documentos',
                      style: AppTextStyle.h3Style,
                    ),
                    Text('${state.dataCRDFiltrado!.rowCount} Total'),
                    spacerM,
                    MySearchInput(
                      hintText: 'Buscar por palabras claves...',
                      onChanged: cubit.filtroCRD,
                      fillColor: AppColor.blue50,
                      borderSideColor: AppColor.blue100,
                    ),
                  ],
                ),
              ),
              spacerS,
              SizedBox(
                height: hSize,
                child: PaginatedDataTable2(
                  wrapInCard: false,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 850,
                  empty: const NoResultTable(),
                  rowsPerPage: state.dataCRDFiltrado!.rowCount <= 10 ? state.dataCRDFiltrado!.rowCount : 10,
                  columns: const [
                    DataColumn2(
                      label: Text('FECHA'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('FIRMADO'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('CÓDIGO CONTRATO'),
                      fixedWidth: 130,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('NÚMERO PROYECTO'),
                      fixedWidth: 130,
                      // size: ColumnSize.L,
                    ),
                    // DataColumn2(
                    //   label: Text('ASUNTO'),
                    //   fixedWidth: 100,
                    //   // size: ColumnSize.L,
                    // ),
                    DataColumn2(
                      label: Text('FECHA PRESUPUESTO'),
                      fixedWidth: 150,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('IMPORTE PRESUPUESTO'),
                      fixedWidth: 150,
                      // size: ColumnSize.L,
                    ),
                  ],
                  source: state.dataCRDFiltrado!,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyDataCRD extends DataTableSource {
  final List<Contrats> data;

  MyDataCRD(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].fecha ?? '')),
      DataCell(Text((data[index].firmado ?? false) ? "SI" : "NO")),
      DataCell(Text(data[index].codigoContrato?.toString() ?? '')),
      DataCell(Text(data[index].numeroProyecto ?? '')),
      //DataCell(Text(data[index].asunto ?? '')),
      DataCell(Text(data[index].fechaPresupuesto ?? '')),
      DataCell(Row(
        children: [
          Expanded(child: Text("${data[index].importePresupuesto}€")),
          IconButton(
              onPressed: () => navigator.pushNamed(ContractDetailPage.route,
                  arguments: data[index]),
              icon: Image.asset(
                "assets/icons/arrow_next.png",
                scale: 2,
              ))
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
