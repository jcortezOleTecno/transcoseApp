import 'package:flutter/material.dart';
import 'package:vemare/app/view/menu/menu.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    required this.child,
    this.padding,
    this.spacerTop = 80,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double spacerTop;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(height: spacerTop + paddingTop),
              Expanded(child: child),
            ],
          ),
        ),
        MyMenu.create(),
      ],
    );
  }
}
