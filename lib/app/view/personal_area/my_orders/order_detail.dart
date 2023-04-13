import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/bill.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage();
  static const route = '/order_detail';

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
                    Text('Nombre de la factura', style: AppTextStyle.h3Style),
                    spacerXs,
                    Text('20/06/2022', style: AppTextStyle.defaultStyle),
                    spacerM,
                    _OrderDetails(),
                    spacerM,
                    Bill(billHeader: false),
                    MyIconButton(
                      onPressed: () {},
                      text: 'Firmar',
                      icon: Image.asset(
                        'assets/icons/firma.png',
                        scale: 2,
                      ),
                    ),
                    spacerL,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderDetails extends StatelessWidget {
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
            'Detalle de la garantía',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          Row(
            children: [
              Expanded(child: Text('FECHA', style: AppTextStyle.defaultStyle)),
              Expanded(
                  child: Text('IMPORTE', style: AppTextStyle.defaultStyle)),
            ],
          ),
          spacerXs,
          Row(
            children: [
              Expanded(
                child: Text(
                  '00/00/00',
                  style: AppTextStyle.defaultStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Text(
                '???',
                style: AppTextStyle.defaultStyle
                    .copyWith(fontWeight: FontWeight.bold),
              )),
            ],
          ),
          spacerM,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OBSERVACIONES',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              spacerXs,
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vestibulum tristique ultricies nulla odio. Nulla bibendum in curabitur congue scelerisque ac interdum.',
                style: AppTextStyle.defaultStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
