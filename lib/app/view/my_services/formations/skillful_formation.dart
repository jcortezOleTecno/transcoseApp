import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/formations/detail_formation.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class SkillFormationPage extends StatelessWidget {
  const SkillFormationPage({super.key});
  static const route = '/skill_formation';

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
                    const Text('Electromecánica', style: AppTextStyle.h1Style),
                    spacerS,
                    const Text(
                        'Información resumida de lo que ofrecemos en este tipo de formación... Lorem ipsum dolor sit amet.',
                        style: AppTextStyle.defaultStyle),
                    spacerXL,
                    ...List.generate(6, (i) {
                      return const _Item();
                    })
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
  const _Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailFormationPage.route);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Image.asset(
            'assets/imgs/ADservice.png',
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lorem ipsum is simply',
                    style: AppTextStyle.h3Style.copyWith(
                      color: AppColor.primaryBlue,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/arrow_next.png',
                    color: AppColor.primaryBlue,
                    scale: 2,
                  )
                ],
              ),
              spacerS,
              const Text(
                  'Lorem ipsum dolor sit amet consectetur. Semper risus leo id pellentesque risus elit eu. Neque ante ut ultrices odio. Facilisi massa netus facilisi sed vitae et risus faucibus. Sit.',
                  style: AppTextStyle.defaultStyle),
              spacerS,
              Row(
                children: [
                  Image.asset(
                    'assets/icons/locate.png',
                    scale: 2,
                  ),
                  spacerS,
                  const Text(
                    'Lugar de la formacion',
                    style: AppTextStyle.defaultStyle,
                  )
                ],
              ),
              spacerS,
            ]),
          )
        ]),
      ),
    );
  }
}
