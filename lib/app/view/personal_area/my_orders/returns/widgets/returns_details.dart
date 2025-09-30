import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/domain/utils/date_formatter.dart';
import 'package:vemare/app/domain/utils/status_returns.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/progress_status/progress_status_widget.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_details_provider.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ReturnsDetails extends StatelessWidget {
  const ReturnsDetails({super.key, required this.codReturns});

  final String codReturns;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ReturnsDetailsProvider(getIt.get<ContratsRepository>(), codReturns: codReturns),
        child: Consumer<ReturnsDetailsProvider>(
            builder: (context2, provider, child){

              String numberOrder = '';
              String statusOrder = 'Anulada';
              if(provider.returnsModel != null && provider.returnsModel!.numeroDevolucion != null){
                numberOrder = provider.returnsModel!.codigoDevolucion.toString();
                statusOrder = provider.returnsModel!.estado.toString();
              }
              Size size = MediaQuery.of(context).size;

              int currentStep = statusTypeLine[statusOrder] ?? 0;

              return Scaffold(
                backgroundColor: AppColor.white,
                body: MyBody(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyBackButton(),
                              if(!provider.loadData)...[
                                Text('Código de pedido de devolución', style: AppTextStyle.h12Style.copyWith(
                                  fontWeight: FontWeight.normal,
                                )),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Text(numberOrder, style: AppTextStyle.h12Style.copyWith(
                                        fontSize: 24,
                                      )),
                                      SizedBox(width: 15,),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: size.height * 0.01,horizontal: size.width * 0.02),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: statusColorBg[statusOrder],
                                        ),
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.circle,color: statusColorText[statusOrder],size: size.height * 0.01),
                                                SizedBox(width: size.width * 0.01,),
                                                Text(statusTraduccion[statusOrder]!,style: AppTextStyle.nunito18.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: statusColorText[statusOrder])),
                                              ],
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                              spacerS,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                                child: ProgressTracker(
                                  currentStep: currentStep,
                                  labels: ['Solicitada', 'En gestión', currentStep < 3 ? 'Finalizada' : statusTraduccion[statusOrder]!],
                                ),
                              ),
                              spacerS,
                              if(provider.loadData)...[
                                spacerS,spacerS,spacerS,
                                const SizedBox(
                                    height: 400,
                                    child: MyShimmer.full(
                                      borderRadius: 10,
                                      margin: EdgeInsets.only(bottom: 20),
                                    )),
                              ]else...[
                                if(provider.returnsModel == null)...[
                                  spacerS,
                                  const NoExistWidget('' ,textLlong: 'No existe esta devolución',paddingTop: 40),
                                  spacerM,spacerM,
                                ]else...[
                                  returnsDetailsData(provider: provider),
                                  spacerS,
                                  merchandiseReturns(provider: provider,context: context),
                                ],
                              ],
                            ],
                          ),
                        ),
                        spacerM,
                        const Footer()
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }

  Widget returnsDetailsData({required ReturnsDetailsProvider provider}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.whiteF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MyInput(
          //   key: const Key("Código devolución"),
          //   label: "Código devolución",
          //   initialValue: provider.returnsModel!.codigoDevolucion!.toString(),
          //   readOnly: true,
          //   variant: MyInputVariant.backgroundBlue,
          // ),
          MyInput(
            key: const Key("Nº pedido"),
            label: "Nº pedido",
            initialValue: provider.returnsModel!.numeroDevolucion ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          MyInput(
            key: const Key("Fecha solicitud"),
            label: "Fecha solicitud",
            initialValue: myFormatDate(provider.returnsModel!.fechaSolicitud ?? ''),
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          MyInput(
            key: const Key("Fecha cierre"),
            label: "Fecha cierre",
            initialValue: myFormatDate(provider.returnsModel!.fechaCierre ?? ''),
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          // MyInput(
          //   key: const Key("Nombre cliente"),
          //   label: "Nombre cliente",
          //   initialValue: provider.returnsModel!.nombreClienteRecogida ?? '',
          //   readOnly: true,
          //   variant: MyInputVariant.backgroundBlue,
          //   styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          // ),
          // MyInput(
          //   key: const Key("Código cliente"),
          //   label: "Código cliente",
          //   initialValue: provider.returnsModel!.codigoClienteRecogida!.toString(),
          //   readOnly: true,
          //   variant: MyInputVariant.backgroundBlue,
          //   styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          // ),
          MyInput(
            key: const Key("Recoger en"),
            label: "Recoger en",
            initialValue: provider.returnsModel!.recogerEn ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          MyInput(
            key: const Key("Almacen gestión"),
            label: "Almacen gestión",
            initialValue: provider.returnsModel!.almacenGestion ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          MyInput(
            key: const Key("Dirección"),
            label: "Dirección",
            initialValue: provider.returnsModel!.direccionRecogida ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          MyInput(
            key: const Key("Notas"),
            label: "Notas",
            initialValue: provider.returnsModel!.notasRecogida ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.inputLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   child: StatusLabelReturnsWidget(status: provider.returnsModel!.estado ?? ''),
          // ),
        ],
      ),
    );
  }

  Widget merchandiseReturns ({required ReturnsDetailsProvider provider, required BuildContext context}){
    Size size = MediaQuery.of(context).size;
    List<Widget> listW = [];
    Widget line = Container(
      width: size.width, height: 1,
      color: AppColor.blue100,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.0),
    );
    for (var element in provider.listReturnsItems) {
      listW.add(cardItems(item: element,context: context,listLineas: provider.listReturnsItems));
      listW.add(spacerS);
      listW.add(line);
      listW.add(spacerS);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.whiteF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                spacerS,
                Text('Mercancías del pedido de devolución',style: AppTextStyle.h3Style.copyWith(
                    fontWeight: FontWeight.bold,color: AppColor.neutral,fontSize: 24
                ),),
                spacerXs,
                Text('${provider.dataTable!.rowCount} Total',style: AppTextStyle.h14StyleNeu40.copyWith(
                    fontSize: 18
                ),),
              ],
            ),
          ),
          spacerS,
          line,
          spacerS,
          ...listW
        ],
      ),
    );
  }

  Widget cardItems({required ReturnsItemsModel item, required BuildContext context, required List<ReturnsItemsModel> listLineas}){
    Size size = MediaQuery.of(context).size;

    TextStyle style = AppTextStyle.h12Style.copyWith(
        color: AppColor.neutral40,fontSize: 16
    );
    TextStyle style2 = AppTextStyle.h12Style.copyWith(
        color: AppColor.neutral,fontSize: 18
    );
    bool isCasco = false;
    String refSt = item.referencia!.split(' - ')[0];
    String descSt = item.descripcion ?? '';
    if(refSt.contains('CV') || refSt.contains('CN')){
      descSt = 'CASCO';
      isCasco = true;
      refSt = refSt.replaceAll('CV', '').replaceAll('CN', '');
    }

    bool existCasco = false;
    if(isCasco){
      for (var action in listLineas) {
        if(action.referencia!.split(' - ')[0] == refSt.replaceAll('CN', '').replaceAll('CV', '')){
          existCasco = true;
        }
      }
      if(!existCasco){ isCasco = false; }
    }

    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!isCasco)...[
            Text('REFERENCIA',style: style),
            spacerXs,
            Text(refSt,style: style2),
            spacerS,
            Text('NÚMERO DE ALBARÁN',style: style),
            spacerXs,
            Text(item.referencia!.split(' - ')[1].trim(),style: style2),
            spacerS,
          ],
          Text('CANTIDAD',style: style),
          spacerXs,
          Text(item.cantidad.toString(),style: style2),
          spacerS,
          Text('DESCRIPCIÓN',style: style),
          spacerXs,
          Text(descSt,style: style2),
          spacerS,
          Text('MOTIVO DEVOLUCION',style: style),
          spacerXs,
          Text(item.motivoDevolucion ?? '',style: style2),
        ],
      ),
    );
  }

  Widget merchandiseReturnsOld ({required ReturnsDetailsProvider provider}){

    double hSize = 350;
    if(provider.dataTable!.rowCount <= 5){
      if(provider.dataTable!.rowCount > 2){
        hSize = hSize + (20 * provider.dataTable!.rowCount);
      }
    }else{
      hSize = 500;
    }

    return SizedBox(
      height: hSize,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerS,
                  const Text('Mercancías del pedido de devolución',style: AppTextStyle.h3Style,),
                  spacerXs,
                  Text('${provider.dataTable!.rowCount} Total',style: AppTextStyle.h14StyleNeu40,),
                ],
              ),
            ),
            spacerS,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MySearchInput(
                hintText: 'Buscar por palabras claves...',
                onChanged: provider.filtroReturns,
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
                minWidth: 1000,
                empty: const NoResultTable(),
                rowsPerPage: provider.dataTable!.rowCount <= 10 ? provider.dataTable!.rowCount : 10,
                columns: const [
                  DataColumn2(
                    label: Text('REFERENCIA',textAlign: TextAlign.center,),
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('CANTIDAD',textAlign: TextAlign.center,),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('DESCRIPCIÓN',textAlign: TextAlign.center,),
                    fixedWidth: 300,
                    // size: ColumnSize.L,
                  ),
                ],
                source: provider.dataTable!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDataReturnsMerchandise extends DataTableSource {
  final List<ReturnsItemsModel> data;

  MyDataReturnsMerchandise(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].referencia ?? "",textAlign: TextAlign.center,)),
      DataCell(Text(data[index].cantidad.toString(),textAlign: TextAlign.center,)),
      DataCell(Text(data[index].descripcion ?? "",textAlign: TextAlign.center,)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}