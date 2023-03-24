import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/warranty.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class WarrantyDetailPage extends StatelessWidget {
  const WarrantyDetailPage({super.key});
  static const route = '/warranty_detail';

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
                    Text('Nº DE GARANTÍA', style: AppTextStyle.defaultStyle),
                    spacerXs,
                    Text('00000000000', style: AppTextStyle.h3Style),
                    spacerM,
                    WarrantyDetail(),
                    spacerM,
                    MyDivider(),
                    spacerS,
                    Text('Productos', style: AppTextStyle.h2Style),
                    spacerM,
                    _Products(),
                    spacerM,
                    MyIconButton(
                      onPressed: () {},
                      text: 'Firmar',
                      icon: Image.asset(
                        'assets/icons/firma.png',
                        scale: 2,
                      ),
                    ),
                    spacerL,
                    // Bill(billHeader: false),
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

class _Products extends StatelessWidget {
  const _Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.blue100),
        ),
        child: Column(
          children: const [
            _ItemProduct(),
            MyDivider(),
            _ItemProduct(),
            MyDivider(),
            _ItemProduct(),
          ],
        ));
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Icon(Icons.check_box_outline_blank),
          spacerM,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('REF PIEZA'),
                spacerXs,
                Text(
                  '0000000000',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('PRECIO'),
                spacerXs,
                Text(
                  '100 €',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icons/arrow_next.png',
            scale: 2,
          ),
        ],
      ),
    );
  }
}
