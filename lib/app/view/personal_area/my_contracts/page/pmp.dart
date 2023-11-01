import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details_pmp/contract_pmp_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/main.dart';

import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';

class PMP extends StatelessWidget {
  const PMP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<MyContratsCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contratos PMP', style: AppTextStyle.h1Style),
                const UserName(),
                // spacerM,
                // MyIconButton(
                //   onPressed: () {
                //     myFilters(context).then((filter) {
                //       if (filter != null) {
                //         cubit.getCRD(filter);
                //       }
                //     });
                //   },
                //   text: 'Aplicar filtros',
                //   icon: Image.asset(
                //     'assets/icons/Filtro.png',
                //     scale: 2,
                //   ),
                //   variant: MyButtonVariant.outlinedBold,
                // ),
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
                          if (state.pmp.isEmpty)...[
                            const NoExistWidget('contratos'),
                            spacerM,spacerM,spacerM,spacerM,
                          ]else...[
                            spacerL,
                            const _PMPCard(),
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

class _PMPCard extends StatelessWidget {
  const _PMPCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();
    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {

        double hSize = 200;
        if(state.dataPMPFiltrado!.rowCount <= 5){
          if(state.dataPMPFiltrado!.rowCount > 2){
            hSize = hSize + (20 * state.dataPMPFiltrado!.rowCount);
          }
        }else{
          hSize = 500;
        }

        return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                        'Documentos',
                        style: AppTextStyle.h3Style,
                      ),
                      Text('${state.dataPMPFiltrado!.rowCount} Total'),
                      spacerM,
                      MySearchInput(
                        hintText: 'Buscar por palabras claves...',
                        onChanged: cubit.filtroPMP,
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
                    horizontalMargin: 12, empty: const NoResultTable(),
                    minWidth: 700,
                    rowsPerPage: state.dataPMPFiltrado!.rowCount <= 10 ? state.dataPMPFiltrado!.rowCount : 10,
                    columns: const [
                      DataColumn2(
                        label: Text('CÓDIGO DOCUMENTO'),
                        fixedWidth: 140,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA INICIO'),
                        fixedWidth: 90,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA FIN'),
                        fixedWidth: 90,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA FIRMA'),
                        fixedWidth: 90,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FIRMADO'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('NIF PERSONA QUE FIRMA'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: state.dataPMPFiltrado!,
                  ),
                ),
              ],
            ));
      },
    );
  }
}

class MyDataPMP extends DataTableSource {
  final List<ContratoPmp> data;
  // final String codContrato;

  MyDataPMP(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].codigoContrato?.toString() ?? '')),
      DataCell(Text(data[index].fechaInicio ?? '')),
      DataCell(Text(data[index].fechaFin ?? '')),
      DataCell(Text(data[index].fechaFirma ?? '')),
      DataCell(Text((data[index].firmado ?? false)
          ? data[index].firmaPersonaquefirma ?? ""
          : "NO")),
      DataCell(Row(
        children: [
          Expanded(child: Text(data[index].nifPersonaquefirma ?? '')),
          IconButton(
              onPressed: () => navigator.pushNamed(ContractPMPDetailPage.route,
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
