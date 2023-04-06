import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/bloc/formations_cubit.dart';
import 'package:vemare/app/view/my_services/formations/formations/bloc/formations_state.dart';
import 'package:vemare/app/view/my_services/formations/skillful_formation.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage._();

  static const route = '/formations_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => FormationsCubit(
        getIt.get<FormationsRepository>(),
      ),
      child: const FormationsPage._(),
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
                    const Text('Formaciones Vemare',
                        style: AppTextStyle.h1Style),
                    const Text(
                        'Consulta las formaciones disponibles para los profesionales de la reparación: electromecánica, diagnosis, carrocería, gestión comercial...',
                        style: AppTextStyle.defaultStyle),
                    spacerXL,
                    BlocBuilder<FormationsCubit, FormationsState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return Column(
                            children: List.generate(
                              4,
                              (_) => const MyShimmer(
                                borderRadius: 3,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: state.formations
                              .map(
                                (e) => MySingleCard(
                                  title: e.title ?? '',
                                  content: e.description ?? '',
                                  margin: const EdgeInsets.only(bottom: 15),
                                  onTap: () {
                                    if (LocalDataRepository().isLogged) {
                                      Navigator.pushNamed(
                                        context,
                                        SkillFormationPage.route,
                                        arguments: e,
                                      );
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        LoginPage.route,
                                        arguments:
                                            'Inicia sesión para conocer más detalles de esta formación',
                                      ).then((_) {
                                        if (LocalDataRepository().isLogged) {
                                          Navigator.pushNamed(
                                            context,
                                            SkillFormationPage.route,
                                            arguments: e,
                                          );
                                        }
                                      });
                                    }
                                  },
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
