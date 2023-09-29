import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/about_us_repository.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/library_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/pills_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_cards/my_news_card.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/about_us/bloc/about_us_cubit.dart';
import 'package:vemare/app/view/about_us/bloc/about_us_state.dart';
import 'package:vemare/app/view/library/library_page.dart';
import 'package:vemare/app/view/news/news_page.dart';
import 'package:vemare/app/view/our_history/our_history.dart';
import 'package:vemare/app/view/pills/pills_details.dart';
import 'package:vemare/app/view/pills/pills_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/where_we_are/where_we_are_page.dart';
import 'package:vemare/config/service_locator.dart';

import '../login/login_page.dart';
import '../news/news_details/news_detail.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage._();

  static const route = '/about_us';

  static Widget create() {
    return BlocProvider(
      create: (context) => AboutUsCubit(
        getIt.get<LibraryRepository>(),
        getIt.get<PillsRepository>(),
        getIt.get<NoticesRepository>(),
        getIt.get<AboutUsRepository>(),
        getIt.get<HeaderRepository>(),
      ),
      child: const AboutUsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: BlocBuilder<AboutUsCubit, AboutUsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                        state.headers.isEmpty
                            ? ''
                            : state.headers
                                    .firstWhere((e) => e.module == "AboutUs")
                                    .title ??
                                '',
                        style: AppTextStyle.h1Style),
                  ),
                  _OurHistory(),
                  spacerL,
                  _WhereWeAre(),
                  if (state.redes != null) ...[
                    spacerL,
                    const _SocialNetworks(),
                  ],
                  spacerL,
                  _News(),
                  spacerM,
                  _Library(),
                  spacerL,
                  _PillsVemare(),
                  spacerL,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OurHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, OurHistoryPage.route),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * .80,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/imgs/our_history.png'),
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
                      'Nuestra historia',
                      style: AppTextStyle.linkStyle
                          .copyWith(color: AppColor.white, fontSize: 22),
                    ),
                    Image.asset(
                      'assets/icons/arrow_next.png',
                      color: AppColor.white,
                      scale: 2,
                    ),
                  ],
                ),
                spacerXs,
                Column(
                  children: [
                    SizedBox(
                        child: Text(
                      'Más de 65 años a su servicio como distribuidores de recambio de automovil original.',
                      style: AppTextStyle.contentCard.copyWith(
                        color: AppColor.white,
                        fontSize: 18,
                        height: 1.8,
                      ),
                    ))
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _WhereWeAre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, WhereWeArePage.route);
      },
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/imgs/DondeEstamos.jpeg'),
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
                      '¿Dónde estamos?',
                      style: AppTextStyle.linkStyle
                          .copyWith(color: AppColor.white, fontSize: 22),
                    ),
                    Image.asset(
                      'assets/icons/arrow_next.png',
                      color: AppColor.white,
                      scale: 2,
                    ),
                  ],
                ),
                spacerXs,
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _SocialNetworks extends StatelessWidget {
  const _SocialNetworks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<AboutUsCubit, AboutUsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nuestras redes sociales',
                  style: AppTextStyle.h1Style),
              spacerM,
              item('Facebook', width, state.redes?.facebook ?? ''),
              item('Instagram', width, state.redes?.instagram ?? ''),
              item('YouTube', width, state.redes?.youtube ?? ''),
              item('LinkedIn', width, state.redes?.linkedin ?? ''),
            ],
          ),
        );
      },
    );
  }

  Widget item(String text, double width, String url) => Card(
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: width,
            child: GestureDetector(
              onTap: () {
                launchUrlString(url, mode: LaunchMode.externalApplication);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.blue100,
                    ),
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'assets/icons/$text.png',
                      scale: 2,
                    ),
                  ),
                  spacerS,
                  Expanded(
                    child: Text(
                      text,
                      style: AppTextStyle.linkStyle,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/arrow_next.png',
                    scale: 2,
                  ),
                  spacerS,
                ],
              ),
            ),
          ),
        ),
      );
}

class _News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<AboutUsCubit, AboutUsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                state.headers.isEmpty
                    ? ''
                    : state.headers
                            .firstWhere((e) => e.module == "Notice")
                            .title ??
                        '',
                style: AppTextStyle.h1Style,
              ),
            );
          },
        ),
        BlocBuilder<AboutUsCubit, AboutUsState>(
          builder: (context, state) {
            if (state.news.isEmpty) {
              return const MyShimmer(height: 350);
            }
            return SizedBox(
              height: 360,
              child: PageView.builder(
                itemCount: state.news.length,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 0.9,
                ),
                itemBuilder: (context, i) => MyNewsCardCarrucel(
                  img: state.news[i].image!,
                  title: state.news[i].title ?? '',
                  description: state.news[i].subtitle ?? '',
                  onPressed: () {
                    Navigator.pushNamed(context, NewsDetailPage.route,
                        arguments: state.news[i]);
                  },
                ),
              ),
            );
          },
        ),
        Center(
          child: TextButton.icon(
            onPressed: () => Navigator.pushNamed(context, NewsPage.route),
            label: Image.asset(
              'assets/icons/arrow_next.png',
              scale: 2,
            ),
            icon: const Text(
              'Ver más',
              style: AppTextStyle.linkStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class _Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit, AboutUsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  state.headers.isEmpty
                      ? ''
                      : state.headers
                              .firstWhere((e) => e.module == "Library")
                              .title ??
                          '',
                  style: AppTextStyle.h1Style),
              state.libraries.isEmpty
                  ? const MyShimmer(
                      height: 440,
                      margin: EdgeInsets.zero,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(state.libraries.length, (i) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  state.libraries[i].image ?? '',
                                  height: 220,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(state.libraries[i].title ?? '',
                                        style: AppTextStyle.titleCard),
                                    spacerXs,
                                    Text(state.libraries[i].subtitle ?? '',
                                        style: AppTextStyle.defaultStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
              spacerS,
              Center(
                child: TextButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, LibraryPage.route),
                  label: Image.asset(
                    'assets/icons/arrow_next.png',
                    scale: 2,
                  ),
                  icon: const Text(
                    'Ver más',
                    style: AppTextStyle.linkStyle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PillsVemare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit, AboutUsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  state.headers.isEmpty
                      ? ''
                      : state.headers
                              .firstWhere((e) => e.module == "Pills")
                              .title ??
                          '',
                  style: AppTextStyle.h1Style),
              spacerS,
              state.pills.isEmpty
                  ? const MyShimmer(
                      height: 220,
                      margin: EdgeInsets.zero,
                    )
                  : Column(
                      children: List.generate(state.pills.length, (i) {
                        return GestureDetector(
                          onTap: () {
                            if (LocalDataRepository().isLogged) {
                              Navigator.pushNamed(
                                  context, PillsDetailPage.route,
                                  arguments: state.pills[i]);
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
                                      arguments: state.pills[i]);
                                }
                              });
                            }
                          },
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 20),
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  state.pills[i].image ?? '',
                                  width: double.infinity,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.pills[i].title ?? '',
                                          style: AppTextStyle.titleCard),
                                      spacerXs,
                                      Text(state.pills[i].subtitle ?? '',
                                          style: AppTextStyle.defaultStyle),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
              Center(
                child: TextButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, PillsPage.route),
                  label: Image.asset(
                    'assets/icons/arrow_next.png',
                    scale: 2,
                  ),
                  icon: const Text(
                    'Ver más',
                    style: AppTextStyle.linkStyle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
