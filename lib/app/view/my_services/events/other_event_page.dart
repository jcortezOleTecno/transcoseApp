import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/enroll_event.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class OtherEventPage extends StatelessWidget {
  const OtherEventPage({super.key});
  static const route = '/other_event';

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
                      child: const Image(
                        image: AssetImage('assets/imgs/AD360IMG.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
                    spacerS,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nombre del evento', style: AppTextStyle.h2Style),
                        spacerS,
                        Text(
                            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas tempor aliquam nulla nulla. Nullam tempus cursus facilisi fusce ante ullamcorper. Sem euismod fames sapien venenatis cras sit venenatis.
Ut eleifend vel diam cras integer nec enim nibh et. Vulputate mus vitae in sit euismod cras.''',
                            style: AppTextStyle.defaultStyle),
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EnrollEventPage.route);
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
