import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class WorkWithUsPage extends StatelessWidget {
  const WorkWithUsPage({super.key});

  static const route = '/workWithUs';

  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyBackButton(),
                const Image(
                  image: AssetImage('assets/imgs/trabaconnosotrosIMG.png'),
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Trabaja con nosotros',
                        style: AppTextStyle.h2Style,
                      ),
                      spacerS,
                      const Text(
                        '''Bienvenido a Grupo Vemare, compañía líder en la zona centro en la distribución de recambio de automóvil original y equipamiento para el taller. ¿Te gustaría trabajar con nosotros?
          
          Por favor, cumplimenta el siguiente formulario. En cuanto iniciemos un proceso de selección que se ajuste a tu perfil, nos pondremos en contacto contigo. Gracias.''',
                      ),
                      spacerS,
                      const Text(
                        'Formulario',
                        style: AppTextStyle.h3Style,
                      ),
                      spacerS,
                      const MyInput(
                        label: 'Nombre',
                        hintText: 'Nombre de la empresa',
                      ),
                      spacerS,
                      const MyInput(
                        label: 'Teléfono',
                        hintText: '654 321 987',
                      ),
                      spacerS,
                      const MyInput(
                        label: 'E-mail',
                        hintText: 'email@email.com',
                      ),
                      spacerS,
                      MyIconButton(
                        onPressed: () {},
                        text: 'Adjuntar CV',
                        icon: Image.asset(
                          'assets/icons/adjuntar.png',
                          scale: 2,
                        ),
                        variant: MyButtonVariant.outlinedBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
