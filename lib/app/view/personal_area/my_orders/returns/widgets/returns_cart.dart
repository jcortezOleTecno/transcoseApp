import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/domain/model/returns_cart_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_new_orders_provider.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ReturnsCart extends StatelessWidget {
  const ReturnsCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ReturnsNewOrdersProvider provider = Provider.of<ReturnsNewOrdersProvider>(context);

    return WillPopScope(
      onWillPop:() async {
        provider.typeView = 0;
        return false;
      },
      child: Scaffold(
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
                      MyBackButton(onTap: (){
                        provider.typeView = 0;
                      }),
                      const Text('Detalle de nuevo pedido de devolución', style: AppTextStyle.h2Style),
                      Text('Lea detalladamente los detalles de su pedido de devolución y confirme la solicitud.', style: AppTextStyle.h2Style.copyWith(
                       fontSize: 16,fontWeight: FontWeight.normal
                      )),
                      if(provider.loadData)...[
                        spacerS,spacerS,
                        const SizedBox(
                            height: 400,
                            child: MyShimmer.full(
                              borderRadius: 10,
                              margin: EdgeInsets.only(bottom: 20),
                            )),
                      ]else...[
                        if(provider.carts!.items!.isEmpty)...[
                          const NoExistWidget('',paddingTop: 40,textLlong: 'No existen productos en el carrito'),
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
      ),
    );
  }

  Widget tablaAlbaran({required ReturnsNewOrdersProvider provider}){

    double hSize = 350;
    if(provider.dataProductsCarts!.rowCount <= 5){
      if(provider.dataProductsCarts!.rowCount > 2){
        hSize = hSize + (20 * provider.dataProductsCarts!.rowCount);
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
                  const Text('Mercancías del pedido de devolución',style: AppTextStyle.h3Style,),
                  Text('${provider.dataProductsCarts!.rowCount} Total'),
                ],
              ),
            ),
            spacerS,
            Expanded(
              child: provider.dataProductsCarts!.rowCount == 0 ? Container() : PaginatedDataTable2(
                wrapInCard: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                empty: const NoResultTable(),
                minWidth: 500,
                rowsPerPage: provider.dataProductsCarts!.rowCount <= 10 ? provider.dataProductsCarts!.rowCount : 10,
                columns: const [
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text('ALBARÁN',textAlign: TextAlign.center,),
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('REFERENCIA',textAlign: TextAlign.center,),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('DESCRIPCIÓN',textAlign: TextAlign.center,),
                    fixedWidth: 150,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('CANTIDAD',textAlign: TextAlign.center,),
                    fixedWidth: 80,
                    // size: ColumnSize.L,
                  ),
                ],
                source: provider.dataProductsCarts!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDataReturnsCart extends DataTableSource {
  final List<ItemsProductCartReturns> data;

  MyDataReturnsCart({required this.data});

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(data[index].albaran ?? '',textAlign: TextAlign.center,),),
        DataCell(Text(data[index].referencia ?? '',textAlign: TextAlign.center,)),
        DataCell(Text(data[index].descripcion ?? '',textAlign: TextAlign.center,)),
        DataCell(Text(data[index].cantidad ?? '0',textAlign: TextAlign.center,)),
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