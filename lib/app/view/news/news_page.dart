import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_news_card.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/news/bloc/news_cubit.dart';
import 'package:vemare/app/view/news/bloc/news_state.dart';
import 'package:vemare/app/view/news/news_details/news_detail.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class NewsPage extends StatelessWidget {
  const NewsPage._();
  static const route = '/news_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => NewsCubit(
        getIt.get<NoticesRepository>(),
      ),
      child: const NewsPage._(),
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
              _MostReadNews(),
              spacerL,
              _News(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MostReadNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Las noticias más leídas',
            style: AppTextStyle.h2Style,
          ),
        ),
        BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state.mostRead.isEmpty) {
              return const MyShimmer(height: 350);
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
                  isExpanded: true,
                  img: state.mostRead[i].image!,
                  title: state.mostRead[i].title ?? '',
                  description: state.mostRead[i].subtitle ?? '',
                  onPressed: () {
                    Navigator.pushNamed(context, NewsDetailPage.route,
                        arguments: state.mostRead[i]);
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

class _News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Noticias', style: AppTextStyle.h2Style),
            ),
            spacerS,
            state.news.isEmpty
                ? const MyShimmer(
                    height: 350,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  )
                : Column(
                    children: state.news
                        .map((e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(bottom: 20),
                              // height: 400,
                              child: MyNewsCard(
                                title: e.title ?? '',
                                description: e.subtitle ?? '',
                                img: e.image!,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, NewsDetailPage.route,
                                      arguments: e);
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
