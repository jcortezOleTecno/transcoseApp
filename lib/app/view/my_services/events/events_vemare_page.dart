import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/other_event_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class EventsVemarePage extends StatelessWidget {
  const EventsVemarePage({super.key});
  static const route = '/events_vemare';

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Eventos Vemare', style: AppTextStyle.h1Style),
                    spacerS,
                    const Text('Selecciona un area de evento',
                        style: AppTextStyle.defaultStyle),
                    spacerXL,
                    _Item(
                      title: 'Mis eventos',
                      content:
                          'Consulta las fechas y toda la información de tus próximos eventos y no te pierdas ningún detalle.',
                      onTap: () {},
                    ),
                    _Item(
                      title: 'Otros eventos',
                      content:
                          'Junto a nuestros proveedores creamos momentos únicos que ahora puedes consultar.',
                      onTap: () {
                        Navigator.pushNamed(context, OtherEventPage.route);
                      },
                    ),
                    _Item(
                      title: 'Eventos Vemare',
                      content:
                          'Encuentros, charlas, presentaciones... Infórmate sobre todos los eventos que creamos para nuestros clientes.',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    this.onTap,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Image.asset(
            'assets/imgs/ADservice.png',
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.h3Style.copyWith(
                      color: AppColor.primaryBlue,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/arrow_next.png',
                    color: AppColor.primaryBlue,
                    scale: 2,
                  )
                ],
              ),
              spacerS,
              Text(content, style: AppTextStyle.defaultStyle),
              spacerS,
            ]),
          )
        ]),
      ),
    );
  }
}
