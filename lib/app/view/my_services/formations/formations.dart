import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/formations/skillful_formation.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage({super.key});

  static const route = '/formations_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackButton(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Formaciones Vemare', style: AppTextStyle.h1Style),
                    Text(
                        'Consulta las formaciones disponibles para los profesionales de la reparación: electromecánica, diagnosis, carrocería, gestión comercial...',
                        style: AppTextStyle.defaultStyle),
                    spacerXL,
                    ...List.generate(10, (i) {
                      return MySingleCard(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SkillFormationPage.route);
                          },
                          margin: const EdgeInsets.only(bottom: 15),
                          icon: Image.asset(
                            'assets/icons/Formacion.png',
                            scale: 2,
                          ),
                          title: 'Electromecánica',
                          content:
                              'Información resumida de lo que ofrecemos en este tipo de formación... Lorem ipsum dolor sit amet.Información resumida de lo que ofrecemos en este tipo de formación... Lorem ipsum dolor sit amet');
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
