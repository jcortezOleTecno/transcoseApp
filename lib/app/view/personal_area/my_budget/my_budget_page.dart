import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class MyBudgetPage extends StatelessWidget {
  const MyBudgetPage({super.key});
  static const route = '/My_budget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
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
                onPressed: () {},
                text: 'Aplicar filtros',
                icon: Image.asset(
                  'assets/icons/Filtro.png',
                  scale: 2,
                ),
                variant: MyButtonVariant.outlinedBold,
              ),
              spacerL,
              ...List.generate(4, (i) {
                return const _Budget();
              }),
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BudgetDetailPage.route);
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
              subtitle: Text('0000000000000000',
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
                  '20/08/2022',
                  style: AppTextStyle.defaultStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )),
                Expanded(
                    child: Text(
                  '5000 €',
                  style: AppTextStyle.defaultStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )),
              ],
            ),
            spacerM,
            const MyLabelStatus.pending(),
          ],
        ),
      ),
    );
  }
}
