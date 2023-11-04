import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class NoExistWidget extends StatelessWidget {
  const NoExistWidget(
    this.text, {
    this.paddingTop,
    this.textLlong,
    Key? key,
  }) : super(key: key);
  final String text;
  final double? paddingTop;
  final String? textLlong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 100),
      child: Center(
        child: Text(
          textLlong != null ? textLlong! : 'No tienes $text',
          style: AppTextStyle.h3Style,
        ),
      ),
    );
  }
}

class NoResultWidget extends StatelessWidget {
  const NoResultWidget(
    this.tittle, {
    this.subTittle,
    this.paddingTop,
    Key? key,
  }) : super(key: key);
  final String tittle;
  final String? subTittle;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 100),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.blue100,
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/icons/emoji-sad.png',
                  color: AppColor.primaryBlue,
                  scale: 2,
                ),
              ),
            ),
            spacerM,
            Text(
              tittle,
              textAlign: TextAlign.center,
              style: AppTextStyle.h3Style,
            ),
            spacerXs,
            Text(
              subTittle ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyle.defaultStyle,
            ),
          ],
        ),
      ),
    );
  }
}
