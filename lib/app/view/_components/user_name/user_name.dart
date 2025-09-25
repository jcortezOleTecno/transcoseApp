import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';


class UserName extends StatelessWidget {
  const UserName({this.style = AppTextStyle.defaultStyle,Key? key,}) : super(key: key);
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocalDataRepository().user!.name ?? '',
          style: style,
        ),
        spacerXs,
        Text(
          LocalDataRepository().user!.lastname ?? '',
          style: style,
        ),
      ],
    );
  }
}
