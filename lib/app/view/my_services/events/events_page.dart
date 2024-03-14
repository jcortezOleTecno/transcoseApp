import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/events_vemare_page.dart';
import 'package:vemare/app/view/my_services/events/my_events/my_events_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_events_list.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/events_cubit.dart';
import 'bloc/events_state.dart';

class EventsPage extends StatelessWidget {
  const EventsPage._();
  static const route = '/events';

  static Widget create() {
    return BlocProvider(
      create: (context) => EventsCubit(
        getIt.get<HeaderRepository>(),
      ),
      child: const EventsPage._(),
    );
  }

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
                child: BlocBuilder<EventsCubit, EventsState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.hPage?.title ?? '',style: AppTextStyle.h1Style),
                        spacerS,
                        if(state.hPage != null && state.hPage!.description != null && state.hPage!.description!.isNotEmpty)...[
                          Text(state.hPage?.description ?? '',
                              style: AppTextStyle.defaultStyle),
                          spacerXL,
                        ],
                        _Item(
                          title: 'Mis eventos',
                          content:
                              'Consulta las fechas y toda la información de tus próximos eventos y no te pierdas ningún detalle.',
                          img: 'assets/imgs/misEventosIMG.png',
                          onTap: () {
                            if (LocalDataRepository().isLogged) {
                              Navigator.pushNamed(context, MyEventsPage.route);
                            } else {
                              Navigator.pushNamed(
                                context,
                                LoginPage.route,
                                arguments:
                                    'Para acceder a la información de los eventos tienes que iniciar sesión.',
                              ).then((_) {
                                if (LocalDataRepository().isLogged) {
                                  Navigator.pushNamed(
                                      context, MyEventsPage.route);
                                }
                              });
                            }
                          },
                        ),
                        _Item(
                          title: 'Eventos Transcose',
                          img: 'assets/imgs/otrosEventosIMG.png',
                          content:
                              'Encuentros, charlas, presentaciones... Infórmate sobre todos los eventos que creamos para nuestros clientes.',
                          onTap: () {
                            // Navigator.pushNamed(context, OtherEventsListPage.route);
                            Navigator.pushNamed(
                                context, OtherEventsListPage.route);

                            /* if (LocalDataRepository().isLogged) {
                              Navigator.pushNamed(
                                  context, OtherEventsListPage.route);
                            } else {
                              Navigator.pushNamed(
                                context,
                                LoginPage.route,
                                arguments:
                                    'Para acceder a la información de los eventos tienes que iniciar sesión.',
                              ).then((_) {
                                if (LocalDataRepository().isLogged) {
                                  Navigator.pushNamed(
                                      context, OtherEventsListPage.route);
                                }
                              });
                            }*/
                          },
                        ),
                        _Item(
                          title: 'Eventos celebrados',
                          img: 'assets/imgs/eventosVemareIMG.png',
                          content:
                              'Junto a nuestros proveedores creamos momentos únicos que ahora puedes consultar.',
                          onTap: () {
                            //Navigator.pushNamed(context, EventsVemarePage.route);

                            if (LocalDataRepository().isLogged) {
                              Navigator.pushNamed(
                                  context, EventsVemarePage.route);
                            } else {
                              Navigator.pushNamed(
                                context,
                                LoginPage.route,
                                arguments:
                                    'Para acceder a la información de los eventos tienes que iniciar sesión.',
                              ).then((_) {
                                if (LocalDataRepository().isLogged) {
                                  Navigator.pushNamed(
                                      context, EventsVemarePage.route);
                                }
                              });
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Footer(),
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
    required this.img,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String content;
  final String img;

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
            img,
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
