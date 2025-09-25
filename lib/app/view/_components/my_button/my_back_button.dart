import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key, this.onTap, this.edgeInsets = const EdgeInsets.all(6.0)}) : super(key: key);

  final Function()? onTap;
  final EdgeInsets edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: TextButton.icon(
        onPressed: onTap ?? (){
          Navigator.of(context).maybePop();
        },
        icon: Image.asset(
          'assets/icons/arrow_back.png',
          scale: 2,
        ),
        label: Text(
          'Volver',
          style: AppTextStyle.linkStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
