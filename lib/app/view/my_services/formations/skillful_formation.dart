import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/formations/detail_formation.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class SkillFormationPage extends StatelessWidget {
  const SkillFormationPage(this.formations, {super.key});
  static const route = '/skill_formation';

  final Formations formations;

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
                    Text(formations.title ?? '', style: AppTextStyle.h1Style),
                    spacerS,
                    // Text(formations.description ?? '',
                    //     style: AppTextStyle.defaultStyle),
                    MyHtml(
                        text: formations.description ?? '', bodyFontSize: 22),
                    spacerXL,
                    if (formations.formations != null)
                      ...formations.formations!.map((e) => _Item(e))
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
    this.formation, {
    Key? key,
  }) : super(key: key);

  final Formation formation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailFormationPage.route,
          arguments: formation,
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Image.network(
            formation.image ?? '',
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      formation.title ?? '',
                      style: AppTextStyle.h3Style.copyWith(
                        color: AppColor.primaryBlue,
                      ),
                    ),
                  ),
                  spacerS,
                  Image.asset(
                    'assets/icons/arrow_next.png',
                    color: AppColor.primaryBlue,
                    scale: 2,
                  )
                ],
              ),
              spacerS,
              Text(formation.subtitle ?? ' ', style: AppTextStyle.defaultStyle),
              // spacerS,
              // Row(
              //   children: [
              //     Image.asset(
              //       'assets/icons/locate.png',
              //       scale: 2,
              //     ),
              //     spacerS,
              //     const Text(
              //       'Lugar de la formacion',
              //       style: AppTextStyle.defaultStyle,
              //     )
              //   ],
              // ),
              // spacerS,
            ]),
          )
        ]),
      ),
    );
  }
}
