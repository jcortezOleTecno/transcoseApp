import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_news_card.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/news/news_details/bloc/news_details_state.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../../_components/my_spacer/my_spacer.dart';
import 'bloc/news_details_cubit.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage._(this.news);
  static const route = "news_detail_page";

  static Widget create(News news) {
    return BlocProvider(
      create: (context) =>
          NewsDetailsCubit(getIt.get<NoticesRepository>(), news.id.toString()),
      child: NewsDetailPage._(news),
    );
  }

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsDetailsCubit, NewsDetailsState>(
        builder: (context, state) {
          return MyBody(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBackButton(),
                  MyNetworkImage(
                    image: news.imagePrivate!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title ?? '',
                          style: AppTextStyle.h2Style,
                        ),
                        spacerXs,
                        Text(
                          news.subtitle ?? '',
                          style: AppTextStyle.defaultStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        spacerS,
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: MyHtml(text: news.description ?? ''),
                  ),
                  if(news.videos.isNotEmpty)...[
                    ...news.videos.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                      child: MyVideoPlayer(video: e.link!),
                    )).toList()
                  ],
                  if (state.details != null) ...[
                    if (state.details!.related?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Noticias relacionadas",
                          style:
                              AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
                        ),
                      ),
                    ...state.details!.related!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: MyNewsCard(
                              title: e.title ?? '',
                              description: e.subtitle ?? '',
                              img: e.imagePrivate!,
                              onPressed: () => Navigator.pushNamed(
                                  context, NewsDetailPage.route,
                                  arguments: e),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                  const Footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
