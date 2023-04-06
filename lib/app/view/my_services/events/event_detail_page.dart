import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';
import 'package:vemare/app/domain/model/galery.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage(this.event, {super.key});
  static const route = '/event_detail_page';

  final EventsVemare event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackButton(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.title ?? '', style: AppTextStyle.h2Style),
                    spacerL,
                    if (event.gallery != null)
                      Column(
                        children: event.gallery!.map((e) => _Item(e)).toList(),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.galery, {
    Key? key,
  }) : super(key: key);

  final Gallery galery;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 220,
      width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        Image(
          image: NetworkImage(galery.imagen),
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
                  const Spacer(),
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.blue100,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/icons/Download.png',
                          color: AppColor.primaryBlue,
                          scale: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
