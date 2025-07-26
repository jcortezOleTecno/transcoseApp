import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/widgets_utils/circular_progress_colors.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/domain/widgets_utils/textfield_general.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dialig_add_returns/my_dialog_add_returns.dart';
import 'package:vemare/app/view/_components/my_dialogs/my_dialogs_check.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/bloc/my_orders_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_returns/provider/albaran_returns_provider.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class AlbaranReturns extends StatefulWidget {
  const AlbaranReturns({Key? key,required this.data}) : super(key: key);
  static const route = '/albaran_returns';
  final Map<String,dynamic> data;
  @override
  State<AlbaranReturns> createState() => _AlbaranReturnsState();
}

class _AlbaranReturnsState extends State<AlbaranReturns> {

  late AlbaranReturnsProvider albaranReturnsProvider;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.neutral15,
      body: MyBody(
        child: ChangeNotifierProvider(
            create: (context1) => AlbaranReturnsProvider(
                data: widget.data,
                repository: getIt.get<MyAccountRepository>()
            ),
            child: Consumer<AlbaranReturnsProvider>(
                builder: (context2, provider, child){
                  albaranReturnsProvider = provider;
                  List<Widget> listW = [];

                  albaranReturnsProvider.ordersAlbaranReturns.forEach((key, value) {
                    listW.add(cardQuestionForAlbaran(order: value));
                  });

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
                              const MyBackButton(),
                              spacerS,
                              const SizedBox(
                                width: double.infinity,
                                child: Text('Pedido de devolución', style: AppTextStyle.h1Style),
                              ),
                              if(albaranReturnsProvider.loadData)...[
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                Center(
                                  child: circularProgressColors(),
                                ),
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                spacerXL,
                                spacerXL,
                              ]else...[
                                cardQuestion(),
                                ...listW,
                                MyButton(
                                  onPressed: () async{
                                    Map<String,dynamic>? res= await myDialogSendProduct(context: context);
                                    if(res != null && res['res']){
                                      albaranReturnsProvider.loadData = true;
                                      try{
                                        if(await albaranReturnsProvider.sendData(comment: res['comment'] ?? '',address: res['address'] ?? '')){
                                          MyOrdersCubit cubit = widget.data['cubit'];
                                          await cubit.fetchData();
                                          await successDialog(
                                              context,
                                              title: 'Devolución solicitada con éxito.',
                                              content: ''
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      }catch(_){
                                        albaranReturnsProvider.loadData = false;
                                      }
                                      if(mounted){
                                        albaranReturnsProvider.loadData = false;
                                      }
                                    }
                                  },
                                  text: ' Hacer devolución ',
                                  width: double.infinity,
                                  isLoading: false,
                                  disabled: false,
                                  childCenter: Image.asset('assets/icons/arrow_next.png',
                                    scale: 2,color: Colors.white,
                                  ),
                                ),
                                spacerM,
                                MyButton(
                                  variant: MyButtonVariant.outlinedBold,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  text: ' Cancelar y Salir ',
                                  width: double.infinity,
                                  isLoading: false,
                                  disabled: false,
                                ),
                                spacerM,
                              ]
                            ],
                          ),
                        ),
                        const Footer(),
                      ],
                    ),
                  );
                }
            )
        ),
      ),
    );
  }

  Widget cardQuestion({bool isProduct = false}){

    List<Widget> listW = [];
    for (var motivo in albaranReturnsProvider.albaranMotivos) {
      listW.add(SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            circularCheck(selected: albaranReturnsProvider.motivoSelected == motivo.code,code: motivo.code,isCabecera: true,key: ''),
            const SizedBox(width: 10,),
            Expanded(
              child: Text('${motivo.name.toUpperCase().substring(0,1)}${motivo.name.toLowerCase().substring(1,(motivo.name.length))}', style: AppTextStyle.h1Style.copyWith(fontSize: 18)),
            ),
          ],
        ),
      ));
      listW.add(const SizedBox(height: 5,));
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text('¿Por qué quiere devolver el producto?*',
              style: AppTextStyle.h1Style.copyWith(fontSize: 18)),
          const SizedBox(height: 5,),
          ...listW,
        ],
      ),
    );

  }

  Widget cardQuestionForAlbaran({required AlbaranISI order}){

    List<Widget> listW = [];

    for (var product in order.lineas) {
      if(albaranReturnsProvider.statePedidosSelected['${order.albaran}${product.referencia}']! &&
         !albaranReturnsProvider.deleteKeys.contains('${order.albaran}${product.referencia}')){
        listW.add(
          Container(
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(product.referencia,style: AppTextStyle.checkStyle),
                ),
                InkWell(
                  //child: const Icon(Icons.delete_outline,color: AppColor.red,size: 20,),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/icons/Trash.png',
                      color: AppColor.red,
                    ),
                  ),
                  onTap: () async {
                      bool? res= await myDialogDeleteProduct(context: context);
                      if(res != null && res){
                        albaranReturnsProvider.deleteKey(key: '${order.albaran}${product.referencia}');
                      }
                  },
                ),
                const SizedBox(width: 10,)
              ],
            ),
          ),
        );
        listW.add(const SizedBox(height: 10,));
        listW.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('CANTIDAD A DEVOLVER',style: AppTextStyle.nunitoSans70012),
          ),
        );
        listW.add(const SizedBox(height: 5,));
        int cantProduct = 0;
        int cantEdit = 0;
        if(albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}'] != null){
          cantProduct = albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['cantTotal'] ?? 0;
          cantEdit = albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['cant'] ?? 0;
        }
        TextEditingController controller = TextEditingController(text: cantEdit.toString());
        listW.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.neutral15,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFieldGeneral(
                    textEditingController: controller,
                    initialValue: null,
                    sizeW: double.infinity,
                    sizeH: 50,
                    borderColor: Colors.transparent,
                    colorBack: Colors.transparent,
                    labelStyle: AppTextStyle.nunitoSans70014,
                    textInputType: const TextInputType.numberWithOptions(signed: false,decimal: false),
                    onChanged: (value){
                      if(value.isNotEmpty){
                        int cant = 0;
                        try{
                          if(int.parse(value.replaceAll(' ', '').replaceAll('-', '')) > cantProduct){
                            cant = cantProduct;
                          }else if(value == '0' || value.contains(' ') || value.contains('-')){
                            cant = cantProduct;
                          }else{
                            cant = int.parse(value);
                          }
                        }catch(_){
                          cant = cantProduct;
                        }
                        albaranReturnsProvider.changeCant(key: '${order.albaran}${product.referencia}',cant: cant);
                      }
                    },
                  ),
                ),
                Text('de ${albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['cantTotal'] ?? 0}',style: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10,)
              ],
            ),
          ),
        );
        listW.add(const SizedBox(height: 10,));
        listW.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text('IMPORTE',style: AppTextStyle.nunitoSans70012),
          ),
        );
        listW.add(const SizedBox(height: 5,));
        listW.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(myFormatMoney(double.parse(product.importe.toString())),style: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold)),
          ),
        );
        listW.add(const SizedBox(height: 10,));
        int codeProduct = albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['motivo'];

        List<Widget> listW2 = [];
        for (var motivo in albaranReturnsProvider.albaranMotivos) {
          listW2.add(SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                circularCheck(selected: codeProduct == motivo.code,code: motivo.code,key: '${order.albaran}${product.referencia}',isCabecera: false),
                const SizedBox(width: 10,),
                Expanded(
                  child: Text('${motivo.name.toUpperCase().substring(0,1)}${motivo.name.toLowerCase().substring(1,(motivo.name.length))}', style: AppTextStyle.h1Style.copyWith(fontSize: 18)),
                ),
              ],
            ),
          ));
          listW2.add(const SizedBox(height: 5,));
        }

        listW.add(
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.neutral15,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text('¿Por qué quiere devolver el producto?*',
                      style: AppTextStyle.h1Style.copyWith(fontSize: 18)),
                  const SizedBox(height: 5,),
                  ...listW2,
                ],
              ),
            )
        );
        listW.add(
          const SizedBox(height: 10,)
        );
      }
    }


    return listW.isEmpty ? Container() : Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(order.albaran,style: AppTextStyle.h3Style),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: AppColor.neutral15,
            margin: const EdgeInsets.symmetric(vertical: 5),
          ),
          ...listW,
        ],
      ),
    );
  }

  Widget circularCheck({bool selected = false,double sizeCheck = 20.0, required int code, required bool isCabecera, required String key}){
    return InkWell(
      onTap: (){
        if(isCabecera){
          albaranReturnsProvider.motivoSelected = code;
          albaranReturnsProvider.changeAllCode(code: code);
        }else{
          albaranReturnsProvider.changeCode(code: code,key: key);
        }
      },
      child: Container(
        width: sizeCheck,
        height: sizeCheck,
        decoration: const BoxDecoration(
          color: AppColor.white,
          shape: BoxShape.circle, // Hace que el contenedor sea circular
        ),
        child: Center(
          child: Icon( selected ? CupertinoIcons.checkmark_circle_fill : Icons.circle_outlined, // Ícono de check
            color: AppColor.primary,
            size: sizeCheck,
          ),
        ),
      ),
    );
  }

}
