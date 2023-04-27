import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_products_card.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/products_categories/bloc/our_products_cubit.dart';
import 'package:vemare/app/view/our_products/products_categories/bloc/our_products_state.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../../promotions/promotion/promotion_page.dart';

class OurProductsPage extends StatelessWidget {
  const OurProductsPage._(this.typeVehicle);
  final String? typeVehicle;

  static const route = '/our_products';

  static Widget create(String? typeVehicle) {
    return BlocProvider(
      create: (context) => OurProductsCubit(
        getIt.get<ProductsRepository>(),
      ),
      child: OurProductsPage._(typeVehicle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OurProductsCubit>();
    return MyTapToHideKeyboard(
      child: BlocBuilder<OurProductsCubit, OurProductsState>(
        builder: (context, state) {
          return Scaffold(
            body: MyBody(
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
                        Text(typeVehicle ?? ''),
                        const Text(
                          'Nuestros productos',
                          style: AppTextStyle.h1Style,
                        ),
                        spacerM,
                        MyCustomDropdownButton(
                          hint: 'Todos los productos',
                          hintStyle: AppTextStyle.inputStyle,
                          dropdownItems: state.categories
                              .map((item) => DropdownMenuItem<Category>(
                                    value: item,
                                    child: Text(item.name ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.inputStyle),
                                  ))
                              .toList(),
                          value: state.category,
                          onChanged: (v) async {
                            cubit.category(v);

                            Navigator.pushNamed(
                              context,
                              ProductPage.route,
                              arguments: SearchArgs(
                                category: v,
                              ),
                            );
                          },
                        ),
                        spacerM,
                        MySearchInput(
                          hintText: 'Buscar',
                          onFieldSubmitted: (query) {
                            Navigator.pushNamed(
                              context,
                              ProductPage.route,
                              arguments: SearchArgs(
                                category: state.category,
                                query: query,
                              ),
                            );
                          },
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductPage.route,
                              arguments: SearchArgs(
                                category: state.category,
                                query: state.query,
                              ),
                            );
                          },
                          onChanged: cubit.query,
                        ),
                        spacerL,
                        state.loading
                            ? const MyShimmer(
                                height: 120,
                                margin: EdgeInsets.zero,
                                borderRadius: 3,
                              )
                            : Column(
                                children: state.categories
                                    .map((e) => CardProducts(
                                          icon: Image.network(e.image ?? ''),
                                          title: e.name ?? '',
                                          content: e.subtitle ?? '',
                                          onTap: () => Navigator.pushNamed(
                                              context, ProductPage.route,
                                              arguments:
                                                  SearchArgs(category: e)),
                                        ))
                                    .toList(),
                              )
                      ],
                    ),
                  )
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
