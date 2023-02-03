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
    fontFamily: 'NunitoSans',
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
    fontFamily: 'NunitoSans',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );
  static const TextStyle h3Style = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const TextStyle defaultStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w400,
  );
}
