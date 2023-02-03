import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';

abstract class AppButtonStyle {
  static MyButtonStyles containedPrimaryButtonStyles =
      ContainedPrimaryButtonStyles();
  static MyButtonStyles containedPrimaryStyles = ContainedPrimaryButtonStyles();
  static MyButtonStyles containedSecondaryStyles =
      ContainedSecondaryButtonStyles();
  static MyButtonStyles containedCallToActionStyles =
      ContainedCallToActionButtonStyles();
  static MyButtonStyles outlinedRegularStyles = OutlinedRegularButtonStyles();
  static MyButtonStyles outlinedBoldStyles = OutlinedBoldButtonStyles();
  static MyButtonStyles linkStyles = LinkButtonStyles();
  static MyButtonStyles lightLinkStyles = LightLinkButtonStyles();
  static MyButtonStyles disabledStyles = DisabledButtonStyles();
  static MyButtonStyles getFromVariant(MyButtonVariant variant) {
    switch (variant) {
      case MyButtonVariant.containedPrimary:
        return containedPrimaryButtonStyles;
      case MyButtonVariant.containedSecondary:
        return containedSecondaryStyles;
      case MyButtonVariant.containedCallToAction:
        return containedCallToActionStyles;
      case MyButtonVariant.outlinedBold:
        return outlinedBoldStyles;
      case MyButtonVariant.outlinedRegular:
        return outlinedRegularStyles;
      case MyButtonVariant.link:
        return linkStyles;
      case MyButtonVariant.lightLink:
        return lightLinkStyles;
      case MyButtonVariant.disabled:
        return disabledStyles;
    }
  }
}

abstract class MyButtonStyles {
  MyButtonStyles();
  late EdgeInsets inset;
  late TextStyle textStyle;
  late ButtonStyle buttonStyle;
}

class ContainedPrimaryButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _padding;
  @override
  TextStyle get textStyle => const TextStyle(color: Colors.white, fontSize: 18);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primary,
        shape: semiRoundedShape,
      );
}

class ContainedSecondaryButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _padding;
  @override
  TextStyle get textStyle =>
      const TextStyle(color: AppColor.primary, fontSize: 18);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        foregroundColor: AppColor.blue,
        backgroundColor: AppColor.white,
        shape: semiRoundedShape,
      );
}

class ContainedCallToActionButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _padding.copyWith(top: 2, bottom: 2);
  @override
  TextStyle get textStyle => const TextStyle(color: AppColor.primary);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        foregroundColor: AppColor.blue,
        backgroundColor: AppColor.white,
        shape: semiRoundedShape,
      );
}

class OutlinedRegularButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _padding;
  @override
  TextStyle get textStyle =>
      const TextStyle(color: AppColor.black, fontWeight: FontWeight.w400);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        foregroundColor: AppColor.black,
        shape: semiRoundedShape.copyWith(
          side: const BorderSide(color: AppColor.blue200),
        ),
      );
}

class OutlinedBoldButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _padding;
  @override
  TextStyle get textStyle => const TextStyle(
        color: AppColor.blue,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        foregroundColor: AppColor.black,
        shape: semiRoundedShape.copyWith(
          side: const BorderSide(
            color: AppColor.blue,
            width: 2.5,
          ),
        ),
      );
}

class LinkButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _minimalPadding;
  @override
  TextStyle get textStyle =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w400);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        onPrimary: Colors.grey,
        shape: semiRoundedShape,
      );
}

class LightLinkButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _minimalPadding;
  @override
  TextStyle get textStyle =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w400);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        shape: semiRoundedShape,
      );
}

class DisabledButtonStyles extends MyButtonStyles {
  @override
  EdgeInsets get inset => _padding;
  @override
  TextStyle get textStyle => const TextStyle(color: Colors.white);
  @override
  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        primary: AppColor.blue200,
        onSurface: AppColor.black,
        onPrimary: Colors.black,
        shape: semiRoundedShape,
      );
}

final semiRoundedShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

const _padding = EdgeInsets.symmetric(horizontal: 20, vertical: 7);
const _minimalPadding = EdgeInsets.zero;

enum MyButtonVariant {
  containedPrimary,
  containedSecondary,
  containedCallToAction,
  outlinedRegular,
  outlinedBold,
  link,
  lightLink,
  disabled
}
