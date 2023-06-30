import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

InputDecoration get underlinedInputDecoration => InputDecoration(
      // hoverColor: AppColor.blueGray,
      // helperText: '',
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColor.error),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColor.blue),
      ),
      labelStyle: AppTextStyle.labelStyle,
    );
