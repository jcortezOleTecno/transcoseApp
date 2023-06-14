import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_listile/my_listile.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/our_products/products_categories/our_products_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class TypeOfVehiclePage extends StatelessWidget {
  const TypeOfVehiclePage({super.key});
  static const route = '/type_of_vehicle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Nuestros productos', style: AppTextStyle.h1Style),
            spacerS,
            const Text(
                'Elige un tipo de vehículo para consultar los productos correspondientes.:'),
            spacerM,
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, OurProductsPage.route,
                    arguments: 'Turismo'),
                child: TypeVehicleCard(
                    title: 'Turismo', img: 'assets/imgs/turismo.png')),
            spacerM,
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, OurProductsPage.route,
                    arguments: 'Vehículo industrial'),
                child: TypeVehicleCard(
                    title: 'Vehículo industrial',
                    img: 'assets/imgs/industrial.png')),
            // MyListile(
            //     onTap: () => Navigator.pushNamed(context, OurProductsPage.route,
            //         arguments: 'Turismo'),
            //     padding: EdgeInsets.zero,
            //     icon: CircleAvatar(
            //       minRadius: 30,
            //       backgroundColor: AppColor.blue100,
            //       child: Image.asset('assets/icons/Carrocería.png', scale: 2),
            //     ),
            //     title: 'Turismo'),
            // MyListile(
            //     onTap: () => Navigator.pushNamed(context, OurProductsPage.route,
            //         arguments: 'Vehículo industrial'),
            //     padding: EdgeInsets.zero,
            //     icon: CircleAvatar(
            //       minRadius: 30,
            //       backgroundColor: AppColor.blue100,
            //       child: Image.asset('assets/icons/Truck.png', scale: 2),
            //     ),
            //     title: 'Vehículo industrial')
          ],
        ),
      )),
    );
  }
}

class TypeVehicleCard extends StatelessWidget {
  const TypeVehicleCard({required this.title, required this.img, Key? key})
      : super(key: key);
  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
            const MyFilterImage(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyle.h2Style
                              .copyWith(color: AppColor.white),
                        ),
                      ),
                      Image.asset(
                        'assets/icons/arrow_next.png',
                        color: AppColor.white,
                        scale: 2,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
