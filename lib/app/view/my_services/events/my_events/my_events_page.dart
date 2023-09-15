import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/my_event.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/my_events/bloc/my_events_state.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_events_cubit.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage._();
  static const route = '/my_events_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyEventsCubit(
        getIt.get<EventsRepository>(),
      ),
      child: const MyEventsPage._(),
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
                child: BlocBuilder<MyEventsCubit, MyEventsState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Mis eventos', style: AppTextStyle.h1Style),
                        spacerS,
                        if (state.eventsVemare.isNotEmpty)
                          const Text(
                              'Consulta las fechas y toda la información de tus próximos eventos y no te pierdas ningún detalle.',
                              style: AppTextStyle.defaultStyle),
                        spacerL,
                        BlocBuilder<MyEventsCubit, MyEventsState>(
                          builder: (context, state) {
                            if (state.loading) {
                              return Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                runSpacing: 15,
                                spacing: 15,
                                // crossAxisAlignment: WrapCrossAlignment.center,
                                children: List.generate(
                                  4,
                                  (_) => MyShimmer(
                                    borderRadius: 12,
                                    margin: EdgeInsets.zero,
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    height: 220,
                                  ),
                                ),
                              );
                            }

                            if (!state.loading && state.eventsVemare.isEmpty) {
                              return const NoResultWidget(
                                "Actualmente no tienes contratado este servicio. ",
                                subTittle:
                                    "Si quieres más información contacta con tu comercial habitual",
                              );
                            }
                            return Wrap(
                              runSpacing: 15,
                              spacing: 15,
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: state.eventsVemare
                                  .map((e) => _MyEventCard(e))
                                  .toList(),
                            );
                          },
                        ),
                        spacerL,
                      ],
                    );
                  },
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

  final MyEvents event;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .44,
      // height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              event.image!,
              height: size.width * .44,
              width: size.width * .44,
              fit: BoxFit.cover,
            ),
          ),
          spacerS,
          Text(
            event.title ?? '',
            style: AppTextStyle.titleCard,
          ),
          spacerS,
          MyHtml(text: event.description ?? ''),
          // Text(
          //   event.description ?? '',
          //   style: AppTextStyle.defaultStyle,
          // )
        ],
      ),
    );
  }
}
