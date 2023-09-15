import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/other_events/available_destinations/bloc/available_destinations_state.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

// import '../enroll_event/enroll_event.dart';
import '../enroll_event/enroll_event.dart';
import 'bloc/available_destinations_cubit.dart';

class AvailableDestinationsPage extends StatelessWidget {
  const AvailableDestinationsPage._();

  static const route = '/available_destinations';

  static Widget create(Events event) {
    return BlocProvider(
      create: (context) => AvailableDestinationsCubit(
        getIt<EventsRepository>(),
        event,
      ),
      child: const AvailableDestinationsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableDestinationsCubit, AvailableDestinationsState>(
      builder: (context, state) {
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
                        Text('Ubicaciones disponibles',
                            style:
                                AppTextStyle.nunito800.copyWith(fontSize: 24)),
                        Text('Selecciona una ubicación  y descubre sus fechas.',
                            style: AppTextStyle.defaultStyle
                                .copyWith(fontSize: 16)),
                        spacerM,
                        if (state.loading)
                          ...List.generate(
                              4,
                              (_) => const MyShimmer(
                                    height: 80,
                                    borderRadius: 5,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 20),
                                  )),
                        if (state.locationReferences.isNotEmpty &&
                            !state.loading) ...[
                          // spacerM,
                          Text('Ubicaciones de referencia',
                              style: AppTextStyle.nunitoSans700
                                  .copyWith(fontSize: 20)),
                          spacerM,
                          ...state.locationReferences.map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EnrollEventPage.route,
                                    arguments:
                                        EnrollEventPageArgs(state.event!, e));
                              },
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            e.center ?? '',
                                            style: AppTextStyle.titleCard
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryBlue),
                                          )),
                                          Image.asset(
                                            'assets/icons/arrow_next.png',
                                            scale: 2,
                                          )
                                        ],
                                      ),
                                      spacerXs,
                                      Text(
                                        e.location ?? '',
                                        style: AppTextStyle.contentCard,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        if (state.location.isNotEmpty && !state.loading) ...[
                          Text('Otras ubicaciones',
                              style: AppTextStyle.nunitoSans700
                                  .copyWith(fontSize: 20)),
                          spacerM,
                          ...state.location.map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EnrollEventPage.route,
                                    arguments:
                                        EnrollEventPageArgs(state.event!, e));
                              },
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            e.center ?? '',
                                            style: AppTextStyle.titleCard
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryBlue),
                                          )),
                                          Image.asset(
                                            'assets/icons/arrow_next.png',
                                            scale: 2,
                                          )
                                        ],
                                      ),
                                      spacerXs,
                                      Text(
                                        e.location ?? '',
                                        style: AppTextStyle.contentCard,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        if (state.location.isNotEmpty && !state.loading)
                          ...state.location.map(
                            (e) => GestureDetector(
                              onTap: () {
                                if (state.event!.showCalendar ?? false) {
                                  Navigator.pushNamed(
                                      context, EnrollEventPage.route,
                                      arguments:
                                          EnrollEventPageArgs(state.event!, e));
                                }
                              },
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            e.center ?? '',
                                            style: AppTextStyle.titleCard
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryBlue),
                                          )),
                                          Image.asset(
                                            'assets/icons/arrow_next.png',
                                            scale: 2,
                                          )
                                        ],
                                      ),
                                      spacerXs,
                                      Text(
                                        e.location ?? '',
                                        style: AppTextStyle.contentCard,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
