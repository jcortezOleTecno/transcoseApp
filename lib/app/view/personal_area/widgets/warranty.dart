import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class Warranty extends StatelessWidget {
  const Warranty({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                title: Text('N° de GARANTÍA', style: AppTextStyle.defaultStyle),
                subtitle: Text('0000000000000000',
                    style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                trailing: Image.asset(
                  'assets/icons/arrow_next.png',
                  scale: 2,
                  color: AppColor.primaryBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FECHA', style: AppTextStyle.defaultStyle),
                          Text('00/00/0000',
                              style: AppTextStyle.defaultStyle
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('IMPORTE', style: AppTextStyle.defaultStyle),
                          Text(
                            '400 €',
                            style: AppTextStyle.defaultStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              spacerM,
              MyLabelStatus.pending(),
              spacerS,
            ],
          ),
        ),
      ),
    );
  }
}

class WarrantyDetail extends StatelessWidget {
  const WarrantyDetail({
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
                '100 €',
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
                  child: Text('SITUACIÓN', style: AppTextStyle.defaultStyle)),
              Expanded(
                  child:
                      Text('REQUIERE FIRMA', style: AppTextStyle.defaultStyle)),
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
          MyLabelStatus.pending()
        ],
      ),
    );
  }
}
