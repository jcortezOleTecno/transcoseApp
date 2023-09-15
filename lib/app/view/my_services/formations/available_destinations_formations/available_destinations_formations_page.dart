import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/formations/available_destinations_formations/bloc/available_destinations_formations_state.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../enroll_training/enroll_training.dart';
import 'bloc/available_destinations_formations_cubit.dart';

class AvailableDestinationsFormationsPage extends StatelessWidget {
  const AvailableDestinationsFormationsPage._();

  static const route = '/available_destinations_formations';

  static Widget create(Formation formation) {
    return BlocProvider(
      create: (context) => AvailableDestinationsFormationsCubit(
        getIt<FormationsRepository>(),
        formation,
      ),
      child: const AvailableDestinationsFormationsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableDestinationsFormationsCubit,
        AvailableDestinationsFormationsState>(
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
                        Text('Selecciona una ubicación y descubre sus fechas.',
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
                          Text('Ubicaciones de referencia',
                              style: AppTextStyle.nunitoSans700
                                  .copyWith(fontSize: 20)),
                          spacerM,
                          ...state.locationReferences.map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EnrollTrainingPage.route,
                                    arguments: EnrollTrainingPageArg(
                                        state.formation!, e));
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
                                    context, EnrollTrainingPage.route,
                                    arguments: EnrollTrainingPageArg(
                                        state.formation!, e));
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
