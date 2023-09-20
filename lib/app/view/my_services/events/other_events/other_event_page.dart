import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/available_destinations/available_destinations_page.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class OtherEventPage extends StatelessWidget {
  const OtherEventPage(this.event, {super.key});
  static const route = '/other_event';

  final Events event;

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
                          Hero(
                            tag: event.id!,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: NetworkImage(event.imagePrivate!),
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            ),
                          ),
                          spacerS,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(event.title ?? '',
                                  style: AppTextStyle.nunitoSans800
                                      .copyWith(fontSize: 24)),
                              spacerS,
                              MyHtml(text: event.description ?? ''),
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
            // if (event.horario?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyButton(
                width: double.infinity,
                onPressed: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   AvailableDestinationsPage.route,
                  //   arguments: event,

                  if (LocalDataRepository().isLogged) {
                    Navigator.pushNamed(
                      context,
                      AvailableDestinationsPage.route,
                      arguments: event,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      LoginPage.route,
                      arguments:
                          'Para acceder a la información de los eventos tienes que iniciar sesión.',
                    ).then((_) {
                      if (LocalDataRepository().isLogged) {
                        Navigator.pushNamed(
                          context,
                          AvailableDestinationsPage.route,
                          arguments: event,
                        );
                      }
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
