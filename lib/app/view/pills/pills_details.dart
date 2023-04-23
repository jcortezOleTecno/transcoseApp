import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/pills.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class PillsDetailPage extends StatelessWidget {
  const PillsDetailPage(this.pill, {super.key});
  static const route = "pills_detail_page";

  final Pills pill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackButton(),
              MyVideoPlayer(video: pill.videoPreview!),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerS,
                    Text(
                      pill.title ?? '',
                      style: AppTextStyle.h2Style,
                    ),
                    spacerS,
                    MyHtml(text: pill.subtitle ?? '')
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
