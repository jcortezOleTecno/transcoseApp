import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_details/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class AlbaranCard extends StatelessWidget {
  const AlbaranCard(this.albaran, {super.key});

  final Albaran albaran;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AlbaranDetailPage.route,
          arguments: albaran,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title:
                    const Text('N° ALBARÁN', style: AppTextStyle.defaultStyle),
                subtitle: Text(albaran.id ?? '',
                    style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                trailing: ExpeditionButton(albaran),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: _Item(
                                title: 'EJERCICIO',
                                content: albaran.ejercicio?.toString() ?? '')),
                        Expanded(
                            child: _Item(
                                title: 'CLIENTE',
                                content: albaran.cliente?.toString() ?? '')),
                        Expanded(
                            child: _Item(
                                title: 'CONTADOR',
                                content: albaran.contador ?? '')),
                      ],
                    ),
                    spacerS,
                    Row(
                      children: [
                        Expanded(
                            child: _Item(
                                title: 'DOCUMENTO',
                                content: albaran.documento?.toString() ?? '')),
                        Expanded(
                            child: _Item(
                                title: 'FECHA',
                                content: DateFormat.yMd('es')
                                    .format(albaran.fecha!))),
                        Expanded(
                            child: _Item(
                                title: 'ALMACEN',
                                content: albaran.almacen ?? '')),
                      ],
                    ),
                    spacerS,
                    Row(
                      children: [
                        Expanded(
                            child: _Item(
                                title: 'TIPO',
                                content: albaran.tipoAlbaran ?? '')),
                        Expanded(
                            child: _Item(
                                title: 'TOTAL IMPORTE',
                                content: fmf
                                    .copyWith(
                                        amount: albaran.totalImporte ?? 0.0)
                                    .output
                                    .symbolOnRight)),
                      ],
                    ),
                  ],
                ),
              ),
              spacerM,
              // MyLabelStatus.pending(),
              // spacerM,
              // MyDivider(),
            ],
          ),
        ),
      ),
    );
  }
}

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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Item(
                          title: 'FECHA DE ENTREGA',
                          content: value.fechaEntrega ?? ''),
                      spacerS,
                      Item(title: 'ESTADO', content: value.estadoTxt ?? ''),
                      spacerS,
                      Item(title: 'FIRMA', content: value.conFirma ?? ''),
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

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.defaultStyle),
        Text(
          content,
          style: AppTextStyle.defaultStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
