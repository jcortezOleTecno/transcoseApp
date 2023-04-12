import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/months.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/utils/months_list.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
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
                      _filters(context);
                    },
                    text: 'Aplicar filtros',
                    icon: Image.asset(
                      'assets/icons/Filtro.png',
                      scale: 2,
                    ),
                    variant: MyButtonVariant.outlinedBold,
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
                  ...state.budget.map((e) => _Budget(e)),
                  MyIconButton(
                    onPressed: () {},
                    text: 'Firmar',
                    icon: Image.asset(
                      'assets/icons/firma.png',
                      scale: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _filters(BuildContext context) {
    final cubit = context.read<BudgetCubit>();
    Months? monthsSelect;
    String? yearSelect;

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MySpacer(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Aplicar filtros',
                              style: AppTextStyle.h2Style),
                          IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(Icons.close))
                        ],
                      ),
                      spacerM,
                      const Text(
                        'Filtrar por mes',
                        style: AppTextStyle.inputLabelStyle,
                      ),
                      MyCustomDropdownButton<Months>(
                        hint: 'Selecciona un mes',
                        dropdownItems: monthsList
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTextStyle.inputStyle,
                                  ),
                                ))
                            .toList(),
                        buttonWidth: double.infinity,
                        value: monthsSelect,
                        onChanged: (value) {
                          setState(() {
                            monthsSelect = value;
                          });
                        },
                      ),
                      spacerM,
                      const Text(
                        'Filtrar por año',
                        style: AppTextStyle.inputLabelStyle,
                      ),
                      MyCustomDropdownButton<String>(
                        hint: 'Selecciona un año',
                        dropdownItems: yearsList
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppTextStyle.inputStyle,
                                  ),
                                ))
                            .toList(),
                        buttonWidth: double.infinity,
                        value: yearSelect,
                        onChanged: (value) {
                          setState(() {
                            yearSelect = value;
                          });
                        },
                      ),
                      spacerXL,
                      MyButton(
                        onPressed: () => Navigator.of(context).pop(),
                        text: 'Aplicar',
                        width: double.infinity,
                      ),
                      spacerS,
                      MyIconButton(
                        onPressed: () {
                          setState(() {
                            yearSelect = null;
                            monthsSelect = null;
                          });
                        },
                        text: 'Borrar filtros',
                        variant: MyButtonVariant.outlinedBold,
                        icon: Image.asset(
                          'assets/icons/Trash.png',
                          scale: 2,
                          color: AppColor.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
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
