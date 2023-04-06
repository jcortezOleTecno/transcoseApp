import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/event_detail_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/bloc/events_vemare_cubit.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/bloc/events_vemare_state.dart';
import 'package:vemare/app/view/my_services/events/my_events_page.dart';
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Eventos Vemare', style: AppTextStyle.h1Style),
                    spacerS,
                    Text(
                        'Encuentros, charlas, presentaciones... Infórmate sobre todos los eventos que creamos para nuestros clientes.',
                        style: AppTextStyle.defaultStyle),
                    spacerXL,
                  ],
                ),
              ),
              _MyEvents(
                  icon: true,
                  title: 'Mis Eventos',
                  img: const AssetImage('assets/imgs/misEventosIMG.png'),
                  onTap: () {
                    if (LocalDataRepository().isLogged) {
                      Navigator.pushNamed(context, MyEventsPage.route);
                    } else {
                      Navigator.pushNamed(
                        context,
                        LoginPage.route,
                        arguments: true,
                      ).then((_) {
                        Navigator.pushNamed(context, MyEventsPage.route);
                      });
                    }
                  }),
              spacerS,
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
                                img: NetworkImage(e.image!),
                                title: e.title ?? '',
                                onTap: () => Navigator.pushNamed(
                                    context, EventDetailPage.route,
                                    arguments: e),
                              ),
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
  final ImageProvider<Object> img;
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
          Image(
            image: img,
            fit: BoxFit.cover,
          ),
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
