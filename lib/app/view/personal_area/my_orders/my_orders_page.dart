import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});
  static const route = '/my_orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
          child: DefaultTabController(
        length: 3,
        child: Column(
          children: const [
            spacerS,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                  labelColor: AppColor.primaryBlue,
                  indicatorColor: AppColor.primaryBlue,
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: AppColor.neutral20,
                  tabs: [
                    Tab(text: 'Mis pedidos'),
                    Tab(text: 'Mis garantías'),
                    Tab(text: 'Mis facturas'),
                  ]),
            ),
            Divider(
              height: 0,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            Expanded(
                child: TabBarView(children: [
              _MyOrders(),
              Placeholder(),
              Placeholder(),
            ]))
          ],
        ),
      )),
    );
  }
}

class _MyOrders extends StatelessWidget {
  const _MyOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      children: [
        spacerS,
        const Text('Mis pedidos', style: AppTextStyle.h2Style),
        Text(
          getIt.get<LocalDataRepository>().user?.name ?? '',
          style: AppTextStyle.h3Style.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        spacerM,
        MyIconButton(
          onPressed: () {},
          text: 'Aplicar filtros',
          icon: Image.asset(
            'assets/icons/Filtro.png',
            scale: 2,
          ),
          variant: MyButtonVariant.outlinedBold,
        ),
        spacerM,
        ...List.generate(3, (i) {
          return _Bill();
        }),
        MyIconButton(
          onPressed: () {},
          text: 'Firmar',
          icon: Image.asset(
            'assets/icons/firma.png',
            scale: 2,
          ),
        ),
        spacerL,
      ],
    );
  }
}

class _Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
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
                      Text(
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
                MyLabelStatus.subscribe(),
                spacerM,
                Image.asset('assets/icons/arrow_next.png', scale: 2),
              ],
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
                    text: TextSpan(
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
                ...List.generate(5, (i) {
                  return _Albaran();
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Albaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.check_box_outline_blank, color: Colors.black),
          title: Text('N° ALBARÁN', style: AppTextStyle.defaultStyle),
          subtitle: Text('0000000000000000',
              style: AppTextStyle.defaultStyle
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
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
                    Text('UDS', style: AppTextStyle.defaultStyle),
                    Text('40',
                        style: AppTextStyle.defaultStyle
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PRECIO', style: AppTextStyle.defaultStyle),
                    Text(
                      '400 €',
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
        MyLabelStatus.pending(),
        spacerM,
        Divider(
          thickness: 1.5,
          color: AppColor.blue100,
        ),
      ]),
    );
  }
}
