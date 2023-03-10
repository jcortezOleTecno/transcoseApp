import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dialogs/my_dialogs.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/promotions/renting_store/card_payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/widgets/promotion_description.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({this.isCredit = false, super.key});
  static const route = '/payment_page';
  final bool isCredit;

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
                      Text(
                        !isCredit
                            ? 'Datos de envío'
                            : 'Comprueba que los datos son correctos',
                        style: AppTextStyle.h3Style,
                      ),
                      spacerM,
                      MyInput(
                        label: 'Nombre',
                        initialValue: 'jorge',
                      ),
                      MyInput(
                        label: 'E-mail',
                        initialValue: 'jorgegarciafrndz@gmail.com',
                      ),
                      MyInput(
                        label: 'Dirección',
                        initialValue: 'Calle de cádiz 12, Portal 1 4º B',
                      ),
                      MyInput(
                        label: 'Provincia',
                        initialValue: 'Madrid',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyInput(
                              label: 'Ciudad',
                              initialValue: 'Madrid',
                            ),
                          ),
                          spacerM,
                          Expanded(
                            child: MyInput(
                              label: 'CP',
                              initialValue: '18526',
                            ),
                          ),
                        ],
                      ),
                      _Button(isCredit: isCredit)
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
    required this.isCredit,
    Key? key,
  }) : super(key: key);

  final bool isCredit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MyButton(
        onPressed: () {
          if (!isCredit) {
            Navigator.pushNamed(context, CardPaymentPage.route);
          } else {
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
          }
        },
        text: 'Continuar',
        width: double.infinity,
      ),
    );
  }
}
