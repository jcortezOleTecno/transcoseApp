import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import 'promotion/promotion_page.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({super.key});

  static const route = '/promotions';

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const MyBackButton(),
                const Image(
                  image: AssetImage('assets/imgs/promotions_img.png'),
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      spacerM,
                      const Text(
                        'Promociones',
                        style: AppTextStyle.h1Style,
                      ),
                      spacerM,
                      const Text(
                        'Accede a nuestras campañas mensuales y obtén precios y ofertas especiales para tu negocio.',
                        style: AppTextStyle.defaultStyle,
                      ),
                      spacerM,
                      MyCustomDropdownButton(
                        hint: 'Todas las promociones',
                        dropdownItems: items
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      spacerM,
                      const MySearchInput(),
                    ],
                  ),
                ),
                spacerXL,
                ...List.generate(5, (i) {
                  return MySingleCard(
                    onTap: () {
                      Navigator.pushNamed(context, PromotionPage.route);
                    },
                    title: 'Máquinas Bosh',
                    content:
                        'Sólo durante este mes consigue una botella de vino Rioja Reserva por cada motor de arranque o alternador de la marca.',
                    icon: Image.asset(
                      'assets/icons/star.png',
                      scale: 2,
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
