import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Image.asset(
          'assets/icons/arrow_back.png',
          scale: 2,
        ),
        label: const Text(
          'Volver',
          style: AppTextStyle.linkStyle,
        ),
      ),
    );
  }
}
