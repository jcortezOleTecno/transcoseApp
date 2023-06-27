import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../_components/my_spacer/my_spacer.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage(this.news, {super.key});
  static const route = "news_detail_page";

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackButton(),
              MyNetworkImage(
                image: news.image!,
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
                      style: AppTextStyle.defaultStyle,
                    ),
                    spacerS,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MyHtml(text: news.description ?? ''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
