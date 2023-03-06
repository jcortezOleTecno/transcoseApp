import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dialogs/my_dialogs.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/promotions/renting_store/card_payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/widgets/promotion_description.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class RentingStorePage extends StatefulWidget {
  const RentingStorePage(this.isStore, {super.key});
  static const route = '/renting_store';

  final bool isStore;

  @override
  State<RentingStorePage> createState() => _RentingStorePageState();
}

class _RentingStorePageState extends State<RentingStorePage> {
  String? type;
  bool tarjeta = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyBackButton(),
                    PromotionDescription(
                      title: widget.isStore ? 'Tienda' : 'Renting',
                    ),
                    spacerL,
                    Visibility(
                      visible: widget.isStore,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              '¿Como deseas realizar tu pago?',
                              style: AppTextStyle.h3Style,
                            ),
                            RadioGroup<String?>.builder(
                              groupValue: type,
                              activeColor: AppColor.blue,
                              direction: Axis.vertical,
                              horizontalAlignment: MainAxisAlignment.center,
                              textStyle: AppTextStyle.inputLabelStyle,
                              onChanged: (value) {
                                setState(() {
                                  tarjeta = !tarjeta;
                                  type = value!;
                                });
                              },
                              items: const ['Crédito', 'Tarjeta'],
                              itemBuilder: (value) => RadioButtonBuilder(
                                value!,
                                textPosition: RadioButtonTextPosition.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _Button(widget, type)
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
    this.widget,
    this.type, {
    Key? key,
  }) : super(key: key);

  final RentingStorePage widget;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MyButton(
        onPressed: () {
          if (!widget.isStore) {
            promotionDialog(context,
                    title: 'Felicidades',
                    content:
                        'Tu comercial se pondrá en contacto contigo lo antes posible para ver los detalles de tu solicitud.')
                .then((_) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.route,
                (route) => false,
                arguments: true,
              );
            });
          } else {
            Navigator.pushNamed(
              context,
              PaymentPage.route,
              arguments: type == 'Crédito',
            );
          }
        },
        text: 'Continuar',
        width: double.infinity,
        disabled: widget.isStore && (type == null),
      ),
    );
  }
}
