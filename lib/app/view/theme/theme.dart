// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'NunitoSans',
      brightness: Brightness.light,
      splashColor: AppColor.primary,
      primaryColor: AppColor.primary,
      textTheme: textTheme,
      iconTheme: iconTheme,
      progressIndicatorTheme: progressIndicatorTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      scaffoldBackgroundColor: AppColor.white,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: AppColor.blue),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: AppTextStyle.inputStyle,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.black,
        // unselectedItemColor: AppColor.blueGray,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        showUnselectedLabels: false,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      colorScheme: colorScheme
          .copyWith(secondary: AppColor.primary)
          .copyWith(secondary: AppColor.primary),
    );
  }

  static OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static TextTheme get textTheme {
    return TextTheme(
      headlineLarge: AppTextStyle.h1Style.copyWith(fontSize: 20),
      headlineMedium: AppTextStyle.h1Style.copyWith(fontSize: 16),
      headlineSmall: AppTextStyle.h1Style.copyWith(fontSize: 14),
      bodyLarge: AppTextStyle.labelStyle,
      bodyMedium: AppTextStyle.labelStyle,
      bodySmall: AppTextStyle.labelStyle,
    ).apply(
      bodyColor: AppColor.black,
      fontFamily: 'NunitoSans',
    );
  }

  static ColorScheme get colorScheme {
    return ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primary,
      secondary: AppColor.blue200,
      tertiary: AppColor.blue200,
    );
  }

  static IconThemeData get iconTheme {
    return const IconThemeData(
      color: AppColor.primary,
    );
  }

  static ProgressIndicatorThemeData get progressIndicatorTheme {
    return const ProgressIndicatorThemeData(color: Colors.white);
  }
}
