import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_details/bloc/albaran_details_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_details/bloc/albaran_details_state.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class AlbaranDetailArg {
  final AlbaranISI albaran;
  final String title;

  AlbaranDetailArg({required this.albaran, required this.title});
}

class AlbaranDetailPage extends StatelessWidget {
  const AlbaranDetailPage._(this.title);

  static const route = '/albaran_detail';

  static Widget create(AlbaranDetailArg arg) {
    return BlocProvider(
      create: (context) => AlbaranDetailCubit(
        getIt.get<MyAccountRepository>(),
        arg.albaran,
      ),
      child: AlbaranDetailPage._(arg.title),
    );
  }

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral15,
      body: BlocBuilder<AlbaranDetailCubit, AlbaranDetailState>(
        builder: (context, state) {
          return MyBody(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Detalle de Pedido', style: AppTextStyle.nunito80024.copyWith(
                            fontWeight: FontWeight.bold,fontSize: 28
                        )),
                        //Text('Detalle de ${state.albaran!.albaran}', style: AppTextStyle.h3Style),
                        spacerXs,
                        UserName(
                          style: AppTextStyle.nunitoSans70014.copyWith(fontSize: 18,color: AppColor.neutral),
                        ),
                        spacerM,
                        tablaLineasALbaran(state: state),
                        cardAlbaranList(state: state),
                        //_AlbaranDetails(state),
                        spacerM,
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tablaLineasALbaran({required AlbaranDetailState state}){



    // int itemsForPage = 6;
    // int totalPAge = (state.albaran!.lineas.length / itemsForPage).ceil();
    // List<AlbaranISI> pageItems = [];
    // final startIndex = state.currentPage * itemsForPage;
    // int endIndex = 0;
    // pageItems = [];
    // List<int> items = [];

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          cardAlbaran(state: state),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.neutral15,
          ),
        ],
      ),
    );
  }

  Widget cardAlbaran({required  AlbaranDetailState state}) {
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
          Text('Detalle',style: AppTextStyle.nunitoSans70014.copyWith(fontSize: 22),),
          const SizedBox(height: 10,),
          MyInput(
            key: const Key("CLIENTE"),
            label: "Cliente",
            initialValue: state.albaran!.cliente,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          MyInput(
            key: const Key("CONTADOR"),
            label: "Contador",
            initialValue: state.albaran!.contador,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          MyInput(
            key: const Key("DOCUMENTO"),
            label: "Documento",
            initialValue: state.albaran!.documento,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          MyInput(
            key: const Key("EJERCICIO"),
            label: "Ejercicio",
            initialValue: state.albaran!.ejercicio,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          MyInput(
            key: const Key("TIPO"),
            label: "Tipo de Documento",
            initialValue: state.albaran!.typeDoc,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          MyInput(
            key: const Key("TOTAL"),
            label: "Total del importe",
            initialValue: myFormatMoney(double.parse(state.albaran!.total.toString())),
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
            styleText: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget cardAlbaranList({required  AlbaranDetailState state}) {

    List<Widget> listW = [];

    for (var detailAlbaran in state.albaran!.lineas) {

      listW.add(
          cardLineaAlbaran(linea: detailAlbaran,albaran: state.albaran!.albaran,listLineas: state.albaran!.lineas)
      );

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
          Text('Mercancías del pedido',style: AppTextStyle.h3Style.copyWith(fontWeight: FontWeight.bold,color: AppColor.neutral,fontSize: 24)),
          Text('${listW.length} Total',style: AppTextStyle.h14StyleNeu40.copyWith(fontSize: 18),),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.neutral15,
          ),
          const SizedBox(height: 10,),
          ...listW
        ],
      ),
    );
  }

  Widget cardLineaAlbaran({required LineasAlbaran linea, required String albaran, required List<LineasAlbaran> listLineas}) {

    TextStyle style = AppTextStyle.h12Style.copyWith(
        color: AppColor.neutral40,fontSize: 16
    );
    TextStyle style2 = AppTextStyle.h12Style.copyWith(
        color: AppColor.neutral,fontSize: 18
    );

    bool isCasco = false;
    if(linea.referencia.contains('CV') || linea.referencia.contains('CN')){
      isCasco = true;
    }
    bool existCasco = false;
    if(isCasco){
      for (var action in listLineas) {
        if(action.referencia == linea.referencia.replaceAll('CN', '').replaceAll('CV', '')){
          existCasco = true;
        }
      }
      if(!existCasco){ isCasco = false; }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.whiteF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!isCasco)...[
            Text('REFERENCIA',style: style),
            spacerXs,
            Text(linea.referencia.split('-')[0],style: style2),
            spacerS,
          ],
          Text('CANTIDAD',style: style),
          spacerXs,
          Text(linea.cant.toString(),style: style2),
          spacerS,
          Text('DESCRIPCIÓN',style: style),
          spacerXs,
          Text(linea.description,style: style2),
          spacerS,
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.neutral15,
          ),
        ],
      ),
    );
  }

  Widget tablaDetalts({required AlbaranDetailState state}){
    return Builder(builder: (context) {
      final DataTableSource data = _MyData(state.details);

      if(state.details.isEmpty) return Container();

      double hSize = 300;
      if(data.rowCount <= 5){
        if(data.rowCount > 2){
          hSize = hSize + (20 * data.rowCount);
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 15),
                child: Column(
                  children: [
                    spacerS,
                    const Text(
                      'Filas',
                      style: AppTextStyle.h3Style,
                    ),
                    Text('${state.details.length} Total'),
                    // spacerM,
                  ],
                ),
              ),
              Expanded(
                child: PaginatedDataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  wrapInCard: false,
                  minWidth: 1000,
                  empty: const NoResultTable(),
                  rowsPerPage: data.rowCount <= 10 ? data.rowCount : 10,
                  columns: const [
                    DataColumn2(
                      label: Text('CONTADOR'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('DOCUMENTO'),
                      fixedWidth: 100,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('LÍNEA'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('REFERENCIA'),
                      fixedWidth: 125,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('CANTIDAD'),
                      fixedWidth: 80,
                      // size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('DESCRIPCIÓN'),
                      fixedWidth: 200,
                      // size: ColumnSize.L,
                    ),
                  ],
                  source: data,
                ),
              ),
            ],
          ),
        ),
      );
    });



  }

}



/*
class _AlbaranDetails extends StatelessWidget {
  final AlbaranDetailState state;

  const _AlbaranDetails(this.state);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Detalle',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          MyInput(
            label: 'Cliente',
            initialValue: LocalDataRepository().user!.code,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            label: 'Contador',
            initialValue: state.albaran?.contador ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            label: 'Documento',
            initialValue: state.albaran?.documento.toString() ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            label: 'Ejercicio',
            initialValue: state.albaran?.ejercicio.toString() ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            label: 'Tipo de documento',
            initialValue: state.albaran?.tipoAlbaran ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
        ],
      ),
    );
  }
}
 */
class _MyData extends DataTableSource {
  final List<AlbaranDetails> data;

  _MyData(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].contador ?? '')),
      DataCell(Text(data[index].documento.toString())),
      DataCell(Text(data[index].linea.toString())),
      DataCell(Text(data[index].referencia ?? '')),
      DataCell(Text(data[index].cantidad.toString())),
      DataCell(Text(data[index].descripcionReferencia ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

