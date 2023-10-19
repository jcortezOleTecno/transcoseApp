import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class SearchMyProductPage extends StatelessWidget {
  const SearchMyProductPage(this.cat, {super.key});

  static const route = '/search_my_products';

  final Category cat;

  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyBackButton(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Buscar mi ${cat.name ?? ''}',
                            style: AppTextStyle.h1Style,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.blue100,
                        ),
                        height: 90,
                        width: 90,
                        child: Image.network(
                          cat.image!,
                        ),
                      ),
                      spacerL,
                      const Text(
                        'Esta sección se encuentra en construcción...',
                        style: AppTextStyle.h3Style,
                      ),
                      spacerS,
                      const Text(
                        'Sentimos las molestias.',
                        style: AppTextStyle.defaultStyle,
                      ),
                      spacerXL,
                      MyButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Volver a ${cat.name ?? ''}',
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
