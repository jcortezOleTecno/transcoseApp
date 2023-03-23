import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class BudgetDetailPage extends StatelessWidget {
  const BudgetDetailPage({super.key});
  static const route = '/budget_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'N° DEL PRESUPUESTO',
                          style: AppTextStyle.defaultStyle,
                        ),
                        Text(
                          '0000000000000',
                          style: AppTextStyle.h3Style,
                        ),
                        spacerL,
                        _DetailBudget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyIconButton(
                onPressed: () {},
                text: 'Firmar',
                icon: Image.asset(
                  'assets/icons/firma.png',
                  scale: 2,
                ),
              ),
            ),
            spacerL,
          ],
        ),
      ),
    );
  }
}

class _DetailBudget extends StatelessWidget {
  const _DetailBudget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Detalles del presupuesto',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          Row(
            children: [
              Expanded(child: Text('FECHA', style: AppTextStyle.defaultStyle)),
              Expanded(
                  child: Text('IMP. LINEAS', style: AppTextStyle.defaultStyle)),
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
                '???',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Text('DESCUENTO', style: AppTextStyle.defaultStyle)),
              Expanded(
                  child: Text('B IMPONIBLE', style: AppTextStyle.defaultStyle)),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                '???',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
              Expanded(
                  child: Text(
                '???',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Text('IMPORTE IVA', style: AppTextStyle.defaultStyle)),
              Expanded(child: Text('TOTAL', style: AppTextStyle.defaultStyle)),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                '???',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
              Expanded(
                  child: Text(
                '???',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
            ],
          ),
          spacerM,
          const MyLabelStatus.approved()
        ],
      ),
    );
  }
}
