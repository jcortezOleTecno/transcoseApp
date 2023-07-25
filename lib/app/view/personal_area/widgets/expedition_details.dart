import 'package:flutter/material.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ExpeditionButton extends StatefulWidget {
  const ExpeditionButton(this.albaran, {Key? key}) : super(key: key);
  final Albaran albaran;

  @override
  State<ExpeditionButton> createState() => _ExpeditionButtonState();
}

class _ExpeditionButtonState extends State<ExpeditionButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          loading = true;
        });
        getIt
            .get<MyAccountRepository>()
            .getExpeditionPedidos(
                contador: widget.albaran.contador!,
                documento: widget.albaran.documento!.toString(),
                ejercicio: widget.albaran.ejercicio.toString())
            .then((value) {
          setState(() {
            loading = false;
          });
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.white,
                insetPadding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // spacerM,
                      const Text(
                        'Detalles de la expadición',
                        style: AppTextStyle.h2Style,
                      ),
                      spacerM,
                      MyInput(
                          label: 'Fecha de entrega',
                          initialValue: value.fechaEntrega ?? '',
                          readOnly: true),
                      MyInput(
                          label: 'Estado',
                          initialValue: value.estadoTxt ?? '',
                          readOnly: true),
                      MyInput(
                          label: 'Código de Estado',
                          initialValue: value.estadoCod.toString(),
                          readOnly: true),
                      MyInput(
                          label: 'Firma',
                          initialValue: value.conFirma ?? '',
                          readOnly: true),
                      MyButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Aceptar',
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
      },
      child: loading
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: AppColor.primary,
                strokeWidth: 3,
              ),
            )
          : Image.asset(
              'assets/icons/Truck.png',
              scale: 3.5,
              color: AppColor.primaryBlue,
            ),
    );
  }
}
