import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import 'enroll_event/enroll_event.dart';

class AvailableDestinationsPage extends StatelessWidget {
  const AvailableDestinationsPage(this.event, {super.key});

  static const route = '/available_destinations';

  final Events event;

  @override
  Widget build(BuildContext context) {
    final List<Destinations> destinations = [
      Destinations('Málaga', 'C/Luis F. Pallardo Peinado 7, 29007 Málaga'),
      Destinations(
          'Barcelona', 'Pg. de la Zona Franca, 244, 08038 Barcelona, España'),
      Destinations('Madrid', 'C. de Campomanes, 10, 28013 Madrid, España'),
    ];

    return Scaffold(
      body: MyBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyBackButton(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Destinos disponibles',
                      style: AppTextStyle.h1Style),
                  const Text('Selecciona una ubicación',
                      style: AppTextStyle.defaultStyle),
                  spacerM,
                  ...destinations.map((e) => GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          EnrollEventPage.route,
                          arguments: event,
                        ),
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      e.name,
                                      style: AppTextStyle.titleCard.copyWith(
                                          color: AppColor.primaryBlue),
                                    )),
                                    Image.asset(
                                      'assets/icons/arrow_next.png',
                                      scale: 2,
                                    )
                                  ],
                                ),
                                spacerXs,
                                Text(
                                  e.adress,
                                  style: AppTextStyle.contentCard,
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Destinations {
  final String name;
  final String adress;

  Destinations(this.name, this.adress);
}
