import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';
import 'package:vemare/main.dart';

import 'bloc/my_orders_cubit.dart';
import 'orders_and_bills/bills_widget.dart';
import 'orders_and_bills/orders_widget.dart';
import 'warranty/warranty_widget.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage._();

  static const route = '/my_orders';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyOrdersCubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const MyOrdersPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: DefaultTabController(
          length: isReturns ? 4 : 3,
          child: Column(
            children: const [
              spacerS,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: TabBar(
                  isScrollable: false,
                  indicator: BoxDecoration(
                      color: AppColor.blue100,
                      border: Border(
                        bottom:
                            BorderSide(color: AppColor.primaryBlue, width: 2.5),
                      )),
                  labelColor: AppColor.primaryBlue,
                  indicatorColor: AppColor.primaryBlue,
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: AppColor.primaryBlue,
                  // physics: NeverScrollableScrollPhysics(),
                  tabs: [
                    Tab(text: 'Pedidos'),
                    Tab(text: 'Garantías'),
                    Tab(text: 'Abonos'),
                    if(isReturns)...[
                      Tab(text: 'Devoluciones'),
                    ]
                    // Tab(text: 'Devoluciones'),
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
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MyOrders(),
                    MyWarranty(),
                    MyBills(),
                    if(isReturns)...[
                      ReturnsScreen(),
                    ],
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

class StatusLabelWidget extends StatelessWidget {
  const StatusLabelWidget(this.facturado, {super.key});

  final bool facturado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: facturado ? AppColor.success200 : AppColor.error200,
      ),
      child: Text(
        facturado ? '• Facturado' : '• No Facturado',
        style: AppTextStyle.inputLabelStyle.copyWith(
            color: facturado ? AppColor.success500 : AppColor.error500),
      ),
    );
  }
}
