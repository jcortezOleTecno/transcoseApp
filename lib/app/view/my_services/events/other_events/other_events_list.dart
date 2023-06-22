import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/bloc/other_events_cubit.dart';
import 'package:vemare/app/view/my_services/events/other_events/bloc/other_events_state.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_event_page.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class OtherEventsListPage extends StatelessWidget {
  const OtherEventsListPage._();
  static const route = '/other_events_list';

  static Widget create() {
    return BlocProvider(
      create: (context) => OtherEventsCubit(
        getIt.get<EventsRepository>(),
      ),
      child: const OtherEventsListPage._(),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Eventos Vemare', style: AppTextStyle.h1Style),
                    spacerS,
                    const Text(
                        'Encuentros, charlas, presentaciones... Infórmate sobre todos los eventos que creamos para nuestros clientes.',
                        style: AppTextStyle.defaultStyle),
                    spacerL,
                    BlocBuilder<OtherEventsCubit, OtherEventsState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            runSpacing: 15,
                            spacing: 15,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: List.generate(
                              4,
                              (_) => MyShimmer(
                                borderRadius: 12,
                                margin: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width * .44,
                                height: 220,
                              ),
                            ),
                          );
                        }
                        return Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            runSpacing: 15,
                            spacing: 15,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: state.events
                                .map((e) => _MyEventCard(e))
                                .toList());
                      },
                    ),
                    spacerL,
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

class _MyEventCard extends StatelessWidget {
  const _MyEventCard(
    this.event, {
    Key? key,
  }) : super(key: key);

  final Events event;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (LocalDataRepository().isLogged) {
          Navigator.pushNamed(context, OtherEventPage.route, arguments: event);
        } else {
          Navigator.pushNamed(
            context,
            LoginPage.route,
            arguments:
                'Para acceder a la información de los eventos tienes que iniciar sesión.',
          ).then((_) {
            if (LocalDataRepository().isLogged) {
              Navigator.pushNamed(context, OtherEventPage.route,
                  arguments: event);
            }
          });
        }
      },
      child: SizedBox(
        width: size.width * .44,
        // height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: event.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  event.image!,
                  height: size.width * .44,
                  width: size.width * .44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            spacerS,
            Text(
              event.title ?? '',
              style: AppTextStyle.titleCard,
            ),
            spacerS,
            Text(
              event.subtitle ?? '',
              style: AppTextStyle.defaultStyle,
            )
          ],
        ),
      ),
    );
  }
}
