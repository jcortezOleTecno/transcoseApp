import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';

class OurProductsPage extends StatelessWidget {
  const OurProductsPage({super.key});

  static const route = '/our_products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Center(
          child: Text('NUESTROS PRODUCTOS'),
        ),
      ),
    );
  }
}
