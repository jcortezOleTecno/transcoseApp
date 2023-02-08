import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyListile extends StatelessWidget {
  const MyListile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.padding,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final EdgeInsetsGeometry? padding;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                icon,
                spacerM,
                Text(
                  title,
                  style: AppTextStyle.linkStyle,
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/arrow_next.png',
                  scale: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
