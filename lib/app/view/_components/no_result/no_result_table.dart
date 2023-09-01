import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class NoResultTable extends StatelessWidget {
  const NoResultTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'No se encontraron resultados',
      style: AppTextStyle.h4Style,
    ));
  }
}
