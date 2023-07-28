import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dialogs/my_dialogs.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/promotions/renting_store/payment_form.dart';
import 'package:vemare/app/view/promotions/renting_store/widgets/promotion_description.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../detail_sale_rent/detail_sale_rent.dart';

class RentingStorePage extends StatefulWidget {
  const RentingStorePage(this.args, {super.key});
  static const route = '/renting_store';

  final StoreArgs args;

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
                      title: widget.args.isTienda ? 'Tienda' : 'Renting',
                      promotion: widget.args.promotion,
                      quantity: widget.args.quantity,
                    ),
                    spacerL,
                    Visibility(
                      visible: widget.args.isTienda,
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
                              items: (LocalDataRepository()
                                          .user
                                          ?.webservice
                                          ?.permiteComprasCredito ??
                                      false)
                                  ? ['Crédito', 'Tarjeta']
                                  : ['Tarjeta'],
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
            _Button(
              widget.args.copyWith(isCredit: type == 'Crédito'),
              selecType: type != null,
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
    this.args, {
    required this.selecType,
    Key? key,
  }) : super(key: key);

  final StoreArgs args;
  final bool selecType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MyButton(
        onPressed: () {
          if (LocalDataRepository().isLogged) {
            if (!args.isTienda) {
              // promotionDialog(context,
              //         title: 'Felicidades',
              //         content:
              //             'Tu comercial se pondrá en contacto contigo lo antes posible para ver los detalles de tu solicitud.')
              //     .then((_) {
              //   Navigator.popUntil(
              //       context, ModalRoute.withName(HomePage.route));
              // });
            } else {
              //TODO: Implementar endpoint de pago
              print("PAGAR");
              // Navigator.pushNamed(
              //   context,
              //   PaymentPage.route,
              //   arguments: args,
              // );
            }
          } else {
            Navigator.pushNamed(
              context,
              LoginPage.route,
              arguments: '',
            ).then((_) {
              if (LocalDataRepository().isLogged) {
                if (!args.isTienda) {
                  // promotionDialog(context,
                  //         title: 'Felicidades',
                  //         content:
                  //             'Tu comercial se pondrá en contacto contigo lo antes posible para ver los detalles de tu solicitud.')
                  //     .then((_) {
                  //   Navigator.popUntil(
                  //       context, ModalRoute.withName(HomePage.route));
                  // });
                } else {
                  //TODO: Implementar endpoint de pago
                  print("PAGAR");

                  // Navigator.pushNamed(
                  //   context,
                  //   PaymentPage.route,
                  //   arguments: args.isCredit,
                  // );
                }
              }
            });
          }
        },
        text: 'Continuar',
        width: double.infinity,
        disabled: args.isTienda && !selecType,
      ),
    );
  }
}
