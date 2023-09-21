import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/library_repository.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_news_card.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/library/library_details/bloc/library_details_state.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/library_details_cubit.dart';

class LibraryDetailPage extends StatelessWidget {
  const LibraryDetailPage._(this.library);
  static const route = "library_detail_page";

  static Widget create(Library library) {
    return BlocProvider(
      create: (context) => LibraryDetailsCubit(
          getIt.get<LibraryRepository>(), library.id.toString()),
      child: LibraryDetailPage._(library),
    );
  }

  final Library library;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LibraryDetailsCubit, LibraryDetailsState>(
        builder: (context, state) {
          return MyBody(
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
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          library.title ?? '',
                          style: AppTextStyle.h2Style,
                        ),
                        spacerXs,
                        Text(
                          library.subtitle ?? '',
                          style: AppTextStyle.defaultStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        spacerS,
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: MyHtml(text: library.description ?? ''),
                  ),
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
                              description: e.description ?? '',
                              img: e.imagePrivate!,
                              onPressed: () => Navigator.pushNamed(
                                  context, LibraryDetailPage.route,
                                  arguments: e),
                            ),
                          ),
                        )
                        .toList(),
                  ]
                  /*Padding(
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
                  )*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
