import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/promotions/promotion/promotion_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class PromotionsCard extends StatelessWidget {
  const PromotionsCard({
    this.margin,
    Key? key,
  }) : super(key: key);
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PromotionPage.route);
      },
      child: Card(
          margin:
              margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.blue100,
                  ),
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/icons/star.png',
                    scale: 2,
                  ),
                ),
                spacerS,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      spacerXs,
                      Text(
                        'Máquinas Bosh',
                        style: AppTextStyle.linkStyle,
                      ),
                      spacerXs,
                      Text(
                        'Sólo durante este mes consigue una botella de vino Rioja Reserva por cada motor de arranque o alternador de la marca.',
                        style: AppTextStyle.contentCard,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
