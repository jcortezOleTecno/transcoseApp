import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_contracts/contract_detail.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class MyContractsPage extends StatelessWidget {
  const MyContractsPage({super.key});
  static const route = '/my_contracts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Mis contratos', style: AppTextStyle.h1Style),
              Text(
                getIt.get<LocalDataRepository>().user?.name ?? '',
                style: AppTextStyle.h3Style.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              spacerM,
              ...List.generate(5, (i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ContractDetailPage.route);
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Nombre del contrato',
                              style: AppTextStyle.linkStyle
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              '09/08/2020 - 19/02/2022',
                              style: AppTextStyle.defaultStyle,
                            ),
                            spacerS,
                            Row(
                              children: [
                                Text(
                                  '50%',
                                  style: AppTextStyle.defaultStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                spacerS,
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColor.blue100,
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Image.asset(
                            'assets/icons/arrow_next.png',
                            scale: 2,
                            color: AppColor.primaryBlue,
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
