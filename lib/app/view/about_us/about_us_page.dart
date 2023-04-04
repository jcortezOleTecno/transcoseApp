import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/library_repository.dart';
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
import 'package:vemare/app/view/pills/pills_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/where_we_are/where_we_are_page.dart';
import 'package:vemare/config/service_locator.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage._();

  static const route = '/about_us';

  static Widget create() {
    return BlocProvider(
      create: (context) => AboutUsCubit(
        getIt.get<LibraryRepository>(),
        getIt.get<PillsRepository>(),
        getIt.get<NoticesRepository>(),
      ),
      child: const AboutUsPage._(),
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
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Sobre nosotros', style: AppTextStyle.h1Style),
              ),
              _OurHistory(),
              spacerL,
              _WhereWeAre(),
              spacerL,
              const _SocialNetworks(),
              spacerL,
              _News(),
              spacerM,
              _Library(),
              spacerL,
              _PillsVemare(),
              spacerL,
            ],
          ),
        ),
      ),
    );
  }
}

class _OurHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            image: AssetImage('assets/imgs/donde_estamos.png'),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Redes Sociales', style: AppTextStyle.h1Style),
          spacerM,
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                item('Facebook', width),
                item('Instagram', width),
                item('YouTube', width),
                item('Twitter', width),
                item('LinkedIn', width),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget item(String text, double width) => SizedBox(
        width: width * .40,
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
            Text(
              text,
              style: AppTextStyle.linkStyle,
            )
          ],
        ),
      );
}

class _News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Noticias',
            style: AppTextStyle.h1Style,
          ),
        ),
        BlocBuilder<AboutUsCubit, AboutUsState>(
          builder: (context, state) {
            if (state.news.isEmpty) {
              return const MyShimmer(height: 220);
            }
            return SizedBox(
              height: 400,
              child: PageView.builder(
                itemCount: state.news.length,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 0.9,
                ),
                itemBuilder: (context, i) => MyNewsCard(
                  img: state.news[i].image!,
                  title: state.news[i].title ?? '',
                  description: state.news[i].description ?? '',
                  onPressed: () {},
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
              const Text('Bilioteca', style: AppTextStyle.h1Style),
              state.libraries.isEmpty
                  ? const MyShimmer(
                      height: 440,
                      margin: EdgeInsets.zero,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(state.libraries.length, (i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spacerM,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                state.libraries[i].image ?? '',
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            spacerS,
                            Text(state.libraries[i].title ?? '',
                                style: AppTextStyle.titleCard),
                            spacerXs,
                            Text(state.libraries[i].subtitle ?? '',
                                style: AppTextStyle.defaultStyle),
                          ],
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
              const Text('Píldoras Vemare', style: AppTextStyle.h1Style),
              spacerS,
              state.pills.isEmpty
                  ? const MyShimmer(
                      height: 440,
                      margin: EdgeInsets.zero,
                    )
                  : Column(
                      children: List.generate(state.pills.length, (i) {
                        return Card(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
