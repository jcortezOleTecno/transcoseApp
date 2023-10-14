import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../../../_components/my_network_image/my_network_image.dart';

class PromotionDescription extends StatelessWidget {
  const PromotionDescription({
    Key? key,
    required this.promotion,
    required this.title,
    required this.quantity,
  }) : super(key: key);

  final String title;
  final Promotion promotion;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.h1Style,
          ),
          spacerS,
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: MyNetworkImage(
              image: promotion.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          spacerS,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(promotion.name ?? '', style: AppTextStyle.h2Style),
              Text('$quantity unidad', style: AppTextStyle.defaultStyle),
            ],
          ),
          spacerS,
          MyHtml(text: promotion.description ?? ''),
          spacerM,
          Center(
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.h1Style,
                children: [
                  if (promotion.pvpLowered != null)
                    TextSpan(
                        text: myFormatMoney((promotion.pvpOriginal ?? 0) *
                            (quantity!.toDouble())),
                        style: AppTextStyle.pvpOrinigal),
                  TextSpan(
                    text:
                        ' ${myFormatMoney((promotion.pvpLowered ?? promotion.pvpOriginal ?? 0) * (quantity!.toDouble()))}',
                  ),
                  TextSpan(
                    text: ' IVA incluido ',
                    style: AppTextStyle.defaultStyle
                        .copyWith(color: AppColor.neutral40),
                  ),
                ],
              ),
            ),
          ),
          /*Center(
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.h1Style,
                children: [
                  TextSpan(
                      text: '${promotion.pvpOriginal}€',
                      style: AppTextStyle.pvpOrinigal),
                  TextSpan(
                    text: ' ${promotion.pvpLowered}€',
                  ),
                  TextSpan(
                    text: ' IVA incluido ',
                    style: AppTextStyle.defaultStyle
                        .copyWith(color: AppColor.neutral40),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
