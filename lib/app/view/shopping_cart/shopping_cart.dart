import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/shopping_card_product.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/value_object/status.dart';
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
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../home/home_page.dart';

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
    final cubit = context.read<ShoppingCardCubit>();
    final cubitCounter = context.read<CarCounterCubit>();
    return Scaffold(
      body: BlocConsumer<ShoppingCardCubit, ShoppingCardState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) async {
          if (state.status == FormStatus.done) {
            await launchUrlString(state.payResponse?.urlPayment ?? '')
                .then((value) {
              Navigator.pop(context);
              print("+++++++++++++++++++  launchUrlString +++++++++ ");
            });
          }
          if (state.status == FormStatus.error) {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.payResponse?.message ?? '')));
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () {
              cubit.cancelBuy();
              return Future.value(!state.buying);
            },
            child: MyBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
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
                                if (state.loading)
                                  ...List.generate(
                                      2,
                                      (_) => const MyShimmer(
                                            margin: EdgeInsets.only(bottom: 20),
                                            height: 300,
                                          )),
                                if (!state.loading && state.products.isEmpty)
                                  const _CarEmpty(),
                                if (state.productsRenting.isNotEmpty)
                                  _TypeProductCards(
                                      products: state.productsRenting),
                                if (state.productsRenting.isNotEmpty &&
                                    state.productsTienda.isNotEmpty)
                                  const Divider(
                                    color: AppColor.primaryBlue,
                                    thickness: 1,
                                    height: 50,
                                  ),
                                if (state.productsTienda.isNotEmpty)
                                  _TypeProductCards(
                                      products: state.productsTienda)

                                /*ListView.separated(
                                  itemCount: state.productsTienda.length,
                                  separatorBuilder: (context, i) =>
                                      const Divider(),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return ShoppingItem(
                                      product: state.productsTienda[i],
                                    );
                                  },
                                )*/
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (state.buying) _BuyData(state),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: MyButton(
                      disabled: state.buying
                          ? !state.typePaySelected
                          : state.products.isEmpty,
                      onPressed: () {
                        !state.buying ? cubit.buy() : cubit.orderPayment();
                      },
                      text: state.typePaySelected ? 'Continuar' : 'Comprar',
                      isLoading: state.status == FormStatus.loading,
                    ),
                  ),
                  spacerS,
                ],
              ),
            ),
          );
        },
      ),
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
                      child: Text(
                    e.productName ?? '',
                    style: AppTextStyle.nunitoSans700.copyWith(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  spacerS,
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
                      children: [
                        if (e.priceOld != null)
                          TextSpan(
                              text: myFormatMoney(
                                  ((e.priceOld?.toDouble() ?? 0) *
                                      (e.quantity!))),
                              style: AppTextStyle.pvpOrinigal
                                  .copyWith(fontSize: 14)),
                        TextSpan(
                            text:
                                ' ${myFormatMoney(e.total?.toDouble() ?? 0)}'),
                        TextSpan(
                          text: '  IVA incluido ',
                          style: AppTextStyle.defaultStyle
                              .copyWith(color: AppColor.neutral40),
                        ),
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
                      if (product.priceOld != null)
                        TextSpan(
                            text: myFormatMoney(
                                ((product.priceOld?.toDouble() ?? 0) *
                                    (product.quantity!))),
                            style: AppTextStyle.pvpOrinigal),
                      TextSpan(
                          text:
                              ' ${myFormatMoney((product.priceSale?.toDouble() ?? 0) * (product.quantity!))}'),
                      TextSpan(
                        text: '  IVA incluido ',
                        style: AppTextStyle.defaultStyle
                            .copyWith(color: AppColor.neutral40),
                      ),
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

/*class ShoppingItem extends StatelessWidget {
  const ShoppingItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ShoppingCardProduct product;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShoppingCardCubit>();
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: NetworkImage(product.image!),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          spacerS,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.renting ? 'Renting' : 'Tienda',
                style: AppTextStyle.inputLabelStyle.copyWith(
                  color: AppColor.neutral40,
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.defaultStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 14),
                    children: [
                      TextSpan(
                        text: product.productName ?? '',
                      ),
                      TextSpan(
                          text: ' x${product.quantity}',
                          style:
                              AppTextStyle.defaultStyle.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
              ),

              /*
               if (promotion.pvpLowered != null)
                      Text(
                        '${promotion.pvpOriginal}€',
                        style: AppTextStyle.pvpOrinigal,
                      ),
                    spacerXs,
                    Text(
                      '${promotion.pvpLowered ?? promotion.pvpOriginal}€',
                      style: AppTextStyle.h2Style,
                    ),
              */
              RichText(
                text: TextSpan(
                  style: AppTextStyle.titleCard,
                  children: [
                    if (product.priceSale != null)
                      TextSpan(
                        text: myFormatMoney(
                            (product.priceSale?.toDouble() ?? 0.0) *
                                (product.quantity ?? 0)),
                        style: AppTextStyle.pvpOrinigal.copyWith(fontSize: 14),
                      ),
                    TextSpan(
                      text:
                          ' ${myFormatMoney((product.priceSale?.toDouble() ?? product.priceOld?.toDouble() ?? 0) * (product.quantity ?? 0))}',
                    ),
                    TextSpan(
                      text: ' IVA incluido ',
                      style: AppTextStyle.defaultStyle
                          .copyWith(color: AppColor.neutral40, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          )),
          spacerS,
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
                   onTap: () => cubit.deleteProduct(
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
      ),
    );
  }
}*/

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
