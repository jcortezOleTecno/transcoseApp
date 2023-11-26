import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
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
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../bloc/my_orders_cubit.dart';
import '../bloc/my_orders_state.dart';

class MyBills extends StatelessWidget {
  const MyBills({
    Key? key,
    required this.scrollBottomBarController
  }) : super(key: key);

  final ScrollController scrollBottomBarController;

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
                controller: scrollBottomBarController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                          if(state.loading)...[
                            const SizedBox(
                                height: 400,
                                child: MyShimmer.full(
                                  borderRadius: 10,
                                  margin: EdgeInsets.only(bottom: 20),
                                )),
                            spacerM,
                          ]else...[
                            if(state.bills.isEmpty)...[
                              const NoExistWidget('abonos',paddingTop: 40),
                              spacerM,spacerM,
                            ]else...[
                              tablaAbonos(context: context, state: state),
                            ],
                          ],
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

  Widget tablaAbonos({required BuildContext context,required MyOrdersState state}){

    final cubit = context.read<MyOrdersCubit>();

    double hSize = 350;
    if(state.dataAbonosFiltrado!.rowCount <= 5){
      if(state.dataAbonosFiltrado!.rowCount > 2){
        hSize = hSize + (20 * state.dataAbonosFiltrado!.rowCount);
      }
    }else{
      hSize = 500;
    }

    return SizedBox(
      height: hSize,
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
                    fillColor: AppColor.blue50,
                    borderSideColor: AppColor.blue100,
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
                empty: const NoResultTable(),
                minWidth: 1000,
                rowsPerPage: state.dataAbonosFiltrado!.rowCount <= 10 ? state.dataAbonosFiltrado!.rowCount : 10,
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
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                ],
                source: state.dataAbonosFiltrado!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
