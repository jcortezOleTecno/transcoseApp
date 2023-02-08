import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_appbar/my_appbar.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 80 + MediaQuery.of(context).viewPadding.vertical),
            Expanded(child: child),
          ],
        ),
        const MyAppBar(),
      ],
    );
  }
}
