import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_input/my_styles/my_input_styles.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyInputAutoComplete extends StatelessWidget {
  const MyInputAutoComplete({
    super.key,
    required this.keyComplete,
    required this.suggestions,
    this.textSubmitted,
    this.textChanged,
    this.hideInput = false,
    this.hasError = false,
    required this.label,
    this.required = false,
    this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.helperText,
    this.autofocus = false,
    this.textInputAction,
    this.hintText,
  });

  final TextEditingController? controller;
  final GlobalKey<AutoCompleteTextFieldState<String>> keyComplete;
  final List<String> suggestions;
  final dynamic Function(String)? textSubmitted;
  final dynamic Function(String)? textChanged;
  final String? hintText;
  final String label;
  final bool hideInput;
  final bool hasError;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final bool required;
  final TextCapitalization textCapitalization;
  final String? helperText;
  final bool autofocus;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: AppTextStyle.inputLabelStyle,
            children: required
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.black),
                    )
                  ]
                : [],
          ),
        ),
        SimpleAutoCompleteTextField(
          key: keyComplete,
          autofocus: autofocus,
          clearOnSubmit: false,
          controller: controller,
          textSubmitted: textSubmitted,
          textChanged: textChanged,
          cursorColor: AppColor.black,
          style: AppTextStyle.inputStyle,
          keyboardType: inputType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction ?? TextInputAction.done,
          decoration: underlinedInputDecoration.copyWith(
            errorStyle: const TextStyle(height: 1.0),
            helperText: helperText,
            enabledBorder: hasError
                ? underlinedInputDecoration.errorBorder
                : underlinedInputDecoration.enabledBorder,
            focusedBorder: hasError
                ? underlinedInputDecoration.errorBorder
                : underlinedInputDecoration.focusedBorder,
            alignLabelWithHint: false,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            hintText: hintText,
            hintStyle: AppTextStyle.inputHintStyle,
          ),
          suggestions: suggestions,
        ),
      ],
    );
  }
}
