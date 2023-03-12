import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  static const route = '/about_us';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyBody(
        child: Center(
          child: Text('Sobre nosotros'),
        ),
      ),
    );
  }
}
