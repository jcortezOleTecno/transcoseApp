import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.defaultStyle.copyWith(fontSize: 14)),
        Text(
          content,
          style: AppTextStyle.defaultStyle
              .copyWith(fontWeight: FontWeight.w700, fontSize: 13),
        )
      ],
    );
  }
}
