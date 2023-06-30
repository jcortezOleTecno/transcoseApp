import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class NoExistWidget extends StatelessWidget {
  const NoExistWidget(
    this.text, {
    this.paddingTop,
    Key? key,
  }) : super(key: key);
  final String text;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 100),
      child: Center(
        child: Text(
          'No existen $text',
          style: AppTextStyle.h3Style,
        ),
      ),
    );
  }
}
