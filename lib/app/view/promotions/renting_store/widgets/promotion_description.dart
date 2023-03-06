import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class PromotionDescription extends StatelessWidget {
  const PromotionDescription({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

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
            child: const Image(
              image: AssetImage('assets/imgs/promotionImg.png'),
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          spacerS,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lorem ipsun', style: AppTextStyle.h2Style),
              Text('1 unidad', style: AppTextStyle.defaultStyle),
            ],
          ),
          spacerS,
          Text(
            'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
            style: AppTextStyle.defaultStyle,
          ),
          spacerM,
          Center(
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.h1Style,
                children: [
                  const TextSpan(
                    text: '23\$',
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
        ],
      ),
    );
  }
}
