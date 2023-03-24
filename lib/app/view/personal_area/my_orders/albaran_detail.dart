import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/bill.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class AlbaranDetailPage extends StatelessWidget {
  const AlbaranDetailPage({super.key});
  static const route = '/albaran_detail';

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
                    Text('Nº Albarán', style: AppTextStyle.h3Style),
                    spacerXs,
                    Text('00000000000', style: AppTextStyle.h2Style),
                    spacerM,
                    _AlbaranDetails(),
                    spacerM,
                    Divider(
                      thickness: 1.5,
                      color: AppColor.blue100,
                    ),
                    spacerM,
                    Text('Productos', style: AppTextStyle.h2Style),
                    spacerM,
                    Bill(billHeader: false),
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

class _AlbaranDetails extends StatelessWidget {
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
            'Detalle del albarán',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Text('UNIDADES', style: AppTextStyle.defaultStyle)),
              Expanded(
                  child: Text('IMPORTE', style: AppTextStyle.defaultStyle)),
            ],
          ),
          spacerXs,
          Row(
            children: [
              Expanded(
                child: Text(
                  '40',
                  style: AppTextStyle.defaultStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Text(
                '100 €',
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
          spacerM,
          MyLabelStatus.subscribe()
        ],
      ),
    );
  }
}
