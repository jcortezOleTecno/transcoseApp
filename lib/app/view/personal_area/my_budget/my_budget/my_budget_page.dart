import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/budget_detail.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_cubit.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_state.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';
import 'package:vemare/main.dart';

class MyBudgetPage extends StatelessWidget {
  const MyBudgetPage._();
  static const route = '/My_budget';

  static Widget create() {
    return BlocProvider(
      create: (context) => BudgetCubit(
        getIt.get<BudgetRepository>(),
      ),
      child: const MyBudgetPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BudgetCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return Scaffold(
      body: BlocBuilder<BudgetCubit, BudgetState>(
        builder: (context, state) {
          return MyBody(
            child: permissions!.where((e) => e.id == 11).isEmpty && isEmpleado
                ? const AccessDeniedWidget()
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Mis presupuestos',
                            style: AppTextStyle.h1Style),
                        const UserName(),
                        spacerM,
                        MyIconButton(
                          onPressed: () {
                            myFilters(context).then((filter) {
                              if (filter != null) {
                                cubit.fetchData(filter: filter);
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
                              onTap: () => cubit.fetchData(reset: true)),
                        spacerM,
                        if (state.loading)
                          const MyShimmer(
                            height: 450,
                            borderRadius: 12,
                            margin: EdgeInsets.only(bottom: 20),
                          ),
                        if (!state.loading && state.budget.isEmpty)
                          const NoExistWidget('presupuestos'),
                        if (!state.loading && state.budget.isNotEmpty)
                          const _Budget(),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class _Budget extends StatelessWidget {
  const _Budget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BudgetCubit>();
    return BlocBuilder<BudgetCubit, BudgetState>(
      builder: (context, state) {
        return SizedBox(
          height: 500,
          child: Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        'Presupuestos',
                        style: AppTextStyle.h3Style,
                      ),
                      Text('${state.dataBudget!.rowCount} Total'),
                      // spacerM,
                      spacerS,
                      MySearchInput(
                        hintText: 'Buscar por palabras claves...',
                        onChanged: cubit.filtro,
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
                    minWidth: 1100,
                    // smRatio: 0.5,
                    columns: const [
                      DataColumn2(
                        label: Text('FECHA'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA CADUCIDAD'),
                        fixedWidth: 130,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('ESTADO'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FIRMADO'),
                        fixedWidth: 70,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('NÚMERO'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('ASUNTO'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('CÓDIGO'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('VERSIÓN'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('IMPORTE'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: state.dataBudget!,
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

class MyDataBudget extends DataTableSource {
  final List<Budget> data;

  MyDataBudget(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].fecha ?? '')),
      DataCell(Text(data[index].fechaCaducidad ?? '')),
      DataCell(Text(data[index].estado ?? '')),
      DataCell(Text((data[index].firmado ?? false) ? 'SI' : 'NO')),
      DataCell(Text(data[index].numero ?? '')),
      DataCell(Text(data[index].asunto ?? '')),
      DataCell(Text(data[index].codigoPresupuesto?.toString() ?? '')),
      DataCell(Text(data[index].version?.toString() ?? '')),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(fmf
                  .copyWith(amount: data[index].importe)
                  .output
                  .symbolOnRight)),
          spacerS,
          IconButton(
              onPressed: () {
                navigator.pushNamed(
                  BudgetDetailPage.route,
                  arguments: data[index],
                );
              },
              icon: Image.asset('assets/icons/arrow_next.png', scale: 2))
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
