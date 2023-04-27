import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/promotions/promotions_categories/bloc/promotions_cubit.dart';
import 'package:vemare/app/view/promotions/promotions_categories/bloc/promotions_state.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../promotion/promotion_page.dart';

class PromotionsPage extends StatelessWidget {
  const PromotionsPage._();
  static const route = '/promotions';

  static Widget create() {
    return BlocProvider(
      create: (context) => PromotionsCubit(
        getIt.get<PromotionRepository>(),
      ),
      child: const PromotionsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PromotionsCubit>();
    return MyTapToHideKeyboard(
      child: BlocBuilder<PromotionsCubit, PromotionsState>(
        builder: (context, state) {
          return Scaffold(
            body: MyBody(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/imgs/promotions_img.png'),
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          spacerM,
                          const Text(
                            'Promociones',
                            style: AppTextStyle.h1Style,
                          ),
                          spacerM,
                          const Text(
                            'Accede a nuestras campañas mensuales y obtén precios y ofertas especiales para tu negocio.',
                            style: AppTextStyle.defaultStyle,
                          ),
                          spacerM,
                          MyCustomDropdownButton<Category>(
                            hint: 'Todas las promociones',
                            hintStyle: AppTextStyle.inputStyle,
                            dropdownItems: state.categories
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item.name ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.inputStyle,
                                      ),
                                    ))
                                .toList(),
                            value: state.categorySelected,
                            onChanged: (v) {
                              cubit.category(v);
                              Navigator.pushNamed(
                                context,
                                PromotionPage.route,
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
                                PromotionPage.route,
                                arguments: SearchArgs(
                                  category: state.categorySelected,
                                  query: query,
                                ),
                              );
                            },
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                PromotionPage.route,
                                arguments: SearchArgs(
                                  category: state.categorySelected,
                                  query: state.query ?? '',
                                ),
                              );
                            },
                            onChanged: cubit.query,
                          ),
                        ],
                      ),
                    ),
                    spacerXL,
                    state.categories.isEmpty
                        ? const MyShimmer(
                            height: 100,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                          )
                        : Column(
                            children: state.categories.map((e) {
                            return MySingleCard(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PromotionPage.route,
                                  arguments: SearchArgs(
                                    category: e,
                                  ),
                                );
                              },
                              title: e.name ?? '',
                              content: e.subtitle ?? '',
                              icon: Image.network(e.image!),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 15),
                            );
                          }).toList()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
