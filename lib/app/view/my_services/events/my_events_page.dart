import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});
  static const route = '/my_events_page';

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Mis eventos', style: AppTextStyle.h1Style),
                    spacerS,
                    const Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat interdum bibendum urna curabitur sociis vestibulum quam risus, varius. Tortor morbi ut malesuada ipsum elementum.''',
                        style: AppTextStyle.defaultStyle),
                    spacerL,
                    Center(
                      child: Wrap(
                        runSpacing: 15,
                        spacing: 15,
                        children: List.generate(11, (i) {
                          return _MyEventCard();
                        }),
                      ),
                    ),
                    spacerL,
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

class _MyEventCard extends StatelessWidget {
  const _MyEventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .42,
      // height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/imgs/formacionesIMG.png',
              height: size.width * .42,
              width: size.width * .42,
              fit: BoxFit.cover,
            ),
          ),
          spacerS,
          Text(
            'Lorem ipsum',
            style: AppTextStyle.titleCard,
          ),
          spacerS,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elit duis turpis tortor feugiat malesuada mi euismod.',
            style: AppTextStyle.defaultStyle,
          )
        ],
      ),
    );
  }
}
