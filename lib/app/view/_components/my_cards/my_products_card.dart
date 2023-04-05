import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
    this.margin,
    Key? key,
  }) : super(key: key);
  final Widget icon;
  final String title;
  final String content;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          margin: margin ?? const EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.blue100,
                    ),
                    height: 60,
                    width: 60,
                    child: icon),
                spacerS,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacerXs,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: AppTextStyle.linkStyle,
                          ),
                          Image.asset(
                            'assets/icons/arrow_next.png',
                            scale: 2,
                          ),
                        ],
                      ),
                      spacerS,
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
