import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MySearchInput extends StatelessWidget {
  const MySearchInput({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.initialValue,
    this.onFieldSubmitted,
    this.fillColor = Colors.white,
    this.borderSideColor = Colors.black,
    this.borderCircular = 40.0,
    this.controller,
  }) : super(key: key);

  final String? hintText;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Color fillColor;
  final Color borderSideColor;
  final double borderCircular;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        initialValue: initialValue,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderCircular),
            borderSide: BorderSide(color: borderSideColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderCircular),
            borderSide: BorderSide(color: borderSideColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderCircular),
            borderSide: BorderSide(color: borderSideColor, width: 1.0),
          ),
          filled: true,
          fillColor: fillColor,
          hintText: hintText,

          hintStyle: AppTextStyle.inputHintStyle,
          isDense: true,
          // isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          suffixIcon: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (onTap != null) {
                onTap!();
              }
            },
            child: Image.asset(
              'assets/icons/searchIcon.png',
              scale: 2,
            ),
          ),
        ),
      ),
    );
  }
}
