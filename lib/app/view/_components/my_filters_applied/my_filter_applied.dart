import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../my_spacer/my_spacer.dart';

class FiltersAppliedWidget extends StatelessWidget {
  const FiltersAppliedWidget(
    this.text, {
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filtros aplicados (1):',
                  style: AppTextStyle.defaultStyle.copyWith(),
                ),
                spacerXs,
                Row(
                  children: [
                    Text(
                      'Fecha: ',
                      style: AppTextStyle.defaultStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      text,
                      style: AppTextStyle.defaultStyle.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            top: 20,
            child: IconButton(
                splashRadius: 0.1,
                onPressed: onTap,
                icon: const Icon(
                  Icons.close,
                  color: AppColor.primaryBlue,
                )))
      ],
    );
  }
}
