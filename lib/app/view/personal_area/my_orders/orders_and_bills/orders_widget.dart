import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/qr/qr_lector/qr_lector.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_details/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_returns/AlbaranReturns.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/main.dart';

import '../bloc/my_orders_cubit.dart';
import '../bloc/my_orders_state.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
    Key? key,
    required this.scrollBottomBarController
  }) : super(key: key);

  final ScrollController scrollBottomBarController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyOrdersCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return permissions!.where((e) => e.id == 7).isEmpty && isEmpleado
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: AccessDeniedWidget(),
          )
        : BlocBuilder<MyOrdersCubit, MyOrdersState>(
            builder: (context, state) {
              return SingleChildScrollView(
                controller: scrollBottomBarController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expanded(
                    //   child: MobileScanner(
                    //     controller: cameraController,
                    //     onDetect: (capture) {
                    //       final List<Barcode> barcodes = capture.barcodes;
                    //       if (barcodes.isNotEmpty) {
                    //         barcode = barcodes.first.rawValue;
                    //       }
                    //     },
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacerS,
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                const Text('Mis pedidos ', style: AppTextStyle.h2Style),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: const Text('|', style: AppTextStyle.nunito18),
                                ),
                                Text('${state.orders.length} total', style: AppTextStyle.nunito18),
                              ],
                            ),
                          ),
                          //const UserName(),
                          spacerM,
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                    child: MySearchInput(
                                      controller: state.controllerText,
                                      initialValue: null,
                                      hintText: 'Buscar por palabras claves...',
                                      onChanged: cubit.filtroPedidos,
                                      borderSideColor: AppColor.blue100,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    height: 50, width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle, // Forma circular
                                      color: AppColor.whiteF,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/qr_icon.png',
                                      scale: 1,color: AppColor.primary,
                                    ),
                                  ),
                                  onTap: () async {
                                    await Navigator.of(context).pushNamed(QrLector.route,arguments: cubit);
                                    log('message');
                                  },
                                ),
                                // MobileScanner(
                                //   controller: cameraController,
                                //   onDetect: (capture) {
                                //     final List<Barcode> barcodes = capture.barcodes;
                                //     if (barcodes.isNotEmpty) {
                                //       barcode = barcodes.first.rawValue;
                                //     }
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          filterDateOrders(context: context,state: state),
                          // spacerS,
                          // if (state.filterPedidos != null)
                          //   FiltersAppliedWidget(state.filterPedidos!,
                          //       onTap: () => cubit.getMyOrders(reset: true)),
                          spacerS,
                          // filterDate(context: context, state: state),
                          // spacerS,
                          if(state.loading)...[
                            const SizedBox(
                                height: 400,
                                child: MyShimmer.full(
                                  borderRadius: 10,
                                  margin: EdgeInsets.only(bottom: 20),
                                )),
                            spacerM,
                          ]else...[
                            if(state.orders.isEmpty || (state.ordersFilter.isEmpty && state.filterPedidos != null))...[
                              const NoExistWidget('pedidos',paddingTop: 40),
                              spacerM,spacerM,
                            ]else...[
                              SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      sectionTablaPedidos(context: context,state: state),
                                      MyButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            AlbaranReturns.route,
                                            arguments: {
                                              'orders' : state.orders,
                                              'albaranMotivos' : state.albaranMotivos,
                                              'statePedidosSelected' : state.statePedidosSelected,
                                              'cubit' : cubit,
                                            },
                                          );
                                        },
                                        text: state.cantSelectedAlbaran == 0 ? ' Devolver artículos  ' : ' Devolver artículos (${state.cantSelectedAlbaran}) ',
                                        width: double.infinity,
                                        isLoading: false,
                                        disabled: state.cantSelectedAlbaran <= 0,
                                        childCenter: Image.asset(
                                          'assets/icons/arrow_next.png',
                                          scale: 2,color: Colors.white,
                                        ),
                                      ),
                                      spacerM,
                                    ],
                                  ),
                                ),
                              ),
                              // tablaPedidosOld(context: context, state: state),
                            ],
                          ],
                        ],
                      ),
                    ),
                    const Footer(),
                  ],
                ),
              );
            },
          );
  }

  Widget sectionTablaPedidos({required BuildContext context, required MyOrdersState state}){

    Size size = MediaQuery.of(context).size;
    final cubit = context.read<MyOrdersCubit>();
    int itemsForPage = 6;
    int totalPAge = ((state.ordersFilter.isNotEmpty || state.filterPedidos != null) ? (state.ordersFilter.length / itemsForPage).ceil() : state.orders.length / itemsForPage).ceil();

    List<Widget> listW = [];
    List<AlbaranISI> pageItems = [];

    final startIndex = state.currentPage * itemsForPage;
    int endIndex = 0;
    pageItems = [];
    List<Widget> items = [];

    if(state.ordersFilter.isNotEmpty || state.filterPedidos != null){
      endIndex = (startIndex + itemsForPage).clamp(0, state.ordersFilter.length);
      pageItems = state.ordersFilter.sublist(startIndex, endIndex);
    }else{
      endIndex = (startIndex + itemsForPage).clamp(0, state.orders.length);
      pageItems = state.orders.sublist(startIndex, endIndex);
    }
    for(int x = 0; x < totalPAge; x++){ items.add(
        Container(
          width: 30, height: 30,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ((state.currentPage + 1) == (x + 1)) ? AppColor.primary : AppColor.white,
              border: Border.all(color: ((state.currentPage + 1) == (x + 1)) ? AppColor.primary : AppColor.blue300)
          ),
          child: Center(
            child: Text('${x + 1}',
                style: AppTextStyle.h1Style.copyWith(
                    fontSize: 16,color: ((state.currentPage + 1) == (x + 1)) ? AppColor.white : AppColor.blue300
                )),
          ),
        )
    ); }

    for (var albaranElemt in pageItems) {
      listW.add(
          tablaPedidos(
            albaran: albaranElemt,
            context: context,
            state: state,
          )
      );
    }
    listW.add(const SizedBox(height: 10,));

    double wiMin = 24 * (double.parse ((((state.ordersFilter.isNotEmpty || state.filterPedidos != null) ? (state.ordersFilter.length / itemsForPage).ceil() : state.orders.length / itemsForPage).ceil()).toString()) + 1);
    if(wiMin >= size.width * 0.5){
      wiMin = size.width * 0.2;
    }

    listW.add(
        SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(Icons.arrow_back_ios_new,
                  size: 20,
                  color: ((state.currentPage > 0) ? AppColor.primary : AppColor.neutral40)),
              onTap: (){
                if(state.currentPage > 0){
                  cubit.changePage(page: state.currentPage - 1);
                  //state.scrollController!.jumpTo((state.currentPage + 1) * (25));
                  state.pageController!.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
              },
            ),
            spacerXs,
            SizedBox(
              width: wiMin,
              height: 30,
              child: PageView(
                controller: state.pageController,
                scrollDirection: Axis.horizontal,
                children: items,
              ),
              // child: ListView(
              //   controller: state.scrollController!,
              //   scrollDirection: Axis.horizontal,
              //   children: items.map((e){
              //     return Container(
              //       width: 30, height: 30,
              //       margin: const EdgeInsets.symmetric(horizontal: 2),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: ((state.currentPage + 1) == e) ? AppColor.primary : AppColor.white,
              //           border: Border.all(color: ((state.currentPage + 1) == e) ? AppColor.primary : AppColor.blue300)
              //       ),
              //       child: Center(
              //         child: Text(e.toString(),
              //             style: AppTextStyle.h1Style.copyWith(
              //                 fontSize: 16,color: ((state.currentPage + 1) == e) ? AppColor.white : AppColor.blue300
              //             )),
              //       ),
              //     );
              //   }).toList(),
              // ),
            ),
            spacerXs,
            InkWell(
              child: Icon(Icons.arrow_forward_ios,
                  size: 20,
                  color: ((state.currentPage + 1) <= totalPAge) ? AppColor.primary : AppColor.neutral40),
              onTap: (){
                log('state.currentPage + 1 = ${state.currentPage + 1}');
                log('totalPAge = $totalPAge');

                if((state.currentPage + 1) < totalPAge){
                  state.pageController!.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                  //state.scrollController!.jumpTo((state.currentPage + 1) * 25);
                  cubit.changePage(page: state.currentPage + 1);
                }
              },
            ),
          ],
        ),
      ),
    )
    );
    listW.add(const SizedBox(height: 10,));
    listW.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mostrando ',
                  style: AppTextStyle.nunito18.copyWith(fontSize: 16),
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  color: AppColor.whiteF,
                  child: Center(
                    child: Text(
                      '   ${pageItems.length}   ',
                      style: AppTextStyle.nunito18.copyWith(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  ' de ${state.orders.length} Resultados',
                  style: AppTextStyle.nunito18.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
        )
    );
    listW.add(const SizedBox(height: 10,));
    return Column(
      children: listW,
    );

  }

  Widget tablaPedidos({required AlbaranISI albaran, required BuildContext context, required MyOrdersState state}){

    Size size = MediaQuery.of(context).size;
    final cubit = context.read<MyOrdersCubit>();

    if(state.startDate != null && state.endDate == null && albaran.fecha.isBefore(state.startDate!)){
      return Container();
    }else if(state.startDate == null && state.endDate != null && albaran.fecha.isAfter(state.endDate!)){
      return Container();
    } else if(state.startDate != null && state.endDate != null && (albaran.fecha.isBefore(state.startDate!) || albaran.fecha.isAfter(state.endDate!))){
      return Container();
    }

    bool valueCheck = false;
    state.statePedidosSelected!.forEach((key, value) {
      if(key.contains(albaran.albaran) && value){
        valueCheck = true;
      }
    });

    UserData? user = LocalDataRepository().user;
    int meses = 0;
    if(user != null){
      meses = user.webservice!.meses_buscar_albaranes;
    }

    int dias = 0;
    int myMes = albaran.fecha.month;
    for(int x = 1; x <= meses; x++){
      if(myMes == 4 || myMes == 6|| myMes == 9 || myMes == 11){ dias = dias + 30; }
      if(myMes == 1 || myMes == 3 || myMes == 5 || myMes == 7|| myMes == 8|| myMes == 10 || myMes == 12){ dias = dias + 31; }
      if(myMes == 2 ){ dias = dias + 28; }
      myMes++;
    }

    bool blockCheck = !isReturns;
    if(albaran.fecha.add(Duration(days: dias)).difference(DateTime.now()).inDays < 0){
      blockCheck = true;
    }
    bool exitsUnid = blockCheck;
    for (var lineaAlb in state.ordersDetails![albaran.albaran]!) {
      if(lineaAlb.cantidadTotal != 0){ exitsUnid = true; }
    }
    if(!exitsUnid){
      blockCheck = true;
    }


    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: const BoxDecoration(
              color: AppColor.neutral00,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(0.0),
                  topRight: Radius.circular(20.0),bottomRight: Radius.circular(0.0)
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: size.width,
                          child: Text(DateFormat.yMd('es').format(albaran.fecha), style: AppTextStyle.nunito18.copyWith(
                              fontSize: 16
                          ),textAlign: TextAlign.left),
                        ),
                      ),
                      SizedBox(
                        child: blockCheck ? Container(height: size.height * 0.04) : Checkbox(
                          value: valueCheck,
                          activeColor: AppColor.primary,
                          onChanged:  (value){
                            cubit.changeSelected(key: albaran.albaran,isCabecera: true,valueCab: value!);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: size.width,
                          child: Text(albaran.albaran, style: AppTextStyle.nunito18.copyWith(
                              fontWeight: FontWeight.bold
                          ),textAlign: TextAlign.left),
                        ),
                      ),
                      SizedBox(
                        child: Text(myFormatMoney(double.parse(albaran.total.toString())), style: AppTextStyle.nunito18.copyWith(
                            fontWeight: FontWeight.bold
                        ),textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: size.width,
                  child: Text('Devolución elegible hasta ${DateFormat.yMd('es').format(albaran.fecha.add(Duration(days: dias)))}', style: AppTextStyle.nunito18.copyWith(
                      fontSize: 16
                  ),textAlign: TextAlign.left),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: StatusLabelWidget(albaran.estado.replaceAll(' ', '') == 'FACTURADO',isCenter: true),
                      ),
                      SizedBox(width: size.width * 0.05),
                      InkWell(
                        child: SizedBox(
                          width: size.height * 0.03,
                          height: size.height * 0.03,
                          child: Image.asset(
                            'assets/icons/arrow_next.png',
                            color: AppColor.primaryBlue,
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed(
                            AlbaranDetailPage.route,
                            arguments: AlbaranDetailArg(albaran: albaran, title: 'Pedido'),
                          );

                          // Navigator.of(context).pushNamed(
                          //   AlbaranReturns.route,
                          //   arguments: {
                          //     'orders' : state.orders,
                          //     'albaranMotivos' : state.albaranMotivos,
                          //     'statePedidosSelected' : state.statePedidosSelected,
                          //     'cubit' : cubit,
                          //   },
                          // );
                        },
                      )
                      // IconButton(
                      //   icon: const Icon(Icons.arrow_forward_sharp,color: AppColor.primary,size: 15),
                      //   onPressed: (){},
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: AppColor.blue100,
          ),
          if(state.statePedidosOpen![albaran.albaran]!)...[
            Container(
              width: size.width,
              color: AppColor.white,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: state.ordersDetails![albaran.albaran]!.map((e) =>
                cardAlbaran(
                  context: context,
                  state: state,
                  albaranDetails: e,
                  albaranId: albaran.albaran,
                  block: blockCheck
                )).toList(),
              ),
            ),
          ],
          InkWell(
            onTap: (){
              if(state.ordersDetails![albaran.albaran]!.isNotEmpty){
                cubit.changeOpen(key: albaran.albaran);
              }
            },
            child: Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: const BoxDecoration(
                color: AppColor.neutral00,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(0.0),bottomRight: Radius.circular(20.0)
                ),
              ),
              child: state.ordersDetails![albaran.albaran]!.isNotEmpty ? Center(
                child: RotatedBox(
                  quarterTurns: state.statePedidosOpen![albaran.albaran]! ? 1 : 3,
                  child: Icon( Icons.arrow_back_ios,size: size.height * 0.025,color: AppColor.primary),
                ),
              ) : Container(
                height: size.height * 0.025,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02,)
        ],
      ),
    );
  }

  Widget cardAlbaran({required LineasAlbaran albaranDetails, required BuildContext context, required MyOrdersState state,required String albaranId , required bool block}){

    Size size = MediaQuery.of(context).size;
    final cubit = context.read<MyOrdersCubit>();

    int cant = albaranDetails.cantidadTotal;
    bool blockCant = cant <= 0;

    return Container(
      width: size.width,
      color: AppColor.whiteF,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: Text(albaranDetails.description,style:
                  AppTextStyle.nunito18.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  child: (block || blockCant) ? Container(height: size.height * 0.05,) :Checkbox(
                    value: state.statePedidosSelected!['$albaranId${albaranDetails.referencia}'] ?? false,
                    activeColor: AppColor.primary,
                    onChanged:  (value){
                      cubit.changeSelected(key: '$albaranId${albaranDetails.referencia}');
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: textCardAlbaran(context: context,titlte: 'REFERENCIA',subTitle: albaranDetails.referencia),
                ),
                if(cant > 0)...[
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'UNIDADES',subTitle: (cant).toString()),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02,),
          if(albaranDetails.lineaEstado == 'ABONADO')...[
            SizedBox(
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'CANTIDAD DEVUELTA',subTitle: albaranDetails.canAbonado.toString()),
                  ),
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: '',subTitle: ''),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(height: size.height * 0.02,),
          Container(
            width: size.width,
            height: 1,
            color: AppColor.blue100,
          )
        ],
      ),
    );
  }

  Widget textCardAlbaran({required String titlte, required String subTitle,required BuildContext context}){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
            width: size.width,
            child: Text(titlte,style:
            AppTextStyle.nunito18.copyWith(fontSize: 16),)
        ),
        SizedBox(height: size.height * 0.01,),
        SizedBox(
            width: size.width,
            child: Text(subTitle,style:
            AppTextStyle.nunito18.copyWith(fontSize: 16,fontWeight: FontWeight.bold),)
        ),
      ],
    );
  }

  Widget filterDate({required BuildContext context, required MyOrdersState state}){
    Size size = MediaQuery.of(context).size;
    final cubit = context.read<MyOrdersCubit>();
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        children: [
          spacerM,
          SizedBox(
            width: size.width,
            child: const Text(
              'Filtrar rango de fechas',
              style: AppTextStyle.inputLabelStyle,
              textAlign: TextAlign.left,
            ),
          ),
          spacerS,
          Container(
            color: AppColor.whiteF,
            child: Row(
              children: [
                ButtonFilter(
                  text: state.startDate == null ? 'dd/mm/aaaa' : DateFormat.yMd('es').format(state.startDate!),
                  textColor: state.startDate == null ? Colors.grey[600]! : Colors.black,
                  elevation: 0,
                  icon: const Icon(Icons.calendar_month,size: 20,color: AppColor.primary),
                  onPressed: () async {
                    showRoundedDatePicker(
                      context: context,
                      initialDate: state.startDate ?? DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 20),
                      lastDate: DateTime.now(),
                      locale: const Locale('es', 'ES'),
                      height: 340,
                      borderRadius: 16,
                      styleYearPicker: MaterialRoundedYearPickerStyle(
                        textStyleYear: const TextStyle(fontSize: 16, color: AppColor.whiteF),
                      ),
                      styleDatePicker: MaterialRoundedDatePickerStyle(
                        textStyleDayButton: const TextStyle(fontSize: 26, color: Colors.white),
                        textStyleYearButton: const TextStyle(fontSize: 22,color: Colors.white,),
                        textStyleDayHeader: const TextStyle(fontSize: 18,color: AppColor.primary,),
                        textStyleMonthYearHeader: const TextStyle(fontSize: 22, color: AppColor.primary, fontWeight: FontWeight.bold),
                        colorArrowNext: AppColor.primary,
                        colorArrowPrevious: AppColor.primary,
                        textStyleButtonPositive: const TextStyle(fontSize: 18, color: AppColor.primary, fontWeight: FontWeight.bold),
                        textStyleButtonNegative: const TextStyle(fontSize: 18, color: AppColor.primary),

                        textStyleCurrentDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold),
                        textStyleDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary),
                        textStyleDayOnCalendarSelected: const TextStyle(fontSize: 22, color: AppColor.whiteF, fontWeight: FontWeight.bold),
                        textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: AppColor.primary.withOpacity(0.1)),
                      ),
                      theme: ThemeData(
                          primaryColor: AppColor.primary,
                          colorScheme: const ColorScheme.light(
                            primary: AppColor.primary,
                            surface: AppColor.whiteF,
                            onSurface: AppColor.whiteF,
                            onPrimary: Colors.black,
                          ),
                          disabledColor: Colors.black,
                          dialogBackgroundColor: AppColor.whiteF, // Fondo del diálogo
                          dialogTheme: DialogTheme(
                            titleTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                            surfaceTintColor: AppColor.whiteF,
                            backgroundColor: AppColor.whiteF,
                            contentTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                            shadowColor: AppColor.whiteF,
                          )
                      ),
                    ).then((date) {
                      if (date != null) {
                        cubit.changeDate(date: date, isStar: true);
                      }
                    });
                  },
                ),
                const Text('-',style: AppTextStyle.inputLabelStyle,),
                ButtonFilter(
                  text: state.endDate == null ? 'dd/mm/aaaa' : DateFormat.yMd('es').format(state.endDate!),
                  textColor: state.endDate == null ? Colors.grey[600]! : Colors.black,
                  elevation: 0,
                  icon: const Icon(Icons.calendar_month,size: 20,color: AppColor.primary),
                  onPressed: () {
                    if(state.startDate != null){
                      showRoundedDatePicker(
                        context: context,
                        initialDate: state.endDate ?? state.startDate!,
                        lastDate: DateTime.now(),
                        locale: const Locale('es', 'ES'),
                          textNegativeButton: "Cancelar", // Texto en minúscula para el botón Cancelar
                          textPositiveButton: "Aceptar", // Texto en minúscula para el botón Aceptar
                          height: 340,
                          borderRadius: 16,
                        styleYearPicker: MaterialRoundedYearPickerStyle(
                          textStyleYear: const TextStyle(fontSize: 16, color: AppColor.whiteF),
                        ),
                        styleDatePicker: MaterialRoundedDatePickerStyle(
                          textStyleDayButton: const TextStyle(fontSize: 26, color: Colors.white),
                          textStyleYearButton: const TextStyle(fontSize: 22,color: Colors.white,),
                          textStyleDayHeader: const TextStyle(fontSize: 18,color: AppColor.primary,),
                          textStyleMonthYearHeader: const TextStyle(fontSize: 22, color: AppColor.primary, fontWeight: FontWeight.bold),
                          colorArrowNext: AppColor.primary,
                          colorArrowPrevious: AppColor.primary,
                          textStyleButtonPositive: const TextStyle(fontSize: 18, color: AppColor.primary, fontWeight: FontWeight.bold),
                          textStyleButtonNegative: const TextStyle(fontSize: 18, color: AppColor.primary),

                          textStyleCurrentDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary),
                          textStyleDayOnCalendarSelected: const TextStyle(fontSize: 22, color: AppColor.whiteF, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: AppColor.primary.withOpacity(0.1)),
                        ),
                        theme: ThemeData(
                            primaryColor: AppColor.primary,
                            colorScheme: const ColorScheme.light(
                              primary: AppColor.primary,
                              surface: AppColor.whiteF,
                              onSurface: AppColor.whiteF,
                              onPrimary: Colors.black,
                            ),
                            disabledColor: Colors.black,
                            dialogBackgroundColor: AppColor.whiteF, // Fondo del diálogo
                            dialogTheme: DialogTheme(
                              titleTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                              surfaceTintColor: AppColor.whiteF,
                              backgroundColor: AppColor.whiteF,
                              contentTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                              shadowColor: AppColor.whiteF,
                            )
                        ),
                      ).then((date) {
                        if (date != null) {
                          cubit.changeDate(date: date, isStar: false);
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          spacerM,
        ],
      ),
    );
  }

  Widget tablaPedidosOld({required BuildContext context,required MyOrdersState state}){
    final cubit = context.read<MyOrdersCubit>();

    double hSize = 350;
    if(state.dataPedidosFiltrado!.rowCount <= 5){
      if(state.dataPedidosFiltrado!.rowCount > 2){
        hSize = hSize + (20 * state.dataPedidosFiltrado!.rowCount);
      }
    }else{
      hSize = 500;
    }

    return SizedBox(
      height: hSize,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  spacerS,
                  const Text(
                    'Pedidos',
                    style: AppTextStyle.h3Style,
                  ),
                  Text(
                      '${state.dataPedidosFiltrado!.rowCount} Total'),
                  // spacerM,
                ],
              ),
            ),
            spacerS,
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15),
              child: MySearchInput(
                hintText: 'Buscar por palabras claves...',
                onChanged: cubit.filtroPedidos,
                fillColor: AppColor.blue50,
                borderSideColor: AppColor.blue100,
              ),
            ),
            spacerS,
            Expanded(
              child: PaginatedDataTable2(
                wrapInCard: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                empty: const NoResultTable(),
                minWidth: 1000,
                rowsPerPage: state.dataPedidosFiltrado!.rowCount <= 10 ? state.dataPedidosFiltrado!.rowCount : 10,
                columns: const [
                  DataColumn2(
                    label: Text('N° DOCUMENTO'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('FECHA'),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('CONTADOR'),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('MODO DE ENTREGA'),
                    fixedWidth: 125,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('ALMACÉN'),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('IMPORTE'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('ESTADO'),
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                ],
                source: state.dataPedidosFiltrado!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filterDateOrders({required BuildContext context,required MyOrdersState state}){
    final cubit = context.read<MyOrdersCubit>();

    // log('state.startDate : ${state.startDate}');
    // log('state.endDate : ${state.endDate}');

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          spacerM,
          const SizedBox(
            width: double.infinity,
            child: Text( 'Filtrar por fechas', style: AppTextStyle.inputLabelStyle,textAlign: TextAlign.left, ),
          ),
          Container(
            width: double.infinity,
            color: AppColor.white,
            child: Row(
              children: [
                ButtonFilter(
                  radiu: 0,
                  elevation: 0,
                    text: state.startDate == null ? 'Desde': DateFormat.yMd('es').format(state.startDate!),
                    textColor: state.startDate == null ? Colors.grey[600]! : Colors.black,
                    icon: const Icon(Icons.calendar_month,color: AppColor.primary,size: 25),
                    onPressed: () async {
                      showRoundedDatePicker(
                        context: context,
                        initialDate: state.startDate,
                        firstDate: DateTime(DateTime.now().year - 20),
                        lastDate: DateTime.now().add(const Duration(days: 1)),
                        locale: const Locale('es', 'ES'),
                        textNegativeButton: "Cancelar", // Texto en minúscula para el botón Cancelar
                        textPositiveButton: "Aceptar", // Texto en minúscula para el botón Aceptar
                        height: 340,
                        borderRadius: 16,
                        styleYearPicker: MaterialRoundedYearPickerStyle(
                          textStyleYear: const TextStyle(fontSize: 16, color: AppColor.whiteF),
                        ),
                        styleDatePicker: MaterialRoundedDatePickerStyle(
                          textStyleDayButton: const TextStyle(fontSize: 26, color: Colors.white),
                          textStyleYearButton: const TextStyle(fontSize: 22,color: Colors.white,),
                          textStyleDayHeader: const TextStyle(fontSize: 18,color: AppColor.primary,),
                          textStyleMonthYearHeader: const TextStyle(fontSize: 22, color: AppColor.primary, fontWeight: FontWeight.bold),
                          colorArrowNext: AppColor.primary,
                          colorArrowPrevious: AppColor.primary,
                          textStyleButtonPositive: const TextStyle(fontSize: 18, color: AppColor.primary, fontWeight: FontWeight.bold),
                          textStyleButtonNegative: const TextStyle(fontSize: 18, color: AppColor.primary),

                          textStyleCurrentDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary),
                          textStyleDayOnCalendarSelected: const TextStyle(fontSize: 22, color: AppColor.whiteF, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: AppColor.primary.withOpacity(0.1)),
                        ),
                      theme: ThemeData(
                        primaryColor: AppColor.primary,
                        colorScheme: const ColorScheme.light(
                          primary: AppColor.primary,
                          surface: AppColor.whiteF,
                          onSurface: AppColor.whiteF,
                          onPrimary: Colors.black,
                        ),
                        disabledColor: Colors.black,
                        dialogBackgroundColor: AppColor.whiteF, // Fondo del diálogo
                        dialogTheme: DialogTheme(
                          titleTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                          surfaceTintColor: AppColor.whiteF,
                          backgroundColor: AppColor.whiteF,
                          contentTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                          shadowColor: AppColor.whiteF,
                        )
                      ),
                      ).then((date) {
                        if (date != null) {
                          cubit.getMyOrders(filter: {
                            'start_date' : date,
                            'end_date' : state.endDate,
                          });
                        }
                      });
                    },
                ),
                ButtonFilter(
                  radiu: 0,
                  elevation: 0,
                  icon: const Icon(Icons.calendar_month,color: AppColor.primary,size: 25),
                    text: state.endDate == null ? 'Hasta' : DateFormat.yMd('es').format(state.endDate!),
                    textColor: state.endDate == null ? Colors.grey[600]! : Colors.black,
                    onPressed: state.startDate == null ? null : () {
                      showRoundedDatePicker(
                        context: context,
                        initialDate: state.endDate!,
                        firstDate: state.startDate!,
                        lastDate: DateTime.now().add(const Duration(days: 1)),
                        locale: const Locale('es', 'ES'),
                        textNegativeButton: "Cancelar", // Texto en minúscula para el botón Cancelar
                        textPositiveButton: "Aceptar", // Texto en minúscula para el botón Aceptar
                        height: 340,
                        borderRadius: 16,
                        styleYearPicker: MaterialRoundedYearPickerStyle(
                          textStyleYear: const TextStyle(fontSize: 16, color: AppColor.whiteF),
                        ),
                        styleDatePicker: MaterialRoundedDatePickerStyle(
                          textStyleDayButton: const TextStyle(fontSize: 26, color: Colors.white),
                          textStyleYearButton: const TextStyle(fontSize: 22,color: Colors.white,),
                          textStyleDayHeader: const TextStyle(fontSize: 18,color: AppColor.primary,),
                          textStyleMonthYearHeader: const TextStyle(fontSize: 22, color: AppColor.primary, fontWeight: FontWeight.bold),
                          colorArrowNext: AppColor.primary,
                          colorArrowPrevious: AppColor.primary,
                          textStyleButtonPositive: const TextStyle(fontSize: 18, color: AppColor.primary, fontWeight: FontWeight.bold),
                          textStyleButtonNegative: const TextStyle(fontSize: 18, color: AppColor.primary),

                          textStyleCurrentDayOnCalendar: TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendar: TextStyle(fontSize: 20, color: AppColor.primary),
                          textStyleDayOnCalendarSelected: TextStyle(fontSize: 22, color: AppColor.whiteF, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: AppColor.primary.withOpacity(0.1)),
                        ),
                        theme: ThemeData(
                            primaryColor: AppColor.primary,
                            colorScheme: const ColorScheme.light(
                              primary: AppColor.primary,
                              surface: AppColor.whiteF,
                              onSurface: AppColor.whiteF,
                              onPrimary: Colors.black,
                            ),
                            disabledColor: Colors.black,
                            dialogBackgroundColor: AppColor.whiteF, // Fondo del diálogo
                            dialogTheme: DialogTheme(
                              titleTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                              surfaceTintColor: AppColor.whiteF,
                              backgroundColor: AppColor.whiteF,
                              contentTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                              shadowColor: AppColor.whiteF,
                            )
                        ),
                      ).then((date) {
                        if (date != null) {
                          cubit.getMyOrders(filter: {
                            'start_date' : date,
                            'end_date' : state.endDate,
                          });
                        }
                      });
                    },
                ),
              ],
            ),
          ),
          spacerM,
        ],
      ),

    );
  }

  onTap(BuildContext context, Albaran albaran) {
    return Navigator.of(context).pushNamed(
      AlbaranDetailPage.route,
      arguments: albaran,
    );
  }
}
