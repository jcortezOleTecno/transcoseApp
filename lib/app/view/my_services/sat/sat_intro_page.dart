import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/we_help_you.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import '../../_components/my_spacer/my_spacer.dart';
import '../../theme/text_style.dart';
import 'sat_page.dart';

class SatIntroPage extends StatelessWidget {
  const SatIntroPage(this.sat, {super.key});
  static const route = '/sat_intro_page';

  final WeHelpYouData sat;

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
                    MyNetworkImage(
                      image: sat.image ?? '',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SAT',
                            style: AppTextStyle.h2Style,
                          ),
                          spacerS,
                          MyHtml(text: sat.description ?? '')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyButton(
                onPressed: () {
                  // if (LocalDataRepository().isLogged) {
                  Navigator.pushNamed(context, SatPage.route);
                  // } else {
                  //   Navigator.pushNamed(
                  //     context,
                  //     LoginPage.route,
                  //     arguments:
                  //         'Para acceder al servicio SAT tienes que iniciar sesión',
                  //   ).then((_) {
                  //     if (LocalDataRepository().isLogged) {
                  //       Navigator.pushNamed(
                  //         context,
                  //         SatPage.route,
                  //       );
                  //     }
                  // });
                  // }
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
