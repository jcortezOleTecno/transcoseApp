import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  static const route = '/promotion';

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
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
                const MyBackButton(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Recambios',
                        style: AppTextStyle.h1Style,
                      ),
                      spacerL,
                      MyCustomDropdownButton(
                        hint: 'Todos los recambios',
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
                spacerL,
                ...List.generate(5, (i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailSaleRent.route);
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 7.5, horizontal: 15),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/imgs/promotionImg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Visibility(
                              visible: i == 0 || i == 2,
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColor.red500),
                                child: Text(
                                  'Renting',
                                  style: AppTextStyle.linkStyle.copyWith(
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: const [
                                Expanded(
                                    child: Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: AppTextStyle.defaultStyle,
                                )),
                                Text(
                                  '23\$',
                                  style: AppTextStyle.h3Style,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
