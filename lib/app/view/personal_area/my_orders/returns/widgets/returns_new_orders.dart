import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/albaran_returns_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters_returns_new.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_new_orders_provider.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_albaran_details.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_cart.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ReturnsNewOrdersScreen extends StatelessWidget {
  const ReturnsNewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ReturnsNewOrdersProvider(getIt.get<ContratsRepository>(),context),
        child: Consumer<ReturnsNewOrdersProvider>(
            builder: (context2, provider, child){

              try{
                provider.contextProvider = context2;
              }catch(_){}

              return provider.typeView == 1 ?
              const ReturnsCart() :
              Scaffold(
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
                              const Text('Nuevo pedido de devolución', style: AppTextStyle.h2Style),
                              const UserName(),
                              spacerS,spacerS,
                              MyIconButton(
                                onPressed: () {
                                  myFiltersReturnsNew(context: context,filterReturns: provider.filter).then((filter) {
                                    if (filter != null) {
                                      provider.filterReturnsHttp(filterWidget: filter);
                                    }
                                  });
                                },
                                text: provider.filter.quantityFilter().isNotEmpty ? 'Modificar filtros' : 'Aplicar filtros',
                                icon: Image.asset( 'assets/icons/Filtro.png', scale: 2,),
                                variant: MyButtonVariant.outlinedBold,
                              ),
                              if(provider.carts != null && provider.carts!.items != null && provider.carts!.items!.isNotEmpty)...[
                                spacerS,spacerS,
                                MyButton(
                                  onPressed: () {
                                    provider.initialData2();
                                    provider.typeView = 1;
                                  },
                                  text: 'Carrito del pedido  ',
                                  width: double.infinity,
                                  disabled: false,
                                  childCenter: SizedBox(
                                    width: 35,
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          width: 25,height: 25,
                                          child: Image.asset('assets/icons/Bag.png',color: Colors.white,scale: 1,),
                                        ),
                                        Positioned(
                                          top: 2,right: 2,
                                          child: Text(provider.carts!.items!.length.toString(),style: AppTextStyle.boxCart.copyWith(
                                              fontSize: 15
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              spacerS,spacerS,
                              filterAplicados(provider: provider),
                              if(provider.loadData)...[
                                spacerS,spacerS,
                                const SizedBox(
                                    height: 400,
                                    child: MyShimmer.full(
                                      borderRadius: 10,
                                      margin: EdgeInsets.only(bottom: 20),
                                    )),
                              ]else...[
                                if(provider.listAlbaran.isEmpty)...[
                                  const NoExistWidget('Albaran',paddingTop: 40),
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

  Widget filterAplicados({required ReturnsNewOrdersProvider provider}){
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
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

  Widget tablaAlbaran({required ReturnsNewOrdersProvider provider}){

    double hSize = 350;
    if(provider.dataNewPedidosFiltrado!.rowCount <= 5){
      if(provider.dataNewPedidosFiltrado!.rowCount > 2){
        hSize = hSize + (20 * provider.dataNewPedidosFiltrado!.rowCount);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerS,
                  const Text('Albaranes',style: AppTextStyle.h3Style,),
                  Text('${provider.dataNewPedidosFiltrado!.rowCount} Total'),
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
              child: provider.dataNewPedidosFiltrado!.rowCount == 0 ? Container() : PaginatedDataTable2(
                wrapInCard: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                empty: const NoResultTable(),
                minWidth: 1100,
                rowsPerPage: provider.dataNewPedidosFiltrado!.rowCount <= 10 ? provider.dataNewPedidosFiltrado!.rowCount : 10,
                columns: const [
                  DataColumn2(
                    fixedWidth: 70,
                    label: Text('CÓDIGO',textAlign: TextAlign.center,),
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('AÑO',textAlign: TextAlign.center,),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('ALBARÁN',textAlign: TextAlign.center,),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('CLIENTE',textAlign: TextAlign.center,),
                    fixedWidth: 120,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('FECHA',textAlign: TextAlign.center,),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('HORA',textAlign: TextAlign.left,),
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                ],
                source: provider.dataNewPedidosFiltrado!,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class MyDataReturnsNew extends DataTableSource {
  final List<AlbaranReturnsModel> data;
  final BuildContext context;
  final BuildContext contextProvider;

  MyDataReturnsNew({required this.data, required this.context, required this.contextProvider});

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(data[index].codigoAlbaran.toString(),textAlign: TextAlign.center,),),
        DataCell(Text(data[index].ejercicio.toString(),textAlign: TextAlign.center,)),
        DataCell(Text(data[index].albaran ?? '',textAlign: TextAlign.center,)),
        DataCell(Text(data[index].cliente ?? '',textAlign: TextAlign.center,)),
        DataCell(Text(data[index].fechaDocumento == null ? '' : DateFormat.yMd('es').format(DateTime.parse(data[index].fechaDocumento!)),textAlign: TextAlign.center,)),
        DataCell(
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data[index].horaDocumento == null ? '' : DateFormat.Hms('en').format(DateTime.parse('2023-11-06 ${data[index].horaDocumento!}')),textAlign: TextAlign.center,),
              spacerXs,
              Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (BuildContext context) => ReturnsAlbaranDetails(
                            albaranReturnsModel: data[index],
                            contextProvider: contextProvider,
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