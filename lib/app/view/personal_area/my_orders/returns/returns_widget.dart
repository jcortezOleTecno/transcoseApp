import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/domain/utils/status_returns.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters_returns.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/progress_status/progress_status_widget.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_provider.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_details.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ReturnsScreen extends StatelessWidget {
  const ReturnsScreen({
    Key? key,
    required this.scrollBottomBarController
  }) : super(key: key);

  final ScrollController scrollBottomBarController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ReturnsProvider(getIt.get<ContratsRepository>(),context),
        child: Consumer<ReturnsProvider>(
            builder: (context2, provider, child){
              return SingleChildScrollView(
                controller: scrollBottomBarController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacerS,
                          //const Text('Mis pedidos de devolución', style: AppTextStyle.h2Style),
                          Text('Mis Devoluciones', style: AppTextStyle.nunito80024.copyWith(fontSize: 26)),
                          // const UserName(),
                          spacerS,
                          // MyButton(
                          //   onPressed: () async {
                          //     await Navigator.push(context, MaterialPageRoute(builder:
                          //         (BuildContext context) => const ReturnsNewOrdersScreen()));
                          //     provider.initialData();
                          //   },
                          //   text: 'Nuevo pedido de devolución  ',
                          //   width: double.infinity,
                          //   disabled: false,
                          //   childCenter: const Icon(Icons.add_circle_outline_outlined,color: Colors.white,size: 20),
                          // ),
                          // spacerS,spacerS,
                          MyIconButton(
                            onPressed: () {
                              myFiltersReturns(context,filterReturns: provider.filter,
                              listEstados: provider.listStatusReturns,listSituacion: provider.listSituaReturns).then((filter) {
                                if (filter != null) {
                                  provider.filterReturnsHttp(filterWidget: filter);
                                }else{
                                  provider.reset();
                                }
                              });
                            },
                            text: provider.filter.quantityFilter().isNotEmpty ? 'Modificar filtros' : 'Aplicar filtros',
                            icon: Image.asset( 'assets/icons/Filtro.png', scale: 2,),
                            variant: MyButtonVariant.outlinedBoldTransparent,
                          ),
                          spacerS,spacerS,
                          SizedBox(
                            width: double.infinity,
                            child: Text('Estados de la devolución', style: AppTextStyle.h2Style.copyWith(fontWeight: FontWeight.bold,fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          spacerS,spacerS,spacerS,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: ProgressTracker(
                              currentStep: 3,
                              labels: const ['Solicitada', 'En gestión', 'Finalizada'],
                            ),
                          ),
                          spacerS,spacerS,spacerS,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Text('Devoluciones ', style: AppTextStyle.h2Style.copyWith(fontSize: 26)),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10),
                                        child: const Text('|', style: AppTextStyle.nunito18),
                                      ),
                                      Text('${provider.dataPedidosFiltrado?.rowCount ?? 0} total', style: AppTextStyle.nunito18),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          spacerS,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: MySearchInput(
                              hintText: 'Buscar por palabras claves...',
                              onChanged: (value){
                                provider.filtroReturns(value);
                                provider.pageController!.jumpToPage(0);
                              },
                              fillColor: AppColor.whiteF,
                              borderSideColor: AppColor.blue100,

                            ),
                          ),
                          //filterAplicados(provider: provider),
                          if(provider.loadData)...[
                            spacerS,spacerS,
                            const SizedBox(
                              height: 400,
                              child: MyShimmer.full(
                                borderRadius: 10,
                                margin: EdgeInsets.only(bottom: 20),
                              )),
                          ]else...[
                            if(provider.listReturns.isEmpty)...[
                              const NoExistWidget('pedidos',paddingTop: 40),
                              spacerM,spacerM,
                            ]else...[
                              spacerS,
                              tablaPedidos(provider: provider,context: context),
                            ],
                          ],
                        ],
                      ),
                    ),
                    spacerM,
                    const Footer()
                  ],
                ),
              );
            }
        )
    );
  }

  Widget filterAplicados({required ReturnsProvider provider}){
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filtros aplicados (${provider.filter.quantityFilter().length})',),
            if(provider.filter.quantityFilter().isNotEmpty)...[
              for(int x = 0; x < provider.filter.quantityFilter().length; x++)
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text('${provider.filter.quantityFilter()[x]} :   ',style: AppTextStyle.checkStyle.copyWith(
                          fontWeight: FontWeight.bold,color: AppColor.neutral
                      )),
                      Expanded(
                        child: Text(provider.getDataFilter(value: provider.filter.quantityFilter()[x]),textAlign: TextAlign.left),
                      ),
                      InkWell(child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text('X',style: AppTextStyle.checkStyle.copyWith(
                            fontWeight: FontWeight.bold,color: AppColor.neutral
                          )),
                        ),),
                      onTap: (){
                        provider.setValueDataFilter(value: provider.filter.quantityFilter()[x]);
                      },
                      )
                    ],
                  ),
                )
            ],
          ],
        ),
      ),
    );
  }

  Widget tablaPedidos({required ReturnsProvider provider, required BuildContext context}){

    double hSize = 350;
    if(provider.dataPedidosFiltrado!.rowCount <= 5){
      if(provider.dataPedidosFiltrado!.rowCount > 2){
        hSize = hSize + (20 * provider.dataPedidosFiltrado!.rowCount);
      }
    }else{
      hSize = 500;
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spacerS,
          sectionTablaPedidos(context: context,provider: provider),
          spacerS,
        ],
      ),
    );
  }

  Widget sectionTablaPedidos({required BuildContext context, required ReturnsProvider provider}){
    List<Widget> listW = [];
    int itemsForPage = 6;
    int totalPAge = (provider.listReturns.length / itemsForPage).ceil();

    Size size = MediaQuery.of(context).size;

    final startIndex = provider.currentPage * itemsForPage;
    int endIndex = 0;
    List<ReturnsModel> pageItems = [];
    List<Widget> items = [];

    endIndex = (startIndex + itemsForPage).clamp(0, provider.listReturns.length);
    pageItems = provider.listReturns.sublist(startIndex, endIndex);

    for(int x = 0; x < totalPAge; x++){ items.add(
        Container(
          width: 30, height: 30,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ((provider.currentPage + 1) == (x + 1)) ? AppColor.primary : AppColor.white,
              border: Border.all(color: ((provider.currentPage + 1) == (x + 1)) ? AppColor.primary : AppColor.blue300)
          ),
          child: Center(
            child: Text('${x + 1}',
                style: AppTextStyle.h1Style.copyWith(
                    fontSize: 16,color: ((provider.currentPage + 1) == (x + 1)) ? AppColor.white : AppColor.blue300
                )),
          ),
        )
    ); }

    for (var albaranElemt in pageItems) {
      listW.add(
          cardPedidos(
            provider: provider,
            returnsModel: albaranElemt,
            context: context,
          )
      );
      listW.add(const SizedBox(height: 10,));
    }

    double wiMin = 24 * (double.parse (((provider.listReturns.isNotEmpty ? (provider.listReturns.length / itemsForPage).ceil() : provider.listReturns.length / itemsForPage).ceil()).toString()) + 1);
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
                      color: ((provider.currentPage > 0) ? AppColor.primary : AppColor.neutral40)),
                  onTap: (){
                    if(provider.currentPage > 0){
                      provider.currentPage = provider.currentPage - 1;
                      provider.pageController!.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                    }
                  },
                ),
                spacerXs,
                SizedBox(
                  width: wiMin,
                  height: 30,
                  child: PageView(
                    controller: provider.pageController,
                    scrollDirection: Axis.horizontal,
                    children: items,
                  ),
                ),
                spacerXs,
                InkWell(
                  child: Icon(Icons.arrow_forward_ios,
                      size: 20,
                      color: ((provider.currentPage + 1) <= totalPAge) ? AppColor.primary : AppColor.neutral40),
                  onTap: (){
                    log('state.currentPage + 1 = ${provider.currentPage + 1}');
                    log('totalPAge = $totalPAge');

                    if((provider.currentPage + 1) < totalPAge){
                      provider.pageController!.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                      provider.currentPage = provider.currentPage + 1;
                    }
                  },
                ),
              ],
            ),
          ),
        )
    );

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
                  ' de ${provider.listReturns.length} resultados',
                  style: AppTextStyle.nunito18.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
        )
    );

    return Column(
      children: listW,
    );
  }

  Widget cardPedidos({required ReturnsModel returnsModel, required BuildContext context, required ReturnsProvider provider }){

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.whiteF,
      ),
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: textCardAlbaran(context: context,titlte: 'Nº DE PEDIDO',subTitle: returnsModel.numeroDevolucion ?? ''),
                ),
                Expanded(
                  child: textCardAlbaran(context: context,titlte: 'FECHA SOLICITUD',subTitle: (DateFormat.yMd('es').format(DateTime.parse(returnsModel.fechaSolicitud!)))),
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
                  child: textCardAlbaran(context: context,titlte: 'FECHA DE CIERRE',subTitle: returnsModel.fechaCierre == null ? '' : (DateFormat.yMd('es').format(DateTime.parse(returnsModel.fechaCierre!))).toString()),
                ),
                Expanded(
                  child: textCardAlbaran(context: context,titlte: 'ALMACÉN',subTitle: returnsModel.almacenGestion ?? ''),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02,),SizedBox(
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: textCardAlbaran(context: context,titlte: 'SITUACIÓN',subTitle: returnsModel.estado ?? 'Anulada',isStatus: true,provider: provider,cod: returnsModel.codigoDevolucion.toString()),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.005,),
        ],
      ),
    );
  }

  Widget textCardAlbaran({required String titlte, required String subTitle,required BuildContext context, bool isStatus = false,ReturnsProvider? provider,String cod = ''}){
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: size.width,
            child: Text(titlte,style:
            AppTextStyle.nunitoSans70014.copyWith(fontSize: 14),)
        ),
        SizedBox(height: size.height * 0.01,),
        if(!isStatus)...[
          SizedBox(
              width: size.width,
              child: Text(subTitle,style:
              AppTextStyle.nunitoSans70014.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.black),)
          ),
        ]else...[
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01,horizontal: size.width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: statusColorBg[subTitle] ?? AppColor.statusReturn2,
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle,color: statusColorText[subTitle] ?? AppColor.statusReturnText2,size: size.height * 0.01),
                          SizedBox(width: size.width * 0.01,),
                          Text(statusTraduccion[subTitle] ?? 'En gestión',style: AppTextStyle.nunito18.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: statusColorText[subTitle] ?? AppColor.statusReturnText2)),
                        ],
                      ),

                    ],
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (BuildContext context) => ReturnsDetails(
                      codReturns: cod,
                    )));
                  },
                  child: Image.asset(
                    'assets/icons/arrow_next.png',
                    scale: 2,color: AppColor.primary,
                  ),
                ),
                SizedBox(width: size.width * 0.01,),
              ],
            ),
          ),
        ]
      ],
    );
  }

  Widget tablaPedidosOld({required ReturnsProvider provider}){

    double hSize = 350;
    if(provider.dataPedidosFiltrado!.rowCount <= 5){
      if(provider.dataPedidosFiltrado!.rowCount > 2){
        hSize = hSize + (20 * provider.dataPedidosFiltrado!.rowCount);
      }
    }else{
      hSize = 500;
    }

    return SizedBox(
      height: hSize,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerS,
                  const Text('Devoluiciones',style: AppTextStyle.h3Style,),
                  Text('${provider.dataPedidosFiltrado!.rowCount} Total'),
                ],
              ),
            ),
            spacerS,
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15),
              child: MySearchInput(
                hintText: 'Buscar por palabras claves...',
                onChanged: provider.filtroReturns,
                fillColor: AppColor.blue50,
                borderSideColor: AppColor.blue100,
              ),
            ),
            spacerS,
            /*
              Expanded(
                child: provider.dataPedidosFiltrado!.rowCount == 0 ? Container() : PaginatedDataTable2(
                  wrapInCard: false,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  empty: const NoResultTable(),
                  minWidth: 1300,
                  rowsPerPage: provider.dataPedidosFiltrado!.rowCount <= 10 ? provider.dataPedidosFiltrado!.rowCount : 10,
                  columns: const [
                    DataColumn2(
                      fixedWidth: 70,
                      label: Text('CÓDIGO'),
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('N° DE PEDIDO'),
                      fixedWidth: 120,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('FECHA SOLICITUD'),
                      fixedWidth: 120,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('FECHA CIERRA'),
                      fixedWidth: 120,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('NOMBRE CLIENTE'),
                      fixedWidth: 120,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('CÓDIGO CLIENTE'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('RECOGER EN'),
                      fixedWidth: 200,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('ALMACÉN'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('ESTADO'),
                      fixedWidth: 200,
                      // size: ColumnSize.L,
                    ),
                  ],
                  source: provider.dataPedidosFiltrado!,
                ),
              ),

               */
          ],
        ),
      ),
    );
  }

}

class MyDataReturns extends DataTableSource {
  final List<ReturnsModel> data;
  final BuildContext context;

  MyDataReturns({required this.data, required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(
        cells: [
          DataCell(Text(data[index].codigoDevolucion.toString(),textAlign: TextAlign.center,),),
          DataCell(Text(data[index].numeroDevolucion ?? '',textAlign: TextAlign.center,)),
          DataCell(Text(data[index].fechaSolicitud == null ? '' : DateFormat.yMd('es').format(DateTime.parse(data[index].fechaSolicitud!)),textAlign: TextAlign.center,)),
          DataCell(Text(data[index].fechaCierre == null ? '' : DateFormat.yMd('es').format(DateTime.parse(data[index].fechaCierre!)),textAlign: TextAlign.center,)),
          DataCell(Text(data[index].nombreClienteRecogida ?? '',textAlign: TextAlign.center,)),
          DataCell(Text(data[index].codigoClienteRecogida.toString(),textAlign: TextAlign.center,)),
          DataCell(Text(data[index].recogerEn ?? '',textAlign: TextAlign.center,)),
          DataCell(Text(data[index].almacenGestion ?? '',textAlign: TextAlign.center,)),
          DataCell(
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatusLabelReturnsWidget(status: data[index].estado ?? ''),
                spacerXs,
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context) => ReturnsDetails(
                              codReturns: data[index].codigoDevolucion.toString(),
                            )));
                      },
                      icon:
                      Image.asset('assets/icons/arrow_next.png', scale: 2)),
                )
              ],
            ),
          ),
        ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

class StatusLabelReturnsWidget extends StatelessWidget {
  const StatusLabelReturnsWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {

    Color color = AppColor.success200;
    Color colorText = AppColor.success500;
    if(status == 'Anulada'){ color = AppColor.neutral20; colorText = AppColor.neutral40; }
    if(status == 'Pendiente'){ color = AppColor.error200; colorText = AppColor.error300; }
    if(status == 'En Gestión'){ color = AppColor.warning200; colorText = AppColor.warning300; }
    if(status == 'Cerrada'){ color = AppColor.success200; colorText = AppColor.success500; }
    if(status == 'Fallida'){ color = AppColor.error300; colorText = AppColor.error500; }


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Text('• $status',
        style: AppTextStyle.inputLabelStyle.copyWith(color: colorText),
        textAlign: TextAlign.center,
      ),
    );
  }
}