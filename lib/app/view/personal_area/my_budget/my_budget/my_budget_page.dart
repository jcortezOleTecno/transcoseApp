import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/budget_detail.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_cubit.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/bloc/my_budget_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

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
    return Scaffold(
      body: BlocConsumer<BudgetCubit, BudgetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MyBody(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Mis presupuestos', style: AppTextStyle.h1Style),
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
                          cubit.fetchData(filter: filter);
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
                  if (state.filters != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                        child: Text(
                          'Filtros aplicados: ${state.filters!}',
                          style: AppTextStyle.defaultStyle,
                        ),
                      ),
                    ),

                  spacerL,
                  if (state.loading) ...[
                    ...List.generate(2, (i) {
                      return const MyShimmer(
                        height: 170,
                        borderRadius: 12,
                        margin: EdgeInsets.only(bottom: 20),
                      );
                    }),
                  ],
                  if (!state.loading) ...state.budget.map((e) => _Budget(e)),
                  // MyIconButton(
                  //   onPressed: () {},
                  //   text: 'Firmar',
                  //   icon: Image.asset(
                  //     'assets/icons/firma.png',
                  //     scale: 2,
                  //   ),
                  // ),
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
  const _Budget(
    this.budget, {
    Key? key,
  }) : super(key: key);

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          BudgetDetailPage.route,
          arguments: budget,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.blue100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.check_box_outline_blank, color: Colors.black),
              title:
                  Text('N° DEL PRESUPUESTO', style: AppTextStyle.defaultStyle),
              subtitle: Text(budget.numero ?? '',
                  style: AppTextStyle.defaultStyle.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              trailing: Image.asset(
                'assets/icons/arrow_next.png',
                scale: 2,
                color: AppColor.primaryBlue,
              ),
            ),
            Row(
              children: const [
                Expanded(
                    child: Text('FECHA', style: AppTextStyle.defaultStyle)),
                Expanded(
                    child: Text('IMPORTE', style: AppTextStyle.defaultStyle)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  budget.fecha ?? '',
                  style: AppTextStyle.defaultStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )),
                Expanded(
                    child: Text(
                  fmf.copyWith(amount: budget.importe!).output.symbolOnRight,
                  style: AppTextStyle.defaultStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )),
              ],
            ),
            spacerM,
          ],
        ),
      ),
    );
  }
}
