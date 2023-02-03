import 'package:flutter/material.dart';

class MyTouchable extends StatelessWidget {
  const MyTouchable({
    Key? key,
    required this.child,
    required this.onPress,
    this.enableFeedback = true,
    this.borderRadius,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPress;
  final bool enableFeedback;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: borderRadius,
      child: InkWell(
        enableFeedback: enableFeedback,
        splashColor: enableFeedback ? null : Colors.transparent,
        onTap: onPress,
        child: child,
      ),
    );
  }
}
