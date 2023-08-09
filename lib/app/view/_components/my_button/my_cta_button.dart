import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';

class MyCTAButton extends StatelessWidget {
  const MyCTAButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.iconFirst = false,
    this.customColor,
    this.variant = MyButtonVariant.containedPrimary,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool iconFirst;
  final VoidCallback onPressed;
  final MyButtonVariant variant;
  final Color? customColor;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: customColor ?? AppColor.blue),
    );
    final iconWidget = Icon(
      icon,
      size: 20,
      color: customColor ?? AppColor.blue,
    );

    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.blue,
        backgroundColor: Colors.transparent,
        shape: semiRoundedShape,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: iconFirst
            ? [
                iconWidget,
                _dividerWidget,
                textWidget,
              ]
            : [
                textWidget,
                _dividerWidget,
                iconWidget,
              ],
      ),
    );
  }
}

const _dividerWidget = SizedBox(width: 10);
