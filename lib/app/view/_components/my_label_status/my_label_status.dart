import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyLabelStatus extends StatelessWidget {
  final Color colorLabel;
  final Color colorBody;
  final String label;

  const MyLabelStatus.approved({
    super.key,
    this.label = 'Aprobado',
    this.colorBody = AppColor.success200,
    this.colorLabel = AppColor.success500,
  });
  const MyLabelStatus.pending({
    super.key,
    this.label = 'Pendiente',
    this.colorBody = AppColor.warning200,
    this.colorLabel = AppColor.warning500,
  });
  const MyLabelStatus.subscribe({
    super.key,
    this.label = 'Abonado',
    this.colorBody = AppColor.blue100,
    this.colorLabel = AppColor.blue500,
  });
  const MyLabelStatus.refused({
    super.key,
    this.label = 'No aprobado',
    this.colorBody = AppColor.error200,
    this.colorLabel = AppColor.error500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      height: 35,
      decoration: BoxDecoration(
        color: colorBody,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/icons/point.png',
          scale: 2,
          color: colorLabel,
        ),
        spacerXs,
        Text(
          label,
          style: AppTextStyle.buttonTextStyle.copyWith(
            color: colorLabel,
          ),
        )
      ]),
    );
  }
}
