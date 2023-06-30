import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class WarrantyCard extends StatelessWidget {
  const WarrantyCard(this.warranty, {super.key, this.onTap});

  final void Function()? onTap;
  final Warranty warranty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                title: const Text('N° de GARANTÍA',
                    style: AppTextStyle.defaultStyle),
                subtitle: Text(warranty.numero?.toString() ?? '0000000000',
                    style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                trailing: Image.asset(
                  'assets/icons/arrow_next.png',
                  scale: 2,
                  color: AppColor.primaryBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('FECHA', style: AppTextStyle.defaultStyle),
                          Text(
                              DateFormat.yMd('es')
                                  .format(warranty.fechaAlta!)
                                  .toUpperCase(),
                              style: AppTextStyle.defaultStyle
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('IMPORTE',
                              style: AppTextStyle.defaultStyle),
                          Text(
                            fmf
                                .copyWith(
                                    amount: double.tryParse(
                                        warranty.importe ?? '0'))
                                .output
                                .symbolOnRight,
                            style: AppTextStyle.defaultStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              spacerM,
              // MyLabelStatus.pending(),
              // spacerS,
            ],
          ),
        ),
      ),
    );
  }
}

class WarrantyDetail extends StatelessWidget {
  const WarrantyDetail(
    this.warranty,
    this.detail, {
    Key? key,
  }) : super(key: key);

  final WarrantyDetailModel? detail;
  final Warranty warranty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Detalle de la garantía',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                child: Item(
                    title: "FECHA",
                    content: DateFormat.yMd().format(warranty.fechaAlta!)),
              ),
              Expanded(
                child: Item(
                    title: "IMPORTE",
                    content: fmf
                        .copyWith(
                            amount: double.parse(warranty.importe ?? '0.0'))
                        .output
                        .symbolOnRight),
              ),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                child: Item(
                    title: "CENTRO REPARTO",
                    content: warranty.centroReparto ?? ''),
              ),
              Expanded(
                child: Item(
                    title: "ESTADO SUSTITUCIÓN",
                    content: warranty.estadoSu ?? ''),
              ),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                child: Item(
                    title: "IMPORTE VEMARE",
                    content: fmf
                        .copyWith(
                            amount:
                                double.parse(detail?.importeVemare ?? '0.0'))
                        .output
                        .symbolOnRight),
              ),
              Expanded(
                child: Item(
                    title: "IMPORTE CLIENTE",
                    content: fmf
                        .copyWith(
                            amount:
                                double.parse(detail?.importeCliente ?? '0.0'))
                        .output
                        .symbolOnRight),
              ),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                child: Item(title: "FIRMADO", content: detail?.firmado ?? 'No'),
              ),
              Expanded(
                child: Item(
                    title: "PERMITE FIRMA", content: warranty.visar ?? 'No'),
              ),
            ],
          ),
          if (warranty.firmado == 'Si') ...[
            spacerS,
            Row(
              children: [
                Expanded(
                  child: Item(
                      title: "QUIEN FIRMA", content: warranty.quienFirma ?? ''),
                ),
                Expanded(
                  child:
                      Item(title: "NIF", content: warranty.nifQuienFirma ?? ''),
                ),
              ],
            ),
            Text(warranty.fechaFirma ?? '',
                style: AppTextStyle.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ))
          ]

          // spacerM,
          // MyLabelStatus.pending()
        ],
      ),
    );
  }
}
