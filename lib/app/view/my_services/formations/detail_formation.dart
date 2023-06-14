import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/enroll_training.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class DetailFormationPage extends StatelessWidget {
  const DetailFormationPage(this.formation, {super.key});

  static const route = '/detail_formation';

  final Formation formation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          children: [
            Expanded(
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              formation.image!,
                              fit: BoxFit.cover,
                              height: 250,
                            ),
                          ),
                          spacerS,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(formation.title ?? '',
                                  style: AppTextStyle.h2Style),
                              spacerS,
                              // Text(formation.description ?? '',
                              //     style: AppTextStyle.defaultStyle),
                              MyHtml(text: formation.description ?? ''),
                              // spacerM,
                              // Row(
                              //   children: [
                              //     Image.asset(
                              //       'assets/icons/locate.png',
                              //       scale: 2,
                              //     ),
                              //     spacerS,
                              //     const Text(
                              //       'Lugar de la formacion',
                              //       style: AppTextStyle.defaultStyle,
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                          spacerS,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyButton(
                width: double.infinity,
                onPressed: () {
                  if (LocalDataRepository().isLogged) {
                    Navigator.pushNamed(
                      context,
                      EnrollTrainingPage.route,
                      arguments: formation,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      LoginPage.route,
                      arguments: true,
                    ).then((_) {
                      Navigator.pushNamed(
                        context,
                        EnrollTrainingPage.route,
                        arguments: formation,
                      );
                    });
                  }
                },
                text: 'Continuar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
