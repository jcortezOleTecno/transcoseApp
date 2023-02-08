import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_listile/my_listile.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/our_products/our_productos_page.dart';
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
            MyListile(
                onTap: () =>
                    Navigator.pushNamed(context, OurProductsPage.route),
                padding: EdgeInsets.zero,
                icon: CircleAvatar(
                  minRadius: 30,
                  backgroundColor: AppColor.blue100,
                  child: Image.asset('assets/icons/Carrocería.png', scale: 2),
                ),
                title: 'Turismo'),
            spacerM,
            MyListile(
                onTap: () =>
                    Navigator.pushNamed(context, OurProductsPage.route),
                padding: EdgeInsets.zero,
                icon: CircleAvatar(
                  minRadius: 30,
                  backgroundColor: AppColor.blue100,
                  child: Image.asset('assets/icons/Truck.png', scale: 2),
                ),
                title: 'Vehiculo industrial')
          ],
        ),
      )),
    );
  }
}
