import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/promotions/promotion/promotion_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MySingleCard extends StatelessWidget {
  const MySingleCard({
    required this.icon,
    required this.title,
    required this.content,
    this.margin,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final Widget icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  child: icon,
                ),
                spacerS,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacerXs,
                      Text(
                        title,
                        style: AppTextStyle.linkStyle,
                      ),
                      spacerXs,
                      Text(
                        content,
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
