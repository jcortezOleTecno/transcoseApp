import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/login/login_page.dart';

import '../../_components/my_spacer/my_spacer.dart';
import '../../theme/text_style.dart';
import 'sat_page.dart';

class SatIntroPage extends StatelessWidget {
  const SatIntroPage({super.key});
  static const route = '/sat_intro_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyBackButton(),
            Image.asset(
              'assets/imgs/satImg.png',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SAT',
                      style: AppTextStyle.h2Style,
                    ),
                    spacerS,
                    Text(
                      '''Nuestro Servicio de Asistencia Técnica, siempre preparado para ofrecerte el mejor servicio. 
Seleccione la sección correspondiente a la consulta que desea realizar, y rellene los datos solicitados. Contactaremos con usted en el menor tiempo posible para solventar su incidencia.''',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyButton(
                onPressed: () {
                  if (LocalDataRepository().isLogged) {
                    Navigator.pushNamed(context, SatPage.route);
                  } else {
                    Navigator.pushNamed(
                      context,
                      LoginPage.route,
                      arguments:
                          'Para acceder al servicio SAT tienes que iniciar sesión',
                    ).then((_) {
                      if (LocalDataRepository().isLogged) {
                        Navigator.pushNamed(
                          context,
                          SatPage.route,
                        );
                      }
                    });
                  }
                },
                text: 'Continuar',
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
