import 'package:flutter/material.dart';

import '../_components/my_spacer/my_spacer.dart';
import '../personal_area/widgets/no_contracts.dart';
import '../theme/text_style.dart';

class AccessDeniedWidget extends StatelessWidget {
  const AccessDeniedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'No tienes acceso a esta área.',
            style: AppTextStyle.h1Style,
          ),
          spacerS,
          Text(
            'Contactate con el gerente de tu empresa o con el administrador para solicitar permisos.',
            style: AppTextStyle.defaultStyle,
          ),
          spacerXL,
          NoResultWidget('Acceso denegado, no tienes los permisos necesarios.')
        ],
      ),
    );
  }
}
