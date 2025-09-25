import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.customInset,
    this.disabled = false,
    this.variant = MyButtonVariant.containedPrimary,
  }) : super(key: key);
  final String text;
  final Widget icon;
  final bool disabled;
  final VoidCallback onPressed;
  final MyButtonVariant variant;
  final EdgeInsets? customInset;

  @override
  Widget build(BuildContext context) {
    VoidCallback? callback = onPressed;
    var style = AppButtonStyle.getFromVariant(variant);
    if (disabled) {
      callback = null;
      style = AppButtonStyle.getFromVariant(MyButtonVariant.disabled);
    }
    // ignore: unused_local_variable
    var iconColor = AppColor.primary;
    switch (variant) {
      case MyButtonVariant.containedPrimary:
        iconColor = Colors.white;
        break;
      case MyButtonVariant.containedSecondary:
        iconColor = AppColor.primary;
        break;
      case MyButtonVariant.containedCallToAction:
        break;
      case MyButtonVariant.outlinedBold:
        break;
      case MyButtonVariant.outlinedBoldTransparent:
        break;
      case MyButtonVariant.outlinedRegular:
        iconColor = AppColor.primary;
        break;
      case MyButtonVariant.link:
        iconColor = AppColor.black;
        break;
      case MyButtonVariant.lightLink:
        iconColor = Colors.grey;
        break;
      case MyButtonVariant.disabled:
        iconColor = Colors.grey;
        break;
    }

    return TextButton(
      onPressed: callback,
      style: style.buttonStyle,
      child: Padding(
        padding: customInset ?? style.inset,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.merge(style.textStyle),
              ),
            ),
            spacerXs,
            SizedBox(width: 24, height: 24, child: icon),
          ],
        ),
      ),
    );
  }
}
