import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_detail.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class Albaran extends StatelessWidget {
  const Albaran({super.key, this.onTapAlbaran});

  final void Function()? onTapAlbaran;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapAlbaran,
          leading: Icon(Icons.check_box_outline_blank, color: Colors.black),
          title: Text('N° ALBARÁN', style: AppTextStyle.defaultStyle),
          subtitle: Text('0000000000000000',
              style: AppTextStyle.defaultStyle
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
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
                    Text('UDS', style: AppTextStyle.defaultStyle),
                    Text('40',
                        style: AppTextStyle.defaultStyle
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PRECIO', style: AppTextStyle.defaultStyle),
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
        spacerM,
        MyDivider(),
      ],
    );
  }
}
