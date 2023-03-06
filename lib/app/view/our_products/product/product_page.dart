import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/search_my_product/search_my_product_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static const route = '/products';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
                            'Lubricantes',
                            style: AppTextStyle.h1Style,
                          ),
                        ],
                      ),
                      spacerM,
                      const Text(
                        'Encuentra una completa gama de aceites de motor además de la máxima calidad bajo nuestra marca exclusiva AD. ',
                        style: AppTextStyle.defaultStyle,
                      ),
                      spacerM,
                      Center(
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SearchMyProductPage.route);
                          },
                          label: Image.asset(
                            'assets/icons/arrow_next.png',
                            scale: 2,
                          ),
                          icon: const Text(
                            'Buscar mi lubricante',
                            style: AppTextStyle.linkStyle,
                          ),
                        ),
                      ),
                      spacerM,
                      CustomDropdownButton2(
                        hint: 'Todos los productos',
                        dropdownItems: items,
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
                spacerS,
                SizedBox(
                  height: MediaQuery.of(context).size.width * .5,
                  child: PageView.builder(
                    itemCount: 3,
                    controller:
                        PageController(initialPage: 1, viewportFraction: 0.5),
                    itemBuilder: (context, index) => ClipRRect(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/imgs/Continental.png',
                            scale: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ...List.generate(5, (i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailProductPage.route);
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/imgs/aceite-lata.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            const MyFilterImage(),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const MySpacer(height: 60),
                                  Row(
                                    children: [
                                      Text(
                                        'Aceite latas',
                                        style: AppTextStyle.h3Style.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.white),
                                      ),
                                      spacerExpanded,
                                      Image.asset(
                                        'assets/icons/arrow_next.png',
                                        scale: 2,
                                        color: AppColor.white,
                                      ),
                                    ],
                                  ),
                                  spacerS,
                                  Text(
                                    'Con inmensas ganas de volver junto a nuestros clientes nos citamos en Toledo para celebrar nuestra Convención.',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.contentCard
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
