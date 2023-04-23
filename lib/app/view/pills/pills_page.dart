import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/pills_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_pills_card.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/pills/bloc/pills_cubit.dart';
import 'package:vemare/app/view/pills/bloc/pills_state.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../login/login_page.dart';
import 'pills_details.dart';

class PillsPage extends StatelessWidget {
  const PillsPage._();
  static const route = '/pills_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => PillsCubit(
        getIt.get<PillsRepository>(),
      ),
      child: const PillsPage._(),
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
              _MostReadPills(),
              spacerL,
              _Pills(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MostReadPills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Las píldoras más vistas',
            style: AppTextStyle.h2Style,
          ),
        ),
        BlocBuilder<PillsCubit, PillsState>(
          builder: (context, state) {
            if (state.pills.isEmpty) {
              return const MyShimmer(height: 400);
            }
            return SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: state.pills.length,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 0.9,
                ),
                itemBuilder: (context, i) => MyPillsCard(
                  img: state.pills[i].image!,
                  title: state.pills[i].title ?? '',
                  description: state.pills[i].subtitle ?? '',
                  onPressed: () {
                    if (LocalDataRepository().isLogged) {
                      Navigator.pushNamed(context, PillsDetailPage.route,
                          arguments: state.pills[i]);
                    } else {
                      Navigator.pushNamed(
                        context,
                        LoginPage.route,
                        arguments:
                            'Para acceder a las pildoras tienes que iniciar sesión',
                      ).then((_) {
                        if (LocalDataRepository().isLogged) {
                          Navigator.pushNamed(context, PillsDetailPage.route,
                              arguments: state.pills[i]);
                        }
                      });
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Pills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PillsCubit, PillsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Píldoras Vemare', style: AppTextStyle.h2Style),
            ),
            spacerS,
            state.pills.isEmpty
                ? const MyShimmer(
                    height: 300,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  )
                : Column(
                    children: state.pills
                        .map((e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(bottom: 20),
                              // height: 350,
                              child: MyPillsCard(
                                title: e.title ?? '',
                                description: e.subtitle ?? '',
                                img: e.image!,
                                onPressed: () {
                                  if (LocalDataRepository().isLogged) {
                                    Navigator.pushNamed(
                                        context, PillsDetailPage.route,
                                        arguments: e);
                                  } else {
                                    Navigator.pushNamed(
                                      context,
                                      LoginPage.route,
                                      arguments:
                                          'Para acceder a las pildoras tienes que iniciar sesión',
                                    ).then((_) {
                                      if (LocalDataRepository().isLogged) {
                                        Navigator.pushNamed(
                                            context, PillsDetailPage.route,
                                            arguments: e);
                                      }
                                    });
                                  }
                                },
                              ),
                            ))
                        .toList())
          ],
        );
      },
    );
  }
}
