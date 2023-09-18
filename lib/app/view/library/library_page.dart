import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/library_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_library_card.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/library/bloc/library_cubit.dart';
import 'package:vemare/app/view/library/bloc/library_state.dart';
import 'package:vemare/app/view/library/library_detail.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../_components/my_cards/my_news_card.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage._();
  static const route = '/library_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => LibraryCubit(
        getIt.get<LibraryRepository>(),
      ),
      child: const LibraryPage._(),
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
              _MostReadLibraries(),
              spacerL,
              _Libraries(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MostReadLibraries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Los artículos más leídos',
            style: AppTextStyle.h2Style,
          ),
        ),
        BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            if (state.mostRead.isEmpty) {
              return const MyShimmer(height: 400);
            }
            return SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: state.mostRead.length,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 0.9,
                ),
                itemBuilder: (context, i) => MyNewsCardCarrucel(
                  img: state.mostRead[i].image!,
                  title: state.mostRead[i].title ?? '',
                  description: state.mostRead[i].subtitle ?? '',
                  onPressed: () {
                    if (LocalDataRepository().isLogged) {
                      Navigator.pushNamed(context, LibraryDetailPage.route,
                          arguments: state.mostRead[i]);
                    } else {
                      Navigator.pushNamed(
                        context,
                        LoginPage.route,
                        arguments:
                            'Para acceder a la biblioteca tienes que iniciar sesión',
                      ).then((_) {
                        if (LocalDataRepository().isLogged) {
                          Navigator.pushNamed(context, LibraryDetailPage.route,
                              arguments: state.mostRead[i]);
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

class _Libraries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Biblioteca Vemare', style: AppTextStyle.h2Style),
            ),
            spacerS,
            state.library.isEmpty
                ? const MyShimmer(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  )
                : Column(
                    children: state.library
                        .map((e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(bottom: 20),
                              child: MyNewsCard(
                                title: e.title ?? '',
                                description: e.subtitle ?? '',
                                img: e.image!,
                                onPressed: () {
                                  if (LocalDataRepository().isLogged) {
                                    Navigator.pushNamed(
                                        context, LibraryDetailPage.route,
                                        arguments: e);
                                  } else {
                                    Navigator.pushNamed(
                                      context,
                                      LoginPage.route,
                                      arguments:
                                          'Para acceder a la biblioteca tienes que iniciar sesión',
                                    ).then((_) {
                                      if (LocalDataRepository().isLogged) {
                                        Navigator.pushNamed(
                                            context, LibraryDetailPage.route,
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
