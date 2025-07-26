import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
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
  final PageController pageController = PageController(initialPage: 0);
  int page = 0;

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

    List<Widget> listW = [];
    List<Widget> listW2 = [];
    if(SharedPreferencesLocal.veraneValidatedPedidos){
      listW.add(MyOrders(scrollBottomBarController: scrollBottomBarController));
      listW2.add(Expanded(child: cardText(type: 0)));
    }
    if(SharedPreferencesLocal.veraneValidatedGarantia){
      listW.add(MyWarranty(scrollBottomBarController: scrollBottomBarController));
      listW2.add(Expanded(child: cardText(type: 1)));
    }
    if(SharedPreferencesLocal.veraneValidatedAbonos){
      listW.add(MyBills(scrollBottomBarController: scrollBottomBarController));
      listW2.add(Expanded(child: cardText(type: 2)));
    }
    if(SharedPreferencesLocal.veraneValidatedDevolucion){
      listW.add(ReturnsScreen(scrollBottomBarController: scrollBottomBarController));
      listW2.add(Expanded(child: cardText(type: 3)));
    }

    return Scaffold(
      backgroundColor: AppColor.neutral10,
      body: MyBody(
        child: Column(
          children: [
            SizedBox(
              width: sizeW,
              child: Row(
                children: listW2,
              ),
            ),
            if(listW.isNotEmpty)...[
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value){
                    page = value;
                    setState(() {});
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  children: listW,
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget cardText({required int type}){
    bool isSelected = type == page;
    String title = '';
    if(type == 0){
      title = 'Pedidos';
    }
    if(type == 1){
      title = 'Garantías';
    }
    if(type == 2){
      title = 'Abonos';
    }
    if(type == 3){
      title = 'Devoluciones';
    }

    return InkWell(
      onTap: (){
        pageController.animateToPage(type,duration: const Duration(milliseconds: 200,),curve: Curves.easeIn);
        page = type;
        setState(() {});
      },
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: isSelected ? AppColor.blue100 : Colors.transparent
                ),
                child: Center(
                  child: Text(title,style: AppTextStyle.h12Style.copyWith(color: AppColor.primaryBlue),textAlign: TextAlign.center,),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.5,
              color: AppColor.primaryBlue,
            )
          ],
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
