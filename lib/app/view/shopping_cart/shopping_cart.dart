// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/shopping_card_product.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_multi_radio_button/multi_radio_button.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/shared/shopping_car_counter_bloc/car_counter_cubit.dart';
import 'package:vemare/app/view/shopping_cart/bloc/shopping_card_cubit.dart';
import 'package:vemare/app/view/shopping_cart/bloc/shopping_cart_state.dart';
import 'package:vemare/app/view/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage._();

  static const route = "/shopping_cart";

  static Widget create() {
    return BlocProvider(
      create: (context) => ShoppingCardCubit(
        getIt.get<ShoppingCardRepository>(),
        context.read<CarCounterCubit>(),
      ),
      child: const ShoppingCartPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context1) => ShoppingCartProvider(context),
        child: Consumer<ShoppingCartProvider>(
            builder: (context2, provider, child){
              final cubit = context.read<ShoppingCardCubit>();
              return Scaffold(
                body: BlocConsumer<ShoppingCardCubit, ShoppingCardState>(
                  listenWhen: (p, c) => p.status != c.status,
                  listener: (context, state) async {
                    if (state.status == FormStatus.done) {
                      await Navigator.push(context, MaterialPageRoute(builder:
                          (BuildContext context) => WebViewGlobal(url: state.payResponse?.urlPayment ?? '',local: false,)));
                      Navigator.pop(context);
                      // await launchUrlString(state.payResponse?.urlPayment ?? '')
                      //     .then((value) {
                      //   Navigator.pop(context);
                      // });
                    }
                    if (state.status == FormStatus.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.payResponse?.message ?? '')));
                    }
                  },
                  builder: (context, state) {
                    print('');
                    return WillPopScope(
                      onWillPop: () {
                        cubit.cancelBuy();
                        return Future.value(!state.buying);
                      },
                      child: MyBody(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyBackButton(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Carrito${state.productsTienda.isNotEmpty ? ' (${state.counter})' : ''}',
                                      style: AppTextStyle.h1Style,
                                    ),
                                    spacerS,
                                    if (state.loading)...[
                                      ...List.generate(
                                          2,
                                              (_) => const MyShimmer(
                                            margin: EdgeInsets.only(bottom: 20),
                                            height: 300,
                                          )),],
                                    if (!state.loading && state.products.isEmpty)...[
                                      const _CarEmpty(),],
                                    if (state.productsRenting.isNotEmpty)...[
                                      _TypeProductCards(
                                          products: state.productsRenting),],
                                    if (state.productsRenting.isNotEmpty &&
                                        state.productsTienda.isNotEmpty)...[
                                      const Divider(
                                        color: AppColor.primaryBlue,
                                        thickness: 1,
                                        height: 50,
                                      ),],
                                    if (state.productsTienda.isNotEmpty)...[
                                      _TypeProductCards(
                                          products: state.productsTienda),
                                    ],
                                  ],
                                ),
                              ),
                              if (state.buying && !provider.viewData)...[_BuyData(state)],
                              if(state.buying && provider.viewData)...[ _BuyDataUser(state) ],
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: MyButton(
                                    disabled: state.buying
                                        ? !state.typePaySelected
                                        : state.products.isEmpty,
                                    onPressed: () {

                                      print('state.buying : ${state.buying}');
                                      print('state.productsTienda.isNotEmpty : ${state.productsTienda.isNotEmpty}');
                                      print('provider.viewData : ${provider.viewData}');

                                      if(!state.buying){
                                        if(state.productsTienda.isNotEmpty){
                                          cubit.buy();
                                        }else{
                                          //cubit.orderPayment();
                                        }
                                      }else{
                                        if(provider.viewData){
                                          if(provider.check){
                                            cubit.orderPayment();
                                          }else{
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Se debe aceptar las condiciones de compra')));
                                          }
                                        }else{
                                          provider.viewData = true;
                                        }
                                      }

                                      // !state.buying
                                      //     ? (state.productsTienda.isNotEmpty
                                      //     ? cubit.buy()
                                      //     : cubit.orderPayment())
                                      //     : cubit.orderPayment();
                                    },
                                    text: state.typePaySelected ? 'Continuar ' : 'Comprar',
                                    isLoading: state.status == FormStatus.loading,
                                    childCenter: Image.asset(
                                      "assets/icons/arrow_next.png",
                                      scale: 2.5,color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              spacerS,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
        )
    );
  }
}

class _TypeProductCards extends StatelessWidget {
  const _TypeProductCards({required this.products});

  final List<ShoppingCardProduct> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardProduct(products.first),
        if (products.length > 1) _VerMasProductos(products),
        spacerS,
        Text(
          'Total de ${products.first.renting ? 'renting' : 'tienda'} (${products.length})',
          style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
        ),
        spacerS,
        ...products
            .map(
              (e) => Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: AppColor.blue100,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      e.quantity?.toString() ?? '0',
                      style: AppTextStyle.nunitoSans700.copyWith(
                        color: AppColor.primaryBlue,
                      ),
                    ),
                  ),
                  spacerS,
                  Expanded(
                    child: Text(e.productName ?? '',style: AppTextStyle.nunitoSans700.copyWith(fontSize: 16),maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ),
                  spacerS,
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
                      children: [
                        if(e.renting)...[
                          TextSpan(text: 'Desde',style: AppTextStyle.defaultStyle.copyWith(color: AppColor.neutral40)),
                        ],
                        if (e.priceOld != null)...[
                          TextSpan(text: myFormatMoney(((e.priceOld?.toDouble() ?? 0) *(e.quantity!))),style: AppTextStyle.pvpOrinigal.copyWith(fontSize: 14)),
                        ],
                        TextSpan(text:' ${myFormatMoney(e.total?.toDouble() ?? 0)}'),
                        TextSpan(text: '  IVA incluido ',style: AppTextStyle.defaultStyle.copyWith(color: AppColor.neutral40),),
                      ],
                    ),
                  )
                ],
              ),
            )
            .toList(),
        spacerS,
        const MyDivider(),
        spacerS,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ShoppingCardCubit, ShoppingCardState>(
              builder: (context, state) {
                return RichText(
                  text: TextSpan(
                    style: AppTextStyle.nunitoSans800.copyWith(fontSize: 40),
                    children: [
                      TextSpan(
                          text: myFormatMoney(products.first.renting
                              ? state.totalRenting.toDouble()
                              : state.totalTienda.toDouble())),
                      TextSpan(
                        text: '  IVA incluido ',
                        style: AppTextStyle.defaultStyle
                            .copyWith(color: AppColor.neutral40),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}

class _VerMasProductos extends StatefulWidget {
  const _VerMasProductos(this.products);

  final List<ShoppingCardProduct> products;

  @override
  State<_VerMasProductos> createState() => _VerMasProductosState();
}

class _VerMasProductosState extends State<_VerMasProductos> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Center(
            child: Text(
          expanded ? "Ver menos" : "Ver mas",
          style: AppTextStyle.nunitoSans700.copyWith(
            fontSize: 16,
            color: AppColor.primaryBlue,
          ),
        )),
        onExpansionChanged: (value) {
          setState(() {
            expanded = value;
          });
        },
        iconColor: AppColor.primaryBlue,
        children: widget.products
            .sublist(1)
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _CardProduct(e),
                ))
            .toList());
  }
}

class _CardProduct extends StatelessWidget {
  const _CardProduct(this.product);

  final ShoppingCardProduct product;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShoppingCardCubit>();
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyNetworkImage(
            image: product.image!,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          spacerS,
          Text(
            product.renting ? "Renting" : "Tienda",
            style:
                AppTextStyle.nunitoSans700.copyWith(color: AppColor.neutral40),
          ),
          spacerXs,
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: AppColor.blue100,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  product.quantity?.toString() ?? '0',
                  style: AppTextStyle.nunitoSans700.copyWith(
                    color: AppColor.primaryBlue,
                  ),
                ),
              ),
              spacerS,
              Expanded(
                  child: Text(
                product.productName ?? '',
                style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
                    children: [
                      if(product.renting)...[
                        TextSpan(text: 'Desde',style: AppTextStyle.defaultStyle.copyWith(color: AppColor.neutral40)),
                      ],
                      if (product.priceOld != null)...[
                        TextSpan(text: myFormatMoney(((product.priceOld?.toDouble() ?? 0) *(product.quantity!))),style: AppTextStyle.pvpOrinigal),
                      ],
                      TextSpan(text:' ${myFormatMoney((product.priceSale?.toDouble() ?? 0) * (product.quantity!))}'),
                      TextSpan(text: '  IVA incluido ',style: AppTextStyle.defaultStyle.copyWith(color: AppColor.neutral40),),
                    ],
                  ),
                ),
              ),
              BlocBuilder<ShoppingCardCubit, ShoppingCardState>(
                builder: (context, state) {
                  if (state.buying) {
                    return const SizedBox();
                  }
                  return Material(
                    color: AppColor.error200,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => product.renting
                          ? cubit.deleteProductRenting(
                              id: product.id!,
                              quantity: product.quantity!,
                            )
                          : cubit.deleteProductTienda(
                              id: product.id!,
                              quantity: product.quantity!,
                            ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset('assets/icons/Trash.png', scale: 2),
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class _BuyData extends StatelessWidget {
  const _BuyData(
    this.state, {
    Key? key,
  }) : super(key: key);

  final ShoppingCardState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShoppingCardCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyDivider(height: 0),
          spacerS,
          // const Text(
          //   'Total',
          //   style: AppTextStyle.h3Style,
          // ),
          // spacerXs,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text('Productos', style: AppTextStyle.defaultStyle),
          //     Text('x${state.counter}', style: AppTextStyle.defaultStyle),
          //   ],
          // ),
          // spacerS,
          // const MyDivider(height: 0),
          // spacerS,
          // Center(
          //   child: RichText(
          //     text: TextSpan(
          //       style: AppTextStyle.h1Style,
          //       children: [
          //         TextSpan(
          //             text: fmf
          //                 .copyWith(amount: state.total)
          //                 .output
          //                 .symbolOnRight),
          //         TextSpan(
          //           text: '  IVA incluido',
          //           style: AppTextStyle.defaultStyle
          //               .copyWith(color: AppColor.neutral40),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // spacerS,
          const Text(
            '¿Cómo deseas realizar tu pago?',
            style: AppTextStyle.inputLabelStyle,
          ),
          StringRadioButtons(
            options: (LocalDataRepository()
                        .user
                        ?.webservice
                        ?.permiteComprasCredito ??
                    false)
                ? ['Crédito', 'Tarjeta']
                : ['Tarjeta'],
            onSelectionChanged: cubit.typePaySelect,
          )
        ],
      ),
    );
  }
}

class _BuyDataUser extends StatelessWidget {
  const _BuyDataUser(
    this.state, {
    Key? key,
  }) : super(key: key);

  final ShoppingCardState state;

  @override
  Widget build(BuildContext context) {
    ShoppingCartProvider provider = Provider.of<ShoppingCartProvider>(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyDivider(height: 0),
              spacerS,
              const Text(
                'Total',
                style: AppTextStyle.h3Style,
              ),
              spacerXs,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Productos', style: AppTextStyle.defaultStyle),
                  Text('x${state.counter}', style: AppTextStyle.defaultStyle),
                ],
              ),
              spacerS,
              const MyDivider(height: 0),
              spacerS,
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.h1Style,
                    children: [
                      TextSpan(
                          text: fmf
                              .copyWith(amount: state.total)
                              .output
                              .symbolOnRight),
                      TextSpan(
                        text: '  IVA incluido',
                        style: AppTextStyle.defaultStyle
                            .copyWith(color: AppColor.neutral40),
                      ),
                    ],
                  ),
                ),
              ),
              // spacerS,
              const Text(
                'Datos de envío',
                style: AppTextStyle.h3Style,
              ),
              const SizedBox(height: 20),
              cardData(title: 'Nombre',subTitle: provider.userData!.name ?? ''),
              const SizedBox(height: 20),
              cardData(title: 'E-mail',subTitle: provider.userData!.email ?? ''),
              const SizedBox(height: 20),
              cardData(title: 'Dirección',subTitle: provider.userData!.address ?? ''),
              const SizedBox(height: 20),
              cardData(title: 'Provincia',subTitle: provider.userData!.province ?? ''),
              const SizedBox(height: 20),
              cardData(title: 'Ciudad',subTitle: provider.userData!.city ?? ''),
              const SizedBox(height: 20),
              cardData(title: 'CP',subTitle: provider.userData!.postalCode ?? ''),
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
                        value: provider.check,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onChanged: (value){ provider.check = value ?? false; },
                        activeColor: AppColor.white,
                        checkColor: AppColor.blue,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                              text: 'Acepto las ',
                              style: AppTextStyle.h12Style,
                              recognizer: TapGestureRecognizer()..onTap = (){
                                provider.check = !provider.check;
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
            ],
          ),
        ),
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

class _CarEmpty extends StatelessWidget {
  const _CarEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Text(
          'Carrito vacío!',
          style: AppTextStyle.h3Style,
        ),
      ),
    );
  }
}
