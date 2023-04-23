import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class FiltersAppliedWidget extends StatelessWidget {
  const FiltersAppliedWidget(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: Text(
          'Filtros aplicados: $text',
          style: AppTextStyle.defaultStyle.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
