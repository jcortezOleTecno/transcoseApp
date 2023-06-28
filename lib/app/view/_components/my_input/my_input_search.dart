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
  }) : super(key: key);

  final String? hintText;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        initialValue: initialValue,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          filled: true,
          fillColor: Colors.white,
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
