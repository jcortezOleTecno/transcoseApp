import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
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
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacerS,
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Text('Mis pedidos ', style: AppTextStyle.h2Style.copyWith(fontSize: 28,fontWeight: FontWeight.w800)),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('|', style: AppTextStyle.nunito18),
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
                              padding: const EdgeInsets.only(right: 10,left: 5),
                              child: MySearchInputEdit(
                                controller: state.controllerText,
                                initialValue: null,
                                hintText: 'Buscar por referencia, albarán, EAN...',
                                onChanged:(value){
                                  cubit.filtroPedidos(value);
                                  state.pageController!.jumpToPage(0);
                                } ,
                                borderSideColor: AppColor.blue100,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: 55, width: 55,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Forma circular
                                  color: AppColor.whiteF,
                                  border: Border.all(color: AppColor.blue100)
                              ),
                              child: Image.asset(
                                'assets/icons/qr_icon2.png',color: AppColor.primary,
                              ),
                            ),
                            onTap: () async {
                              await Navigator.of(context).pushNamed(QrLector.route,arguments: cubit);
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
      try{
        pageItems = state.ordersFilter.sublist(startIndex, endIndex);
      }catch(_){}
    }else{
      endIndex = (startIndex + itemsForPage).clamp(0, state.orders.length);
      try{
        pageItems = state.orders.sublist(startIndex, endIndex);
      }catch(_){}
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

    bool valueCheck = false;
    state.statePedidosSelected!.forEach((key, value) {
      if(key.contains(albaran.albaran) && value){
        valueCheck = true;
      }
    });

    UserData? user = LocalDataRepository().user;
    int dias = 0;
    if(user != null){
      dias = user.webservice!.dias_periodo_devolucion;
    }

    //DateTime dateDev = albaran.fecha.toUtc().add(Duration(days: dias)).toLocal();
    DateTime utcDateTime = DateTime.utc(albaran.fecha.year, albaran.fecha.month, albaran.fecha.day, 0, 0, 0);
    DateTime dateDev = utcDateTime.add(Duration(days: dias));

    bool blockCheck = !isReturns;
    if(dateDev.difference(DateTime.now()).inDays <= 0){
      blockCheck = true;
    }
    bool exitsUnid = blockCheck;
    for (var lineaAlb in state.ordersDetails![albaran.albaran]!) {
      if(lineaAlb.cantidadTotal > 0){ exitsUnid = true; }
    }
    if(!exitsUnid){
      blockCheck = true;
    }
    if(!SharedPreferencesLocal.veraneValidatedDevolucion){
      blockCheck = true;
    }
    int exitsCasco = 0;
    List<LineasAlbaran> matchedIsiItems = [];
    List<LineasAlbaran> noMatchedIsiItems = [];
    if(state.filterPedidos != null){
      for (var isiItem in state.ordersDetails![albaran.albaran]!) {
        bool isiItemMatches = isiItem.ean.toLowerCase().trim().contains(state.filterPedidos!.toLowerCase().trim()) ||
            isiItem.referencia.toLowerCase().trim().contains(state.filterPedidos!.toLowerCase().trim()) ||
            isiItem.description.toLowerCase().trim().contains(state.filterPedidos!.toLowerCase().trim()) ||
            isiItem.refss.toLowerCase().trim().contains(state.filterPedidos!.toLowerCase().trim());

        if (isiItemMatches) {
          matchedIsiItems.add(isiItem);
          if(isiItem.referencia.contains('CV') || isiItem.referencia.contains('CN')){
            exitsCasco++;
          }
        }else{
          noMatchedIsiItems.add(isiItem);
        }
      }
    }else{
      noMatchedIsiItems = state.ordersDetails![albaran.albaran]!.map((toElement)=>toElement).toList();
    }

    if(noMatchedIsiItems.isNotEmpty){
      noMatchedIsiItems.sort((a, b) => a.referencia.compareTo(b.referencia));
    }
    if(matchedIsiItems.isNotEmpty){
      matchedIsiItems.sort((a, b) => a.referencia.compareTo(b.referencia));
    }


    //VERIFICAR SI EN LAS BUSQUEDAS ES UN CASCO Y BUSCAR SU PRODUCTO
    if(exitsCasco > 0 && matchedIsiItems.isNotEmpty){
      List<LineasAlbaran> matchedIsiItemsV2 = [];
      for(int m = 0; m < matchedIsiItems.length; m++){
        if(matchedIsiItems[m].referencia.contains('CV') || matchedIsiItems[m].referencia.contains('CN')){
          int posDelete = 0;bool yesDelete = false;
          for(int mx = 0; mx < noMatchedIsiItems.length; mx++){
            if(noMatchedIsiItems[mx].referencia == matchedIsiItems[m].referencia.replaceAll('CV', '').replaceAll('CN', '')){
              matchedIsiItemsV2.add(noMatchedIsiItems[mx]);
              matchedIsiItemsV2.add(matchedIsiItems[m]);
              posDelete = mx;
              yesDelete = true;
            }
          }
          if(yesDelete){
            noMatchedIsiItems.removeAt(posDelete);
          }else{
            matchedIsiItemsV2.add(matchedIsiItems[m]);
          }
        }else{
          matchedIsiItemsV2.add(matchedIsiItems[m]);
        }
      }
      matchedIsiItems = [];
      matchedIsiItems = matchedIsiItemsV2.map((toElement)=>toElement).toList();
    }

    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
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
                        // Este Container tiene un tamaño fijo para demostrar que el Checkbox NO lo llena.
                        child: blockCheck ? Container(height: size.height * 0.04) : InkWell(
                          onTap: (){
                            cubit.changeSelected(key: albaran.albaran,isCabecera: true,valueCab: !valueCheck,ref: '',albaran: '');
                          },
                          child: Container(
                            margin: EdgeInsets.all(size.height * 0.01),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), // Borde redondeado
                              border: Border.all(color: valueCheck ? AppColor.primary : AppColor.neutral40,width: 1.2),
                              color: valueCheck ? AppColor.primary : Colors.transparent,
                            ),
                            child: Center(
                              child: Icon(Icons.check,color: valueCheck ? AppColor.whiteF : Colors.transparent,size: 15),
                            ),
                          ),
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
                              fontWeight: FontWeight.bold,color: AppColor.black
                          ),textAlign: TextAlign.left),
                        ),
                      ),
                      SizedBox(
                        child: Text(myFormatMoney(double.parse(albaran.total.toString())), style: AppTextStyle.nunito18.copyWith(
                            fontWeight: FontWeight.bold,color: AppColor.black
                        ),textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: size.width,
                  child: Text('Devolución elegible hasta ${DateFormat.yMd('es').format(dateDev)}', style: AppTextStyle.nunito18.copyWith(
                      fontSize: 16
                  ),textAlign: TextAlign.left),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(), //StatusLabelWidget(albaran.estado.replaceAll(' ', '') == 'FACTURADO',isCenter: true),
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
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: AppColor.blue100,
          ),
          if(matchedIsiItems.isNotEmpty && state.statePedidosOpen![albaran.albaran]!)...[
            Container(
              width: size.width,
              color: AppColor.white,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  for(int x = 0; x < matchedIsiItems.length; x++)...[
                    cardAlbaran(
                        context: context,
                        state: state,
                        listLineas: matchedIsiItems,
                        albaranDetails: matchedIsiItems[x],
                        albaranId: albaran.albaran,
                        block: blockCheck,
                        refOld: ((x + 1 < matchedIsiItems.length) && (matchedIsiItems[x + 1].referencia.contains(matchedIsiItems[x].referencia)))
                    )
                  ]
                ],
              ),
            ),
          ],
          if(state.filterPedidos != null && noMatchedIsiItems.isNotEmpty && state.statePedidosOpen![albaran.albaran]! && matchedIsiItems.isNotEmpty)...[
            Container(height: size.height * 0.01,color: AppColor.whiteF,margin: const EdgeInsets.symmetric(horizontal: 5),),
            InkWell(
              onTap: (){
                if(state.ordersDetails![albaran.albaran]!.isNotEmpty){
                  cubit.changeOpenMore(key: albaran.albaran);
                }
              },
              child: Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColor.neutral00,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),bottomLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),bottomRight: Radius.circular(0.0)
                  ),
                ),
                child: noMatchedIsiItems.isNotEmpty ? Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('Ver ${state.statePedidosOpenViewMore![albaran.albaran]! ? 'menos' : 'más'}',style: AppTextStyle.nunitoSans70014.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                        Expanded(child: Container()),
                        RotatedBox(
                          quarterTurns: state.statePedidosOpenViewMore![albaran.albaran]! ? 1 : 3,
                          child: Icon( Icons.arrow_back_ios,size: size.height * 0.025,color: AppColor.primary),
                        ),
                      ],
                    ),
                  ),
                ) : Container(
                  height: size.height * 0.025,
                ),
              ),
            ),
            if(state.statePedidosOpen![albaran.albaran]! && !state.statePedidosOpenViewMore![albaran.albaran]!)...[
              Container(height: size.height * 0.02,color: AppColor.whiteF,margin: const EdgeInsets.symmetric(horizontal: 5),),
              Container(
                  width: size.width,
                  color: AppColor.whiteF,
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    width: size.width,
                    height: 1,
                    color: AppColor.blue100,
                  )
              ),
              Container(height: size.height * 0.02,color: AppColor.whiteF,margin: const EdgeInsets.symmetric(horizontal: 5),),
            ],
          ],
          if((state.statePedidosOpenViewMore![albaran.albaran]! && state.statePedidosOpen![albaran.albaran]!) ||
              (state.filterPedidos == null && state.statePedidosOpen![albaran.albaran]!) ||
              (state.statePedidosOpen![albaran.albaran]! && matchedIsiItems.isEmpty && noMatchedIsiItems.isNotEmpty))...[
            Container(
              width: size.width,
              color: AppColor.white,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  for(int x = 0; x < noMatchedIsiItems.length; x++)...[
                    cardAlbaran(
                        context: context,
                        state: state,
                        albaranDetails: noMatchedIsiItems[x],
                        albaranId: albaran.albaran,
                        block: blockCheck,
                        listLineas: noMatchedIsiItems,
                        refOld: ((x + 1 < noMatchedIsiItems.length) && (noMatchedIsiItems[x + 1].referencia.contains(noMatchedIsiItems[x].referencia)))
                    )
                  ],
                ],
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
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: const BoxDecoration(
                color: AppColor.neutral00,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(0.0),bottomRight: Radius.circular(20.0)
                ),
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      //Text('Ver ${state.statePedidosOpen![albaran.albaran]! ? 'menos' : 'más'}',style: AppTextStyle.nunitoSans70014.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                      Expanded(child: Container()),
                      RotatedBox(
                        quarterTurns: state.statePedidosOpen![albaran.albaran]! ? 1 : 3,
                        child: Icon( Icons.arrow_back_ios,size: size.height * 0.025,color: AppColor.primary),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02,)
        ],
      ),
    );
  }

  Widget cardAlbaran({required LineasAlbaran albaranDetails, required BuildContext context, required MyOrdersState state,required String albaranId , required bool block, required bool refOld, required List<LineasAlbaran> listLineas}){

    Size size = MediaQuery.of(context).size;
    final cubit = context.read<MyOrdersCubit>();

    int cant = albaranDetails.cant;
    int cantAbb = albaranDetails.canAbonado;
    bool blockCant = albaranDetails.cantidadTotal <= 0;
    bool isCasco = false;
    String title =  albaranDetails.description;
    if(albaranDetails.referencia.contains('CV') || albaranDetails.referencia.contains('CN')){
      title = 'CASCO';isCasco = true;
    }

    bool valueCheck = state.statePedidosSelected!['$albaranId${albaranDetails.referencia}'] ?? false;

    bool exist = false;
    for (var action in listLineas) {
      if((action.referencia == '${albaranDetails.referencia}CN' || action.referencia == '${albaranDetails.referencia}CV') && action.cantidadTotal <= 0){
        exist = true;
      }
    }
    if(exist){
      blockCant = true;
    }
    bool existCasco = false;
    if(isCasco){
      for (var action in listLineas) {
        if(action.referencia == albaranDetails.referencia.replaceAll('CN', '').replaceAll('CV', '')){
          existCasco = true;
        }
      }
      if(!existCasco){ isCasco = false; }
    }

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
                  child: Text(title,style:
                  AppTextStyle.nunito18.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                // SizedBox(
                //   child: (block || blockCant) ? Container(height: size.height * 0.05,) :Checkbox(
                //     value: state.statePedidosSelected!['$albaranId${albaranDetails.referencia}'] ?? false,
                //     activeColor: AppColor.primary,
                //     onChanged:  (value){
                //       cubit.changeSelected(key: '$albaranId${albaranDetails.referencia}',albaran: albaranId,ref: albaranDetails.referencia);
                //     },
                //   ),
                // ),
                SizedBox(
                  child: (block || blockCant) ? Container(height: size.height * 0.05,) : InkWell(
                    onTap: (){
                      cubit.changeSelected(key: '$albaranId${albaranDetails.referencia}',albaran: albaranId,ref: albaranDetails.referencia);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: size.height * 0.015,horizontal: size.height * 0.01),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Borde redondeado
                        border: Border.all(color: valueCheck ? AppColor.primary : AppColor.neutral40,width: 1.2),
                        color: valueCheck ? AppColor.primary : Colors.transparent,
                      ),
                      child: Center(
                        child: Icon(Icons.check,color: valueCheck ? AppColor.whiteF : Colors.transparent,size: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if(isCasco)...[
            SizedBox(
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'CANTIDAD',subTitle: cant >= 0 ? (cant).toString() : '0'),
                  ),
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'CANTIDAD DEVUELTA',subTitle: cantAbb.toString()),
                  ),
                ],
              ),
            ),
          ]else...[
            SizedBox(
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'REFERENCIA',subTitle: albaranDetails.referencia.replaceAll('CN', '').replaceAll('CV', '')),
                  ),
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: '',subTitle: ''),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            SizedBox(
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'CANTIDAD',subTitle: cant >= 0 ? (cant).toString() : '0'),
                  ),
                  Expanded(
                    child: textCardAlbaran(context: context,titlte: 'CANTIDAD DEVUELTA',subTitle: cantAbb.toString()),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(height: size.height * 0.02,),
          if(!refOld)...[
            Container(
              width: size.width,
              height: 1,
              color: AppColor.blue100,
            )
          ]
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

  Widget filterDateOrders({required BuildContext context,required MyOrdersState state}){
    final cubit = context.read<MyOrdersCubit>();

    // log('state.startDate : ${state.startDate}');
    // log('state.endDate : ${state.endDate}');

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          spacerM,
          const SizedBox(
            width: double.infinity,
            child: Text( 'Filtrar por fechas', style: AppTextStyle.inputLabelStyle,textAlign: TextAlign.left, ),
          ),
          SizedBox(height: 8,),
          Container(
            width: double.infinity,
            color: AppColor.white,
            child: Row(
              children: [
                ButtonFilter(
                  sizeHeight: 55,
                  radiu: 0,
                  elevation: 0,
                  text: state.startDate == null ? 'Desde': DateFormat.yMd('es').format(state.startDate!),
                  textColor: state.startDate == null ? Colors.grey[600]! : Colors.black,
                  icon: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Image.asset(
                      'assets/icons/calendar.png',
                      color: AppColor.primaryBlue,
                    ),
                  ),
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
                        textStyleYear: const TextStyle(fontSize: 18, color: AppColor.primary),
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
                          'currentPage' : 0,
                        });
                        state.pageController!.jumpToPage(0);
                      }
                    });
                  },
                ),
                ButtonFilter(
                  sizeHeight: 55,
                  radiu: 0,
                  elevation: 0,
                  //icon: const Icon(Icons.calendar_month,color: AppColor.primary,size: 25),
                  icon: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Image.asset(
                      'assets/icons/calendar.png',
                      color: AppColor.primaryBlue,
                    ),
                  ),
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
                        textStyleYear: const TextStyle(fontSize: 18, color: AppColor.primary),
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
                          'start_date' : state.startDate,
                          'end_date' : date,
                          'currentPage' : 0,
                        });
                        state.pageController!.jumpToPage(0);
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
/*
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
                        state.pageController!.jumpToPage(0);
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
                          state.pageController!.jumpToPage(0);
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
 */