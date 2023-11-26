import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class MyOrdersPage extends StatefulWidget {
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
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {

  bool _showAppbar = true; //this is to show app bar
  final ScrollController scrollBottomBarController = ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  void myScroll() async {
    try{
      scrollBottomBarController.addListener(() {
        if (scrollBottomBarController.position.userScrollDirection == ScrollDirection.reverse) {
          if (!isScrollingDown) {
            isScrollingDown = true;
            _showAppbar = false;
            setState(() {});
          }
        }
        if (scrollBottomBarController.position.userScrollDirection == ScrollDirection.forward) {
          if (isScrollingDown) {
            isScrollingDown = false;
            _showAppbar = true;
            setState(() {});
          }
        }
      });
    }catch(_){}

  }

  @override
  Widget build(BuildContext context) {

    double sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: MyBody(
        child: DefaultTabController(
          length: isReturns ? 4 : 3,
          child: Column(
            children: [
              if(_showAppbar)...[
                spacerS,
                Visibility(
                  visible: _showAppbar,
                  child: TabBar(
                    isScrollable: true,
                    indicator: const BoxDecoration(
                      color: AppColor.blue100,
                      border: Border(bottom: BorderSide(color: AppColor.primaryBlue, width: 2.5),),
                    ),
                    labelColor: AppColor.primaryBlue,
                    indicatorColor: AppColor.primaryBlue,
                    indicatorWeight: 2.5,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold,),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                    unselectedLabelColor: AppColor.primaryBlue,
                    tabs: [
                      SizedBox(
                        width: isReturns ? sizeW * 0.14 : sizeW * 0.24,
                        child: const Tab(text: 'Pedidos'),
                      ),
                      SizedBox(
                        width: isReturns ? sizeW * 0.14 : sizeW * 0.24,
                        child: const Tab(text: 'Garantías'),
                      ),
                      SizedBox(
                        width: isReturns ? sizeW * 0.14 : sizeW * 0.24,
                        child: const Tab(text: 'Abonos'),
                      ),
                      if(isReturns)...[
                        SizedBox(
                          width: sizeW * 0.24,
                          child: const Tab(text: 'Devoluciones'),
                        ),
                      ],
                    ],
                  ),
                ),
                const Divider(height: 0,thickness: 2,indent: 15,endIndent: 15,),
              ],
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MyOrders(scrollBottomBarController: scrollBottomBarController),
                    MyWarranty(scrollBottomBarController: scrollBottomBarController),
                    MyBills(scrollBottomBarController: scrollBottomBarController),
                    if(isReturns)...[
                      ReturnsScreen(scrollBottomBarController: scrollBottomBarController),
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
