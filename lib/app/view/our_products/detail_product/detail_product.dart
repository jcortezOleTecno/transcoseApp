import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  static const route = '/details_products';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyTapToHideKeyboard(
      child: Scaffold(
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
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blue100,
                            ),
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/icons/Lubricantes.png',
                                scale: 2),
                          ),
                          spacerS,
                          const Text(
                            'Aceite latas',
                            style: AppTextStyle.h1Style,
                          ),
                        ],
                      ),
                      spacerM,
                      const Text(
                        'Podrás encontrar la tecnología más avanzada en lubricantes sintéticos para todos los motores.',
                        style: AppTextStyle.defaultStyle,
                      ),
                      spacerM,
                      spacerM,
                      const MySearchInput(),
                    ],
                  ),
                ),
                spacerS,
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: List.generate(8, (i) {
                      return ClipRRect(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Container(
                            height: width * .40,
                            width: width * .40,
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/imgs/Continental.png',
                              scale: 2,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
