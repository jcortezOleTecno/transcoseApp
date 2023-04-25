import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_counter_button.dart';
import 'package:vemare/app/view/_components/my_button/my_tienda_renting_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/bloc/detail_sale_rent_cubit.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/bloc/detail_sale_rent_state.dart';
import 'package:vemare/app/view/promotions/renting_store/renting_store_page.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class DetailSaleRent extends StatelessWidget {
  const DetailSaleRent._();

  static const route = '/detail_sale_rent';

  static Widget create(Promotion promotion) {
    return BlocProvider(
      create: (context) => DetailSaleRentCubit(
        getIt.get<ShoppingCardRepository>(),
        promotion,
      ),
      child: const DetailSaleRent._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailSaleRentCubit>();
    return Scaffold(
      body: BlocConsumer<DetailSaleRentCubit, DetailSaleRentState>(
        listenWhen: (p, c) => p.adds != c.adds,
        listener: (context, state) {
          if (state.message != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
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
                      MyTiendaRentingButton(isTienda: cubit.isTienda),
                      spacerM,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: NetworkImage(state.promotion!.image!),
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      spacerS,
                      Text(
                        state.promotion!.name!,
                        style: AppTextStyle.h1Style,
                      ),
                      spacerS,
                      MyHtml(text: state.promotion!.description ?? ''),
                      spacerM,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyle.h1Style,
                            children: [
                              TextSpan(
                                text: '${state.promotion!.pvpOriginal!}\$',
                              ),
                              TextSpan(
                                text: ' IVA incluido ',
                                style: AppTextStyle.defaultStyle
                                    .copyWith(color: AppColor.neutral40),
                              ),
                            ],
                          ),
                        ),
                      ),
                      spacerM,
                      MyCounterButton(
                        decrease: cubit.quantity,
                        increase: cubit.quantity,
                      ),
                      spacerL,
                      Visibility(
                        visible: LocalDataRepository().isLogged,
                        replacement: const MySpacer(height: 50),
                        child: MyButton(
                          onPressed: cubit.addShoppingCard,
                          isLoading: state.loading,
                          text: 'Añadir al carrito',
                        ),
                      ),
                      spacerM,
                      MyButton(
                          onPressed: () => Navigator.pushNamed(
                                context,
                                RentingStorePage.route,
                                arguments: state.isTienda,
                              ),
                          text: state.isTienda ? 'Comprar' : 'Alquilar',
                          variant: MyButtonVariant.outlinedBold),
                      spacerL,
                    ],
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
