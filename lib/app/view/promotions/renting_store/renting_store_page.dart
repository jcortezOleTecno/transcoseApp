import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/promotions/renting_store/bloc/renting_store_cubit.dart';
import 'package:vemare/app/view/promotions/renting_store/provider/renting_store_provider.dart';
import 'package:vemare/app/view/promotions/renting_store/widgets/promotion_description.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../detail_sale_rent/detail_sale_rent.dart';
import 'bloc/renting_store_state.dart';

class RentingStorePage extends StatelessWidget {
  const RentingStorePage._();
  static const route = '/renting_store';

  static Widget create(StoreArgs args) {
    return BlocProvider(
      create: (context) => RentingStoreCubit(
        getIt<ShoppingCardRepository>(),
        args,
      ),
      child: const RentingStorePage._(),
    );
  }

  // final StoreArgs args;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context1) => RentingStoreProvider(context),
      child: Consumer<RentingStoreProvider>(
          builder: (context2, provider, child){
            final cubit = context.read<RentingStoreCubit>();
            return BlocConsumer<RentingStoreCubit, RentingStoreState>(
              listenWhen: (p, c) => p.status != c.status,
              listener: (context, state) async {
                if (state.status == FormStatus.done) {
                  await launchUrlString(state.payResponse?.urlPayment ?? '');
                }
                if (state.status == FormStatus.error) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.payResponse?.message ?? '')));
                }
              },
              builder: (context3, state) {
                return Scaffold(
                  body: MyBody(
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyBackButton(),
                                PromotionDescription(
                                  title: state.arg!.isTienda ? 'Tienda' : 'Renting',
                                  promotion: state.arg!.promotion,
                                  quantity: state.arg!.quantity,
                                ),
                                spacerL,
                                if(provider.viewData)...[
                                  dataUserPay(rentingStoreProvider: provider,context: context),
                                ]else...[
                                  selectTypePay(cubit: cubit,state: state),
                                ],
                                _Button(
                                  state.arg!.copyWith(isCredit: state.type == 'Crédito'),
                                  selecType: state.type != null,
                                ),
                                const Footer(),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            );
          }
      )
    );
  }

  Widget selectTypePay({required RentingStoreCubit cubit, required RentingStoreState state}){
    return Visibility(
      visible: state.arg!.isTienda,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '¿Como deseas realizar tu pago?',
              style: AppTextStyle.h3Style,
            ),
            RadioGroup<String?>.builder(
              groupValue: state.type,
              activeColor: AppColor.blue,
              direction: Axis.vertical,
              horizontalAlignment: MainAxisAlignment.center,
              textStyle: AppTextStyle.inputLabelStyle,
              onChanged: cubit.selectType,
              items: (LocalDataRepository()
                  .user
                  ?.webservice
                  ?.permiteComprasCredito ??
                  false)
                  ? ['Crédito', 'Tarjeta']
                  : ['Tarjeta'],
              itemBuilder: (value) => RadioButtonBuilder(
                value!,
                textPosition: RadioButtonTextPosition.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataUserPay({required RentingStoreProvider rentingStoreProvider, required BuildContext context}){
    return rentingStoreProvider.userData == null ? Container() :
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Datos de envío',
            style: AppTextStyle.h3Style,
          ),
          const SizedBox(height: 20),
          cardData(title: 'Nombre',subTitle: rentingStoreProvider.userData!.name ?? ''),
          const SizedBox(height: 20),
          cardData(title: 'E-mail',subTitle: rentingStoreProvider.userData!.email ?? ''),
          const SizedBox(height: 20),
          cardData(title: 'Dirección',subTitle: rentingStoreProvider.userData!.address ?? ''),
          const SizedBox(height: 20),
          cardData(title: 'Provincia',subTitle: rentingStoreProvider.userData!.province ?? ''),
          const SizedBox(height: 20),
          cardData(title: 'Ciudad',subTitle: rentingStoreProvider.userData!.city ?? ''),
          const SizedBox(height: 20),
          cardData(title: 'CP',subTitle: rentingStoreProvider.userData!.postalCode ?? ''),
          const SizedBox(height: 30),
          const Text(
            'Protección de datos personales',
            style: AppTextStyle.h12StyleNeu40W700,
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                  text: 'Utilizaremos sus datos para gestionar sus compras online en base a las condiciones generales de contratación, gestionar los servicios prestados y realizar encuestas de satisfacción. Para más información sobre el tratamiento y sus derechos, consulte la ',
                  style: AppTextStyle.h12StyleNeu40,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Política de Privacidad.',
                      style: AppTextStyle.h12StyleBlue,
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-privacidad')));
                      },
                    ),
                  ]
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Checkbox(
                  value: rentingStoreProvider.check,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (value){ rentingStoreProvider.check = value ?? false; },
                  activeColor: AppColor.white,
                  checkColor: AppColor.blue,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        text: 'Acepto las ',
                        style: AppTextStyle.h12Style,
                        recognizer: TapGestureRecognizer()..onTap = (){
                          rentingStoreProvider.check = !rentingStoreProvider.check;
                        },
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Condiciones de Compra.',
                            style: AppTextStyle.h12StyleBlue,
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/condiciones-de-compra')));
                            },
                          ),
                        ]
                    ),
                  ),
                )
              ],
            )
          ),
          // CheckboxListTile(
          //   onChanged: (value){ rentingStoreProvider.check = value ?? false; },
          //   value: rentingStoreProvider.check,
          //   title: RichText(
          //     text: TextSpan(
          //         text: 'Acepto las ',
          //         style: AppTextStyle.h12Style,
          //         children: <TextSpan>[
          //           TextSpan(
          //             text: 'Condiciones de Compra.',
          //             style: AppTextStyle.h12StyleBlue,
          //             recognizer: TapGestureRecognizer()..onTap = (){
          //               Navigator.push(context, MaterialPageRoute(builder:
          //                   (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/condiciones-de-compra')));
          //             },
          //           ),
          //         ]
          //     ),
          //   ),
          //   controlAffinity: ListTileControlAffinity.leading,
          //   activeColor: AppColor.white,
          //   contentPadding: EdgeInsets.zero,
          //   checkColor: AppColor.blue,
          //   checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget cardData({required String title, required String subTitle}){
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.h12Style),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            color: Colors.white,
            child: Text(subTitle, style: AppTextStyle.h4Style),
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
    this.args, {
    required this.selecType,
    Key? key,
  }) : super(key: key);

  final StoreArgs args;
  final bool selecType;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RentingStoreCubit>();
    RentingStoreProvider rentingStoreProvider = Provider.of<RentingStoreProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: BlocBuilder<RentingStoreCubit, RentingStoreState>(
        builder: (context, state) {
          return MyButton(
            onPressed: () {
              if(rentingStoreProvider.viewData){
                if(rentingStoreProvider.check){
                  if (LocalDataRepository().isLogged) {
                    cubit.orderPaymentUnique();
                  } else {
                    Navigator.pushNamed(
                      context,
                      LoginPage.route,
                      arguments: '',
                    ).then((_) {
                      if (LocalDataRepository().isLogged) {
                        cubit.orderPaymentUnique();
                      }
                    });
                  }
                }
              }else{
                rentingStoreProvider.viewData = true;
              }
            },
            text: 'Continuar',
            width: double.infinity,
            disabled: args.isTienda && !selecType,
            isLoading: state.status == FormStatus.loading,
          );
        },
      ),
    );
  }
}
