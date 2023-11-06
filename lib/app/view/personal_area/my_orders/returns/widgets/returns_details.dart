import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_details_provider.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/returns_widget.dart';
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
              return Scaffold(
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
                              Text('Código de pedido de devolución', style: AppTextStyle.h12Style.copyWith(
                                fontWeight: FontWeight.normal,
                              )),
                              Text(codReturns, style: AppTextStyle.h12Style.copyWith(
                                fontSize: 24,
                              )),
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
                                  merchandiseReturns(provider: provider),
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
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInput(
              key: const Key("Código devolución"),
              label: "Código devolución",
              initialValue: provider.returnsModel!.codigoDevolucion!.toString(),
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Nº pedido"),
              label: "Nº pedido",
              initialValue: provider.returnsModel!.numeroDevolucion ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha solicitud"),
              label: "Fecha solicitud",
              initialValue: provider.returnsModel!.fechaSolicitud ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha cierre"),
              label: "Fecha cierre",
              initialValue: provider.returnsModel!.fechaCierre ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Nombre cliente"),
              label: "Nombre cliente",
              initialValue: provider.returnsModel!.nombreClienteRecogida ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Código cliente"),
              label: "Código cliente",
              initialValue: provider.returnsModel!.codigoClienteRecogida!.toString(),
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Recoger en"),
              label: "Recoger en",
              initialValue: provider.returnsModel!.recogerEn ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Almacen gestión"),
              label: "Almacen gestión",
              initialValue: provider.returnsModel!.almacenGestion ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Dirección"),
              label: "Dirección",
              initialValue: provider.returnsModel!.direccionRecogida ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Notas"),
              label: "Notas",
              initialValue: provider.returnsModel!.notasRecogida ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            SizedBox(
              width: double.infinity,
              child: StatusLabelReturnsWidget(status: provider.returnsModel!.estado ?? ''),
            ),
          ],
        ),
      ),
    );
  }

  Widget merchandiseReturns ({required ReturnsDetailsProvider provider}){

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