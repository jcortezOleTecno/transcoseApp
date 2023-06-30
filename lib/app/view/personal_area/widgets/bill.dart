import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';

import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class Bill extends StatelessWidget {
  const Bill(
      {this.billHeader = true, super.key, this.onTapBill, this.onTapAlbaran});

  final bool billHeader;
  final void Function()? onTapBill;
  final void Function()? onTapAlbaran;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapBill,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.blue100),
        ),
        child: Column(
          children: [
            Visibility(
              visible: billHeader,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: AppColor.blue50,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'N° DE FACTURA',
                            style: AppTextStyle.defaultStyle,
                          ),
                          Text(
                            '0000000000000',
                            style: AppTextStyle.defaultStyle
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const MyLabelStatus.subscribe(),
                    spacerM,
                    Image.asset('assets/icons/arrow_next.png', scale: 2),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  spacerS,
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColor.blue50,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'FECHA',
                          ),
                          TextSpan(
                            text: '  00/00/00',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  spacerM,
                  // ...List.generate(5, (i) {
                  //   return AlbaranCard(onTapAlbaran: onTapAlbaran);
                  // })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BillCard extends StatelessWidget {
  const BillCard({super.key, this.onTap});

  final void Function()? onTap;

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
                title: const Text('N° de FACTURA',
                    style: AppTextStyle.defaultStyle),
                subtitle: Text('0000000000000000',
                    style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                trailing: Image.asset(
                  'assets/icons/arrow_next.png',
                  scale: 2,
                  color: AppColor.primaryBlue,
                ),
              ),
              spacerS,
              const MyLabelStatus.subscribe(),
              spacerS,
            ],
          ),
        ),
      ),
    );
  }
}
