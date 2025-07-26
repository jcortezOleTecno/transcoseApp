import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/albaran_product_model.dart';
import 'package:vemare/app/domain/widgets_utils/textfield_general.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import '../../theme/button_style.dart';
import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../my_button/my_button.dart';
import '../my_button/my_icon_button.dart';
import '../my_spacer/my_spacer.dart';

Future<List<AlbaranProductModel>?> myDialogAddReturns({ required BuildContext context, required List<AlbaranProductModel> listProducts}){

  bool edit = false;
  bool seeError = false;

  MyDataReturnsProductsAlbaran myDataCell = MyDataReturnsProductsAlbaran(context: context,data: listProducts,);

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {

            myDataCell = MyDataReturnsProductsAlbaran(context: context,data: listProducts);
            myDataCell.changeEdit = edit;

            return Dialog(
              insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //const MySpacer(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                IconButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: Text('¿Estás seguro de que deseas añadir estas mercancías a tu pedido de devolución?',
                                  style: AppTextStyle.h2Style,textAlign: TextAlign.center),
                            ),
                            spacerS,
                            tablaAlbaran(dataProductAlbaranFiltrado: myDataCell),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          if(seeError)...[
                            const Text('La cantidad agregada no puede ser menor a uno(1), ni superior a la cantidad del producto',
                            style: AppTextStyle.nunitoSansError22,textAlign: TextAlign.center),
                          ],
                          MyButton(
                            onPressed: () {
                              Navigator.of(context).pop(listProducts);
                            },
                            text: 'Añadir ',
                            width: double.infinity,
                            disabled: edit,
                            childCenter: SizedBox(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/icons/mas.png',color: Colors.white,scale: 1,),
                            ),
                          ),
                          spacerS,
                          MyIconButton(
                            onPressed: () {
                              seeError = false;setState(() {});
                              if(edit){
                                Map<String,int> dataDetails = myDataCell.dataDetailsAll;
                                Map<int,int> posEdit = {};
                                Map<int,int> posEditSuccess = {};
                                for(int x = 0; x < listProducts.length; x++){
                                  if(dataDetails[listProducts[x].referencia]! > listProducts[x].cantidad! || dataDetails[listProducts[x].referencia]! < 1){
                                    posEdit[x] = dataDetails[listProducts[x].referencia]!;
                                  }else{
                                    posEditSuccess[x] = dataDetails[listProducts[x].referencia]!;
                                  }
                                }
                                if(posEdit.isNotEmpty){
                                  seeError = true;setState(() {});
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(content: Text('La cantidad agregada no puede ser menor a 1, ni superior a la cantidad del producto')));
                                }else{
                                  log('LISTO');
                                  posEditSuccess.forEach((key, value) {
                                    listProducts[key].cantidad = value;
                                  });
                                  edit = false;
                                }
                              }else{
                                edit = !edit;
                              }
                              setState(() {});
                            },
                            text: edit ? 'Editando' : 'Editar lista',
                            variant: MyButtonVariant.outlinedBold,
                            icon: Image.asset(
                              'assets/icons/IconEdit.png',
                              scale: 2,
                              color: AppColor.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
}

Widget tablaAlbaran({required DataTableSource dataProductAlbaranFiltrado}){

  double hSize = 250;
  if(dataProductAlbaranFiltrado.rowCount <= 5){
    if(dataProductAlbaranFiltrado.rowCount > 2){
      hSize = hSize + (20 * dataProductAlbaranFiltrado.rowCount);
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
          spacerS,
          Expanded(
            child: dataProductAlbaranFiltrado.rowCount == 0 ? Container() :
            PaginatedDataTable2(
              wrapInCard: false,
              columnSpacing: 12,
              horizontalMargin: 12,
              empty: const NoResultTable(),
              minWidth: 700,
              rowsPerPage: dataProductAlbaranFiltrado.rowCount <= 10 ? dataProductAlbaranFiltrado.rowCount : 10,
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
              source: dataProductAlbaranFiltrado,
            ),
          ),
        ],
      ),
    ),
  );
}

class MyDataReturnsProductsAlbaran extends DataTableSource {
  final List<AlbaranProductModel> data;
  final BuildContext? context;
  bool isEdit = false;
  Map<String,int> dataDetails = {};

  MyDataReturnsProductsAlbaran({required this.data, required this.context}){
    for (var element in data) {
      dataDetails[element.referencia!] = element.cantidad ?? 0;
    }
  }


  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(data[index].referencia ?? '',textAlign: TextAlign.center,)),
        DataCell(Text(data[index].descripcion ?? '',textAlign: TextAlign.center,)),

        !isEdit ? DataCell(Text(data[index].cantidad.toString(),textAlign: TextAlign.center,)) :
        DataCell(
          TextFormField(
            initialValue: dataDetails[data[index].referencia].toString(),
            keyboardType: TextInputType.number,
            onChanged: (value){
              try{
                if(value.isNotEmpty){
                  dataDetails[data[index].referencia!] = int.parse(value);
                }
              }catch(_){}
            },
          )
        ),


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

  set changeEdit(bool value){
    isEdit = value;
  }

  Map<String,int> get dataDetailsAll => dataDetails;
}

Future<bool?> myDialogDeleteProduct({ required BuildContext context}){
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    spacerM,
                    const SizedBox(
                      width: double.infinity,
                      child: Text('¿Estás seguro de que deseas eliminar este producto?',
                          style: AppTextStyle.h2Style,textAlign: TextAlign.center),
                    ),
                    spacerS,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        text: 'Eliminar ',
                        width: double.infinity,
                        disabled: false,
                      ),
                    ),
                    spacerS,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        text: 'Cancelar ',
                        width: double.infinity,
                        disabled: false,
                      ),
                    ),
                    spacerM,
                  ],
                ),
              ),
            );
          },
        );
      });
}

Future<Map<String,dynamic>?> myDialogSendProduct({ required BuildContext context}){

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    spacerM,
                    const SizedBox(
                      width: double.infinity,
                      child: Text('¿Quieres añadir un\ncomentario a tu\ndevolución?',
                          style: AppTextStyle.h2Style,textAlign: TextAlign.center),
                    ),
                    spacerS,
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Dirección de recogida',
                          style: AppTextStyle.h2Style.copyWith(fontSize: 16),textAlign: TextAlign.left),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFieldGeneral(
                        textEditingController: controller2,
                        initialValue: null,
                        hintText: 'Escriba la dirección aquí...',
                        sizeH: 100,
                        sizeW: double.infinity,
                      ),
                    ),
                    spacerS,
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Comentario',
                          style: AppTextStyle.h2Style.copyWith(fontSize: 16),textAlign: TextAlign.left),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFieldGeneral(
                        textEditingController: controller,
                        initialValue: null,
                        sizeH: 100,
                        sizeW: double.infinity,
                        textInputType: TextInputType.multiline,
                        maxLines: 4,
                        hintText: 'Escriba aquí...',
                      ),
                    ),
                    spacerS,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        onPressed: () {
                          Navigator.of(context).pop({
                            'comment' : controller.text,
                            'address' : controller2.text,
                            'res' : true
                          });
                        },
                        text: 'Finalizar Pedido ',
                        width: double.infinity,
                        disabled: false,
                        childCenter: Image.asset(
                          'assets/icons/arrow_next.png',
                          scale: 2,color: Colors.white,
                        ),
                      ),
                    ),
                    spacerS,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        variant: MyButtonVariant.outlinedBold,
                        onPressed: () {
                          Navigator.of(context).pop({
                            'comment' : '', 'res' : false
                          });
                        },
                        text: 'Volver ',
                        width: double.infinity,
                        disabled: false,
                      ),
                    ),
                    spacerM,
                  ],
                ),
              ),
            );
          },
        );
      });
}