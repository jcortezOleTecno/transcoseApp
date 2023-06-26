import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/event_detail_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/bloc/events_vemare_cubit.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/bloc/events_vemare_state.dart';
import 'package:vemare/app/view/my_services/events/my_events/my_events_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class EventsVemarePage extends StatelessWidget {
  const EventsVemarePage._();
  static const route = '/events_vemare';

  static Widget create() {
    return BlocProvider(
      create: (context) => EventsVemareCubit(
        getIt.get<EventsRepository>(),
      ),
      child: const EventsVemarePage._(),
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
                child: BlocBuilder<EventsVemareCubit, EventsVemareState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.header?.title ?? '',
                            style: AppTextStyle.h1Style),
                        spacerS,
                        Text(state.header?.description ?? '',
                            style: AppTextStyle.defaultStyle),
                        spacerXL,
                      ],
                    );
                  },
                ),
              ),
              // _MyEvents(
              //     icon: true,
              //     title: 'Mis Eventos',
              //     img: Image.asset('assets/imgs/misEventosIMG.png',
              //         fit: BoxFit.cover),
              //     onTap: () {
              //       if (LocalDataRepository().isLogged) {
              //         Navigator.pushNamed(context, MyEventsPage.route);
              //       } else {
              //         Navigator.pushNamed(
              //           context,
              //           LoginPage.route,
              //           arguments:
              //               'Para acceder a la información de los eventos tienes que iniciar sesión.',
              //         ).then((_) {
              //           if (LocalDataRepository().isLogged) {
              //             Navigator.pushNamed(context, MyEventsPage.route);
              //           }
              //         });
              //       }
              //     }),
              // spacerS,
              BlocBuilder<EventsVemareCubit, EventsVemareState>(
                builder: (context, state) {
                  if (state.loading) {
                    return const MyShimmer(
                      height: 220,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                    );
                  }
                  return Column(
                    children: state.eventsVemare
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: _MyEvents(
                                  borderRadius: BorderRadius.circular(12),
                                  img: (e.image != null)
                                      ? MyNetworkImage(
                                          image: e.image!,
                                          fit: BoxFit.cover,
                                          height: 220,
                                        )
                                      : Image.asset(
                                          'assets/imgs/no_image.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                  title: e.title ?? '',
                                  onTap: () {
                                    if (LocalDataRepository().isLogged) {
                                      Navigator.pushNamed(
                                          context, EventDetailPage.route,
                                          arguments: e);
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        LoginPage.route,
                                        arguments:
                                            'Para acceder a la información de los eventos tienes que iniciar sesión.',
                                      ).then((_) {
                                        if (LocalDataRepository().isLogged) {
                                          Navigator.pushNamed(
                                              context, EventDetailPage.route,
                                              arguments: e);
                                        }
                                      });
                                    }
                                  }),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyEvents extends StatelessWidget {
  const _MyEvents({
    this.borderRadius,
    this.onTap,
    this.title,
    required this.img,
    this.icon = false,
    Key? key,
  }) : super(key: key);

  final BorderRadiusGeometry? borderRadius;
  final String? title;
  final Widget img;
  final bool icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: borderRadius),
        margin: const EdgeInsets.only(bottom: 15),
        height: 220,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          img,
          const MyFilterImage(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? '',
                      style: AppTextStyle.linkStyle
                          .copyWith(color: AppColor.white, fontSize: 22),
                    ),
                    Visibility(
                      visible: icon,
                      child: Image.asset(
                        'assets/icons/arrow_next.png',
                        color: AppColor.white,
                        scale: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
