import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/bill_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/order_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/bill.dart';
import 'package:vemare/app/view/personal_area/widgets/warranty.dart';
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
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
                indent: 15,
                endIndent: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _MyOrders(),
                    _MyWarranty(),
                    _MyBills(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          LocalDataRepository().user?.name ?? '',
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
        spacerL,
        ...List.generate(3, (i) {
          return Bill(
            onTapBill: () =>
                Navigator.pushNamed(context, OrderDetailPage.route),
            onTapAlbaran: () =>
                Navigator.pushNamed(context, AlbaranDetailPage.route),
          );
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

class _MyWarranty extends StatelessWidget {
  const _MyWarranty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      children: [
        spacerS,
        const Text('Mis garantías', style: AppTextStyle.h2Style),
        Text(
          LocalDataRepository().user?.name ?? '',
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
        spacerL,
        ...List.generate(3, (i) {
          return Warranty(
            onTap: () {
              Navigator.pushNamed(context, WarrantyDetailPage.route);
            },
          );
        }),
      ],
    );
  }
}

class _MyBills extends StatelessWidget {
  const _MyBills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      children: [
        spacerS,
        const Text('Mis facturas', style: AppTextStyle.h2Style),
        Text(
          LocalDataRepository().user?.name ?? '',
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
        spacerL,
        ...List.generate(3, (i) {
          return BillCard(
            onTap: () {
              Navigator.pushNamed(context, BillDetailPage.route);
            },
          );
        }),
      ],
    );
  }
}
