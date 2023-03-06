import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dialogs/my_dialogs.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/promotions/renting_store/widgets/promotion_description.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class CardPaymentPage extends StatelessWidget {
  const CardPaymentPage({super.key});
  static const route = '/card_form';

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
                const PromotionDescription(
                  title: 'Tienda',
                ),
                spacerL,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Datos de pago',
                        style: AppTextStyle.h3Style,
                      ),
                      spacerM,
                      MyInput(
                        label: 'Nombre de la tarjeta',
                        hintText: 'Escribe el nombre de la tarjeta',
                      ),
                      MyInput(
                        label: 'Número de la tarjeta',
                        hintText: 'Introduce el número de la tarjeta',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyInput(
                              label: 'Fecha de caducidad',
                              hintText: '00/00',
                            ),
                          ),
                          spacerM,
                          Expanded(
                            child: MyInput(
                              label: 'CVV',
                              hintText: '000',
                            ),
                          ),
                        ],
                      ),
                      _Button()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MyButton(
        onPressed: () {
          promotionDialog(context,
                  title: 'Felicidades',
                  content: 'La operación se ha realizado con éxito.')
              .then((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomePage.route,
              (route) => false,
              arguments: true,
            );
          });
        },
        text: 'Continuar',
        width: double.infinity,
      ),
    );
  }
}
