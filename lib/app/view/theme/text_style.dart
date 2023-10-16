import 'package:flutter/cupertino.dart';
import 'package:vemare/app/view/theme/color.dart';

abstract class AppTextStyle {
  static const TextStyle labelStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static const TextStyle inputStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static const TextStyle inputLabelStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.black,
  );
  static const TextStyle linkStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.blue,
  );
  static const TextStyle inputHintStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const TextStyle h1Style = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );
  static const TextStyle nunito800 = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColor.black,
  );
  static const TextStyle h2Style = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );
  static const TextStyle h3Style = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const TextStyle h12Style = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.neutral,
  );
  static const TextStyle checkStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 14,
    color: AppColor.neutral,
  );
  static const TextStyle checkStyleBlue = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColor.blue,
  );
  static const TextStyle h12StyleNeu40 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    color: AppColor.neutral40,
  );
  static const TextStyle h12StyleNeu40W700 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.neutral40,
  );
  static const TextStyle h12StyleBlue = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.blue,
  );
  static const TextStyle h4Style = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.neutral40,
  );
  static const TextStyle pvpOrinigal = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2,
    color: AppColor.neutral40,
  );
  static const TextStyle contentCard = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
  );
  static const TextStyle titleCard = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const TextStyle menuStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );
  static const TextStyle homeStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    color: AppColor.white,
  );
  static const TextStyle nunitoSans700 = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const TextStyle nunitoSans800 = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w800,
    color: AppColor.black,
  );
  static const TextStyle defaultStyle = TextStyle(
      fontFamily: 'NunitoSans', fontWeight: FontWeight.w400, fontSize: 14);
}
