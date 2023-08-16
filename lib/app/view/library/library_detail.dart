import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class LibraryDetailPage extends StatelessWidget {
  const LibraryDetailPage(this.library, {super.key});
  static const route = "library_detail_page";

  final Library library;

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
                image: library.imagePrivate!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      library.title ?? '',
                      style: AppTextStyle.h2Style,
                    ),
                    spacerS,
                    MyHtml(text: library.subtitle ?? '')
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
