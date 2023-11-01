import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/domain/model/article_abou_us.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/our_history/bloc/our_history_cubit.dart';
import 'package:vemare/app/view/our_history/bloc/our_history_state.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class OurHistoryPage extends StatelessWidget {
  const OurHistoryPage({super.key});

  static const route = '/our_history';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurHistoryCubit, OurHistoryState>(
      builder: (context, state) {
        return Scaffold(
          body: MyBody(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
                  children: const [
                    MyBackButton(),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Nuestra Historia', style: AppTextStyle.h1Style),
                ),
                ...state.articles.map((e) => _Article(e)).toList()
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Article extends StatelessWidget {
  const _Article(this.article);

  final ArticleAboutUs article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        Visibility(
          visible: article.image != null && article.image != "",
          child: MyNetworkImage(
              image: article.image!,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 220),
        ),
        spacerM,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? '',
                style:
                    AppTextStyle.h2Style.copyWith(fontWeight: FontWeight.bold),
              ),
              spacerXs,
              MyHtml(text: article.description ?? ''),
            ],
          ),
        ),
      ],
    );
  }
}
