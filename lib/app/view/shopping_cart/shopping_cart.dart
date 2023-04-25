import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/shopping_card_product.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/shopping_cart/bloc/shopping_card_cubit.dart';
import 'package:vemare/app/view/shopping_cart/bloc/shopping_cart_state.dart';
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
      ),
      child: const ShoppingCartPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShoppingCardCubit, ShoppingCardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MyBody(
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
                                'Carrito ${state.products.isNotEmpty ? (state.products.length) : ''}',
                                style: AppTextStyle.h1Style,
                              ),
                              spacerM,
                              if (state.loading)
                                ...List.generate(
                                    5,
                                    (_) => const MyShimmer(
                                          margin: EdgeInsets.only(bottom: 15),
                                          height: 80,
                                        )),
                              if (!state.loading && state.products.isEmpty)
                                _CarEmpty(),
                              ListView.separated(
                                itemCount: state.products.length,
                                separatorBuilder: (context, i) =>
                                    const Divider(),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) {
                                  return _ShoppingItem(
                                    product: state.products[i],
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyButton(onPressed: () {}, text: 'Comprar'),
                ),
                spacerS,
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ShoppingItem extends StatelessWidget {
  const _ShoppingItem({
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
                product.renting == 1 ? 'Renting' : 'Tienda',
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
                        text: product.promotionName,
                      ),
                      TextSpan(
                          text: ' x${product.quantity}',
                          style:
                              AppTextStyle.defaultStyle.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.titleCard,
                  children: [
                    TextSpan(
                      text: '${product.promotionPrice}\$',
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
          Material(
            color: AppColor.error200,
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () => cubit.deleteProduct(product.id!),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset('assets/icons/Trash.png', scale: 2),
              ),
            ),
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
