import 'package:flutter/material.dart';
import 'package:vemare/app/view/menu/menu.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    required this.child,
    this.padding,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(
                  height: 80 + MediaQuery.of(context).viewPadding.vertical),
              Expanded(child: child),
            ],
          ),
        ),
        MyMenu.create(),
      ],
    );
  }
}
