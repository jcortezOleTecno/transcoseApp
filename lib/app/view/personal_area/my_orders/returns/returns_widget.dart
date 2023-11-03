import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters_returns.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_provider.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ReturnsScreen extends StatelessWidget {
  const ReturnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ReturnsProvider(getIt.get<ContratsRepository>()),
        child: Consumer<ReturnsProvider>(
            builder: (context2, provider, child){
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacerS,
                          const Text('Mis pedidos de devolución', style: AppTextStyle.h2Style),
                          const UserName(),
                          spacerS,
                          MyButton(
                            onPressed: () {

                            },
                            text: 'Nuevo pedido de devolución  ',
                            width: double.infinity,
                            disabled: false,
                            childCenter: const Icon(Icons.add_circle_outline_outlined,color: Colors.white,size: 20),
                          ),
                          spacerS,spacerS,
                          MyIconButton(
                            onPressed: () {
                              myFiltersReturns(context,filterReturns: provider.filter,
                              listEstados: provider.listStatusReturns,listSituacion: provider.listSituaReturns).then((filter) {
                                if (filter != null) {
                                  provider.filterReturnsHttp(filterWidget: filter);
                                }
                              });
                            },
                            text: provider.filter.quantityFilter().isNotEmpty ? 'Modificar filtros' : 'Aplicar filtros',
                            icon: Image.asset( 'assets/icons/Filtro.png', scale: 2,),
                            variant: MyButtonVariant.outlinedBold,
                          ),
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
                            if(provider.listReturns.isEmpty)...[
                              const NoExistWidget('pedidos',paddingTop: 40),
                              spacerM,spacerM,
                            ]else...[
                              spacerS,spacerS,
                              tablaPedidos(provider: provider),
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

  Widget tablaPedidos({required ReturnsProvider provider}){

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
            ],
          ),
        ),
      );
    }

}

class MyDataReturns extends DataTableSource {
  final List<ReturnsModel> data;

  MyDataReturns({required this.data});

  @override
  DataRow? getRow(int index) {
    return DataRow(
        cells: [
          DataCell(Text(data[index].codigoDevolucion.toString(),textAlign: TextAlign.center,),),
          DataCell(Text(data[index].numeroDevolucion ?? '',textAlign: TextAlign.center,)),
          DataCell(Text(DateFormat.yMd('es').format(DateTime.parse(data[index].fechaSolicitud!)),textAlign: TextAlign.center,)),
          DataCell(Text(DateFormat.yMd('es').format(DateTime.parse(data[index].fechaCierre!)),textAlign: TextAlign.center,)),
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
      ),
    );
  }
}