import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vemare/app/view/_components/my_input/my_styles/my_input_styles.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

enum MyInputVariant { primary, secondary, backgroundBlue }

class MyInput extends StatefulWidget {
  const MyInput({
    Key? key,
    this.hideInput = false,
    this.readOnly = false,
    this.hasError = false,
    this.onPressed,
    this.icon,
    required this.label,
    this.required = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofillHints,
    this.controller,
    this.validator,
    this.finishAutofillContext = false,
    this.inputType = TextInputType.text,
    this.variant = MyInputVariant.primary,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.maxLength,
    this.helperText,
    this.autofocus = false,
    this.maxLines = 1,
    this.suffixWidget,
    this.enabled,
    this.textInputAction,
    this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String label;
  final bool hideInput;
  final bool readOnly;
  final bool hasError;
  final bool? enabled;
  final MyInputVariant variant;
  final IconData? icon;
  final TextInputType inputType;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<String>? autofillHints;
  final String? Function(String?)? validator;
  final bool finishAutofillContext;
  final bool required;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final String? helperText;
  final bool autofocus;
  final int maxLines;
  final Widget? suffixWidget;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  late bool hideInput;

  @override
  void initState() {
    super.initState();
    hideInput = widget.hideInput;
  }

  @override
  Widget build(BuildContext context) {
    var iconColor = AppColor.blue;
    Color? fillColor;
    switch (widget.variant) {
      case MyInputVariant.primary:
        iconColor = AppColor.primary;
        break;
      case MyInputVariant.secondary:
        break;
      case MyInputVariant.backgroundBlue:
        fillColor = AppColor.blue50;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: widget.label,
            style: AppTextStyle.inputLabelStyle,
            children: widget.required
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.black),
                    )
                  ]
                : [],
          ),
        ),
        TextFormField(
          autofocus: widget.autofocus,
          onTap: widget.onPressed,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          scrollPadding: const EdgeInsets.symmetric(horizontal: 20),
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: AppColor.black,
          onEditingComplete: widget.finishAutofillContext
              ? TextInput.finishAutofillContext
              : null,
          initialValue: widget.initialValue,
          onFieldSubmitted: widget.onFieldSubmitted,
          autofillHints: widget.autofillHints,
          inputFormatters: widget.inputFormatters,
          style: AppTextStyle.inputStyle,
          autocorrect: false,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          keyboardType: widget.inputType,
          obscureText: hideInput,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          decoration: underlinedInputDecoration.copyWith(
            errorStyle: const TextStyle(height: 1.0),
            helperText: '',
            enabledBorder: widget.hasError
                ? underlinedInputDecoration.errorBorder
                : underlinedInputDecoration.enabledBorder,
            focusedBorder: widget.hasError
                ? underlinedInputDecoration.errorBorder
                : underlinedInputDecoration.focusedBorder,
            alignLabelWithHint: true,
            filled: true,
            fillColor: fillColor ?? Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            hintText: widget.hintText,
            hintStyle: AppTextStyle.inputHintStyle,
            suffixIcon: (widget.suffixWidget != null)
                ? widget.suffixWidget
                : widget.hideInput
                    ? GestureDetector(
                        onTap: (){
                          setState(() {
                            hideInput = !hideInput;
                          });
                        },
                        // onTapDown: (details) {
                        //   setState(() {
                        //     hideInput = false;
                        //   });
                        // },
                        // onTapUp: (details) {
                        //   setState(() {
                        //     hideInput = true;
                        //   });
                        // },
                        child: Image.asset(
                          hideInput
                              ? 'assets/icons/eye-off.png'
                              : 'assets/icons/eye-on.png',
                          color: AppColor.blue,

                          // fit: BoxFit.fill,
                          scale: 2.5,
                        ),
                      )
                    : Visibility(
                        visible: widget.icon != null,
                        child: Icon(
                          widget.icon,
                          color: iconColor,
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}

class MyLabeledText extends StatelessWidget {
  const MyLabeledText({
    Key? key,
    required this.label,
    required this.text,
    this.child,
  }) : super(key: key);
  final String label;
  final String text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.labelStyle,
        ),
        if (child == null)
          SelectableText(text, style: AppTextStyle.inputStyle)
        else
          child!
      ],
    );
  }
}
