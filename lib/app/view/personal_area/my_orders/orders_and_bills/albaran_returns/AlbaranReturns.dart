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
  final GlobalKey _TextKey = GlobalKey();

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

                  bool notComplet = false;
                  albaranReturnsProvider.ordersReturns.forEach((key, value) {
                    if(value['motivo'] == null){
                      notComplet = true;
                    }
                  });

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacerS,
                              Container(key: _TextKey,),
                              const MyBackButton(
                                edgeInsets: EdgeInsets.symmetric(horizontal: 0),
                              ),
                              spacerXs,
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: MyButton(
                                    variant: MyButtonVariant.outlinedBoldTransparent,
                                    onPressed: () async{
                                      Map<String,dynamic>? res= await myDialogSendProduct(context: context);
                                      if(res != null && res['res']){
                                        albaranReturnsProvider.text1Comment = res['comment'];
                                        albaranReturnsProvider.text2Comment = res['address'];
                                        await Future.delayed(const Duration(milliseconds: 200));
                                        onTapSend();
                                      }
                                    },
                                    text: ' Modificar dirección ',
                                    width: double.infinity,
                                    isLoading: false,
                                    disabled: notComplet,
                                  ),
                                ),
                                spacerS,
                                spacerS,
                                cardQuestion(),
                                ...listW,
                                MyButton(
                                  onPressed: () async{
                                    onTapSend();
                                  },
                                  text: ' Finalizar devolución ',
                                  width: double.infinity,
                                  isLoading: false,
                                  disabled: notComplet,
                                  childCenter: Image.asset('assets/icons/arrow_next.png',
                                    scale: 2,color: Colors.white,
                                  ),
                                ),
                                spacerM,
                                MyButton(
                                  variant: MyButtonVariant.outlinedBoldTransparent,
                                  onPressed: () async {
                                    MyOrdersCubit cubit = widget.data['cubit'];
                                    await cubit.resetSelected();
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

  Future onTapSend() async{
    albaranReturnsProvider.loadData = true;

    Scrollable.ensureVisible(
      _TextKey.currentContext!,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    try{
      Map<String,dynamic> result = await albaranReturnsProvider.sendData(comment: albaranReturnsProvider.text1Comment,address: albaranReturnsProvider.text2Comment);
      if(result['result']){
        MyOrdersCubit cubit = widget.data['cubit'];
        await cubit.fetchData(isReset: true);
        await successDialog(
            context,
            title: 'Devolución solicitada con éxito.',
            content: ''
        );
        Navigator.of(context).pop();
      }else{
        await successDialog(
          context,
          title: 'Problemas con la Devolución',
          content: result['error'] ?? '',
          isError: true,
        );
      }
    }catch(_){
      albaranReturnsProvider.loadData = false;
    }
    if(mounted){
      albaranReturnsProvider.loadData = false;
    }
  }

  Widget cardQuestion({bool isProduct = false}){

    List<Widget> listW = [];
    for (var motivo in albaranReturnsProvider.albaranMotivos) {
      listW.add(SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            circularCheck(selected: (albaranReturnsProvider.motivoSelected != null && albaranReturnsProvider.motivoSelected == motivo.code),code: motivo.code,isCabecera: true,key: ''),
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
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.whiteF,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text('¿Por qué quiere hacer esta devolución?*',
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

        String title = product.description;
        String subTitle = product.referencia;
        if(product.referencia.contains('CV') || product.referencia.contains('CN')){
          title = 'CASCO';
          subTitle = subTitle.replaceAll('CV', '').replaceAll('CN', '');
        }

        listW.add(
          Container(
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(title,style: AppTextStyle.h3Style.copyWith(fontSize: 18)),
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
                        await albaranReturnsProvider.deleteKey(key: '${order.albaran}${product.referencia}');
                        if((albaranReturnsProvider.ordersReturns.length - albaranReturnsProvider.deleteKeys.length) == 0){
                          Navigator.of(context).pop();
                        }
                      }
                  },
                ),
                const SizedBox(width: 10,)
              ],
            ),
          ),
        );
        listW.add(const SizedBox(height: 2,));
        listW.add(
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('REFERENCIA  ',style: AppTextStyle.nunitoSans70012.copyWith(fontSize: 14),textAlign: TextAlign.left,),
                Text(subTitle,style: AppTextStyle.h3Style.copyWith(fontSize: 18),textAlign: TextAlign.left,)
              ],
            ),
          )
        );
        listW.add(const SizedBox(height: 10,));
        listW.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('CANTIDAD A DEVOLVER',style: AppTextStyle.nunitoSans70012.copyWith(fontSize: 14)),
          ),
        );
        listW.add(const SizedBox(height: 5,));
        int cantProduct = 0;
        int cantEdit = 0;
        if(albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}'] != null){
          cantProduct = albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['cantTotal'] ?? 0;
          cantEdit = albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['cant'] ?? 0;

          if(albaranReturnsProvider.productWithCasco.containsKey(product.referencia)){
            if(cantProduct > albaranReturnsProvider.productWithCasco[product.referencia]!.cantidadTotal){
              cantProduct = albaranReturnsProvider.productWithCasco[product.referencia]!.cantidadTotal;
            }
          }
        }
        TextEditingController controller = TextEditingController(text: cantEdit.toString());
        listW.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColor.neutral05,
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
                Text('de $cantProduct',style: AppTextStyle.nunitoSans70014.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10,)
              ],
            ),
          ),
        );
        listW.add(const SizedBox(height: 10,));
        // listW.add(
        //   Container(
        //     width: double.infinity,
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     child: Text('IMPORTE',style: AppTextStyle.nunitoSans70012.copyWith(fontSize: 14)),
        //   ),
        // );
        // listW.add(const SizedBox(height: 5,));
        // listW.add(
        //   Container(
        //     width: double.infinity,
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     child: Text(myFormatMoney(double.parse(product.importe.toString())),style: AppTextStyle.h3Style.copyWith(fontSize: 16)),
        //   ),
        // );
        // listW.add(const SizedBox(height: 10,));
        int? codeProduct = albaranReturnsProvider.ordersReturns['${order.albaran}${product.referencia}']['motivo'];

        List<Widget> listW2 = [];
        for (var motivo in albaranReturnsProvider.albaranMotivos) {
          listW2.add(SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                circularCheck(selected: (codeProduct != null && codeProduct == motivo.code),code: motivo.code,key: '${order.albaran}${product.referencia}',isCabecera: false,colorBg: AppColor.neutral05),
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.neutral05,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text('¿Por qué quiere devolver el producto?*',
                      style: AppTextStyle.h1Style.copyWith(fontSize: 20)),
                  const SizedBox(height: 15,),
                  ...listW2,
                ],
              ),
            )
        );
        listW.add(
          const SizedBox(height: 10,)
        );
        if(order.lineas.length > 1 && order.lineas.last.ean != product.ean){
          listW.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.blue100,
          ));
          listW.add(
              const SizedBox(height: 5,)
          );
        }
      }
    }


    return listW.isEmpty ? Container() : Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.whiteF,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(order.albaran,style: AppTextStyle.h3Style.copyWith(fontSize: 18)),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: AppColor.neutral15,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          ...listW,
        ],
      ),
    );
  }

  Widget circularCheck({bool selected = false,double sizeCheck = 20.0, required int code, required bool isCabecera, required String key, Color colorBg = AppColor.whiteF}){
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
        decoration: BoxDecoration(
          color: colorBg,
          shape: BoxShape.circle, // Hace que el contenedor sea circular
        ),
        child: Center(
          child: selected ? Container(
            width: sizeCheck - 1,
            height: sizeCheck - 1,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: AppColor.primary,
              ),
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primary
                ),
              ),
            ),
          ) : Icon( Icons.circle_outlined, // Ícono de check
            color: AppColor.primary,
            size: sizeCheck,
          ),
        ),
      ),
    );
  }

}
