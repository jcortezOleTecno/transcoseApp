// ignore_for_file: use_build_context_synchronously

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/domain/model/returns_cart_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dialogs/my_dialogs_check.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_new_orders_provider.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/theme/theme.dart';

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
                          tablaAlbaran(provider: provider,context: context),
                          spacerS,spacerS,
                          tablaSendForm(provider: provider,context: context),
                          spacerS,spacerS,
                          MyButton(
                            onPressed: () => senDataCart(context: context,provider: provider),
                            text: 'Confirmar pedido de devolución',
                            width: double.infinity,
                            disabled: false,
                            childCenter: Container(),
                            isLoading: provider.sendData,
                          ),
                          spacerS,spacerS,
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

  Widget tablaAlbaran({required ReturnsNewOrdersProvider provider, required BuildContext context}){

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
            spacerS,spacerS,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: MyIconButton(
                customInset: const EdgeInsets.all(4),
                onPressed: () {
                  provider.typeView = 0;
                },
                text: 'Añadir mercancías',
                icon: Image.asset( 'assets/icons/mas.png', scale: 2,),
                variant: MyButtonVariant.outlinedBold,
              ),
            ),
            spacerS,spacerS,
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

  Widget tablaSendForm({required ReturnsNewOrdersProvider provider, required BuildContext context}){

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInput(
              key: const Key("Fecha de solicitud"),
              label: "Fecha de solicitud*",
              initialValue: null,
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
              controller: provider.controllerDate,
              onPressed: (){
                showRoundedDatePicker(
                  context: context,
                  initialDate: provider.dateSelected ?? DateTime.now(),
                  firstDate: DateTime.parse('2010-01-01'),
                  lastDate: DateTime.parse('2040-12-31'),
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
                    provider.dateSelected = date;
                  }
                });
              },
            ),
            MyInput(
              key: const Key("Dirección de entrega"),
              label: "Dirección de entrega*",
              initialValue: null,
              readOnly: false,
              variant: MyInputVariant.backgroundBlue,
              controller: provider.controllerEntrega,
            ),
            MyInput(
              key: const Key("Observaciones"),
              label: "Observaciones*",
              initialValue: null,
              readOnly: false,
              maxLines: 5,
              variant: MyInputVariant.backgroundBlue,
              controller: provider.controllerObservaciones,
              inputType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }

  Future senDataCart({required ReturnsNewOrdersProvider provider, required BuildContext context}) async{
    String error = '';
    if(provider.dateSelected == null){ error = 'Debe seleccionar una fecha de solicitud'; }
    if(provider.controllerEntrega.text.isEmpty){ error = 'Debe agregar una dirección de entrega'; }
    if(provider.controllerObservaciones.text.isEmpty){ error = 'Debe agregar una observacion'; }

    if(error.isEmpty){
      if(await provider.sendDataCart()){
        await successDialog(
            context,
            title: '¡El pedido de devolución se ha enviado con éxito!',
            content: 'Puedes revisar los detalles en el apartado de devoluciones.'
        );
        provider.initialData();
        Navigator.of(context).pop();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Problemas para enviar el pedido')));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)));
    }
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