// ignore_for_file: use_build_context_synchronously

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/albaran_product_model.dart';
import 'package:vemare/app/domain/model/albaran_returns_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dialig_add_returns/my_dialog_add_returns.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_detils_albaran_provider.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_new_orders_provider.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ReturnsAlbaranDetails extends StatelessWidget {
  const ReturnsAlbaranDetails({super.key, required this.albaranReturnsModel, required this.contextProvider});

  final AlbaranReturnsModel albaranReturnsModel;
  final BuildContext contextProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ReturnsDetilsAlbaranProvider(getIt.get<ContratsRepository>(),context,albaranReturnsModel),
        child: Consumer<ReturnsDetilsAlbaranProvider>(
            builder: (context2, provider, child){

              try{
                provider.contextProvider = context2;
              }catch(_){}


              String title = 'N° de albarán ';
              if(provider.listProducts.isNotEmpty){
                title = 'N° de albarán ${provider.listProducts[0].albaran}';
              }

              return Scaffold(
                body: MyBody(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyBackButton(),
                              Text(title, style: AppTextStyle.h2Style),
                              Text(albaranReturnsModel.cliente ?? '', style: AppTextStyle.checkStyle),
                              spacerS,spacerS,
                              if(provider.loadData)...[
                                spacerS,spacerS,
                                const SizedBox(
                                    height: 400,
                                    child: MyShimmer.full(
                                      borderRadius: 10,
                                      margin: EdgeInsets.only(bottom: 20),
                                    )),
                              ]else...[
                                if(provider.listProducts.isEmpty)...[
                                  const NoExistWidget('Productos en este Albarán',paddingTop: 40),
                                  spacerM,spacerM,
                                ]else...[
                                  spacerS,spacerS,
                                  tablaAlbaran(provider: provider),
                                ],
                              ],
                            ],
                          ),
                        ),
                        spacerM,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: MyButton(
                            isLoading: provider.sendCart,
                            onPressed: () async {
                              List<AlbaranProductModel> listProducts = [];
                              for (var product in provider.listProducts) {
                                if(provider.checkData[product.referencia]!){
                                  listProducts.add(product);
                                }
                              }
                              List<AlbaranProductModel>? listProductsAlbaranProductModel = await myDialogAddReturns(context: context,listProducts: listProducts);
                              if(listProductsAlbaranProductModel != null){
                                bool res = await provider.addProductCart(newList: listProductsAlbaranProductModel);
                                if(res){
                                  Provider.of<ReturnsNewOrdersProvider>(contextProvider,listen: false).typeView = 1;
                                  Provider.of<ReturnsNewOrdersProvider>(contextProvider,listen: false).initialData2();
                                  Navigator.of(context).pop();
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('No se pudo agregar el producto')));
                                }
                              }
                            },
                            text: 'Añadir  ',
                            width: double.infinity,
                            disabled: provider.checkAccepted,
                            childCenter: SizedBox(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/icons/mas.png',color: Colors.white,scale: 1,),
                            ),
                          ),
                        ),
                        spacerS,spacerS,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: MyIconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            text: 'Cerrar albarán',
                            variant: MyButtonVariant.outlinedBold,
                            icon: Container(),
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

  Widget tablaAlbaran({required ReturnsDetilsAlbaranProvider provider}){

    double hSize = 350;
    if(provider.dataProductAlbaranFiltrado!.rowCount <= 5){
      if(provider.dataProductAlbaranFiltrado!.rowCount > 2){
        hSize = hSize + (20 * provider.dataProductAlbaranFiltrado!.rowCount);
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerS,
                  const Text('Albaranes',style: AppTextStyle.h3Style,),
                  Text('${provider.dataProductAlbaranFiltrado!.rowCount} Total'),
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
            Expanded(
              child: provider.dataProductAlbaranFiltrado!.rowCount == 0 ? Container() : PaginatedDataTable2(
                wrapInCard: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                empty: const NoResultTable(),
                minWidth: 700,
                rowsPerPage: provider.dataProductAlbaranFiltrado!.rowCount <= 10 ? provider.dataProductAlbaranFiltrado!.rowCount : 10,
                columns: const [
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text('REFERENCIA',textAlign: TextAlign.center,),
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('DESCRIPCIÓN',textAlign: TextAlign.center,),
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('CANTIDAD',textAlign: TextAlign.center,),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('ALBARÁN',textAlign: TextAlign.center,),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                ],
                source: provider.dataProductAlbaranFiltrado!,
              ),
            ),
          ],
        ),
      ),
    );
  }

}


class MyDataReturnsProductsAlbaran extends DataTableSource {
  final List<AlbaranProductModel> data;
  final BuildContext? context;

  MyDataReturnsProductsAlbaran({required this.data, required this.context});

  @override
  DataRow? getRow(int index) {
    ReturnsDetilsAlbaranProvider provider = Provider.of<ReturnsDetilsAlbaranProvider>(context!);
    return DataRow(
      cells: [
        DataCell(
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: provider.checkData[data[index].referencia],
                onChanged: (value){
                  provider.updateMapCheck(key: data[index].referencia!);
                },
              ),
              spacerXs,
              Expanded(
                child: Text(data[index].referencia ?? '',textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
        DataCell(Text(data[index].descripcion ?? '',textAlign: TextAlign.center,)),
        DataCell(Text(data[index].cantidad.toString(),textAlign: TextAlign.center,)),
        DataCell(Text(data[index].albaran ?? '',textAlign: TextAlign.center,)),
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