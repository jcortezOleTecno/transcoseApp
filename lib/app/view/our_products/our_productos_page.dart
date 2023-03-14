import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_products_card.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class OurProductsPage extends StatefulWidget {
  const OurProductsPage(this.typeVehicle, {super.key});
  final String? typeVehicle;

  static const route = '/our_products';

  @override
  State<OurProductsPage> createState() => _OurProductsPageState();
}

class _OurProductsPageState extends State<OurProductsPage> {
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
                    Text(widget.typeVehicle ?? ''),
                    const Text(
                      'Nuestros productos',
                      style: AppTextStyle.h1Style,
                    ),
                    spacerM,
                    MyCustomDropdownButton(
                      hint: 'Todos los productos',
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
                      icon: Image.asset('assets/icons/Chevron.png', scale: 2),
                      dropdownWidth: width * .93,
                    ),
                    spacerM,
                    SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Buscar por proveedor',
                          isDense: true,
                          // isCollapsed: true,
                          contentPadding: const EdgeInsets.all(10),
                          suffixIcon: Image.asset(
                            'assets/icons/searchIcon.png',
                            scale: 2,
                          ),
                        ),
                      ),
                    ),
                    spacerM,
                    CardProducts(
                      onTap: () {
                        Navigator.pushNamed(context, ProductPage.route);
                      },
                      icon:
                          Image.asset('assets/icons/Carrocería.png', scale: 2),
                      title: 'Carroceria',
                      content:
                          'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    CardProducts(
                      icon:
                          Image.asset('assets/icons/Carrocería.png', scale: 2),
                      title: 'Carroceria',
                      content:
                          'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    CardProducts(
                      icon:
                          Image.asset('assets/icons/Carrocería.png', scale: 2),
                      title: 'Carroceria',
                      content:
                          'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    CardProducts(
                      icon:
                          Image.asset('assets/icons/Carrocería.png', scale: 2),
                      title: 'Carroceria',
                      content:
                          'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    CardProducts(
                      icon:
                          Image.asset('assets/icons/Carrocería.png', scale: 2),
                      title: 'Carroceria',
                      content:
                          'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    CardProducts(
                      icon:
                          Image.asset('assets/icons/Carrocería.png', scale: 2),
                      title: 'Carroceria',
                      content:
                          'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                      margin: const EdgeInsets.only(top: 10),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
