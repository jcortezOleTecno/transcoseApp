import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyBackButton(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        formation.image!,
                        fit: BoxFit.cover,
                      ),
                    )),
                    spacerS,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formation.title ?? '',
                            style: AppTextStyle.h2Style),
                        spacerS,
                        Text(formation.description ?? '',
                            style: AppTextStyle.defaultStyle),
                        spacerM,
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/locate.png',
                              scale: 2,
                            ),
                            spacerS,
                            const Text(
                              'Lugar de la formacion',
                              style: AppTextStyle.defaultStyle,
                            )
                          ],
                        ),
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyButton(
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
                    spacerS,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
