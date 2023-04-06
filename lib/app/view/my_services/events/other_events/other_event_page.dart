import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/enroll_event.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class OtherEventPage extends StatelessWidget {
  const OtherEventPage(this.event, {super.key});
  static const route = '/other_event';

  final Events event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyBackButton(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Hero(
                      tag: event.id!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: NetworkImage(event.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                    spacerS,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title ?? '', style: AppTextStyle.h2Style),
                        spacerS,
                        Text(event.description ?? '',
                            style: AppTextStyle.defaultStyle),
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EnrollEventPage.route);
                        },
                        text: 'Continuar',
                      ),
                    ),
                    spacerS,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
