import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_counter_button.dart';
import 'package:vemare/app/view/_components/my_button/my_tienda_renting_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/promotions/renting_store/renting_store_page.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class DetailSaleRent extends StatefulWidget {
  const DetailSaleRent({Key? key}) : super(key: key);

  static const route = '/detail_sale_rent';

  @override
  State<DetailSaleRent> createState() => _DetailSaleRentState();
}

class _DetailSaleRentState extends State<DetailSaleRent> {
  bool isTienda = true;
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
                  MyTiendaRentingButton(
                    isTienda: (value) {
                      setState(() {
                        isTienda = value;
                      });
                    },
                  ),
                  spacerM,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      image: AssetImage('assets/imgs/promotionImg.png'),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  spacerM,
                  const Text(
                    'Lorem ipsum',
                    style: AppTextStyle.h1Style,
                  ),
                  spacerS,
                  const Text(
                    'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                    style: AppTextStyle.defaultStyle,
                  ),
                  spacerM,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyle.h1Style,
                        children: [
                          const TextSpan(
                            text: '23\$',
                          ),
                          TextSpan(
                            text: ' IVA incluido ',
                            style: AppTextStyle.defaultStyle
                                .copyWith(color: AppColor.neutral40),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spacerM,
                  MyCounterButton(
                    decrease: (units) => print(units),
                    increase: (units) => print(units),
                  ),
                  spacerL,
                  MyButton(onPressed: () {}, text: 'Añadir al carrito'),
                  spacerM,
                  MyButton(
                      onPressed: () => Navigator.pushNamed(
                            context,
                            RentingStorePage.route,
                            arguments: isTienda,
                          ),
                      text: isTienda ? 'Comprar' : 'Alquilar',
                      variant: MyButtonVariant.outlinedBold),
                  spacerXL,
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
