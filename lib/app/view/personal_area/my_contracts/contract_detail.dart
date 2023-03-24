import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/warranty.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ContractDetailPage extends StatelessWidget {
  const ContractDetailPage({super.key});
  static const route = '/contract_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
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
                      'Nombre del contrato',
                      style: AppTextStyle.h2Style,
                    ),
                    spacerM,
                    WarrantyDetail(),
                    spacerL,
                    MyIconButton(
                      onPressed: () {},
                      text: 'Firmar',
                      icon: Image.asset(
                        'assets/icons/firma.png',
                        scale: 2,
                      ),
                    ),
                    spacerL,
                    const Divider(),
                    spacerM,
                    RichText(
                      text: const TextSpan(
                        style: AppTextStyle.h2Style,
                        children: [
                          TextSpan(
                            text: 'PMP',
                          ),
                          TextSpan(
                            text: '  Programa de preventivos',
                            style: AppTextStyle.defaultStyle,
                          ),
                        ],
                      ),
                    ),
                    spacerXs,
                    Text(
                      getIt.get<LocalDataRepository>().user?.name ?? '',
                      style: AppTextStyle.defaultStyle,
                    ),
                    spacerL,
                    ...List.generate(3, (i) {
                      return _Revision();
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Revision extends StatelessWidget {
  const _Revision({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: AppColor.blue50,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REVISIÓN',
                  style: AppTextStyle.titleCard.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Text(
                  'Aire acondisionado',
                  style: AppTextStyle.titleCard,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                        child:
                            Text('TARIFA', style: AppTextStyle.defaultStyle)),
                    Expanded(
                        child: Text('MARCA', style: AppTextStyle.defaultStyle)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      '54,45 €',
                      style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      'Texa',
                      style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                  ],
                ),
                spacerM,
                Text('N° DE SERIE', style: AppTextStyle.defaultStyle),
                Text(
                  '12345',
                  style: AppTextStyle.defaultStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                spacerM,
                MyIconButton(
                  onPressed: () {},
                  text: 'Firmar',
                  variant: MyButtonVariant.outlinedBold,
                  icon: Image.asset(
                    'assets/icons/firma.png',
                    scale: 2,
                    color: AppColor.primaryBlue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
