import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/promotion.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/promotions/detail_sale_rent/detail_sale_rent.dart';
import 'package:vemare/app/view/promotions/promotion/bloc/promotion_cubit.dart';
import 'package:vemare/app/view/promotions/promotion/bloc/promotion_state.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class SearchArgs {
  final Category? category;
  final String? query;

  SearchArgs({this.category, this.query});
}

class PromotionPage extends StatelessWidget {
  const PromotionPage._();

  static const route = '/promotion';

  static Widget create(SearchArgs args) {
    return BlocProvider(
      create: (context) => PromotionCubit(
        getIt.get<PromotionRepository>(),
        args.category,
        args.query,
      ),
      child: const PromotionPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PromotionCubit>();
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: BlocBuilder<PromotionCubit, PromotionState>(
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
                          Text(
                            state.category?.name ?? 'Todas las promociones',
                            style: AppTextStyle.h1Style,
                          ),
                          spacerL,
                          MyCustomDropdownButton(
                            hint: 'Todas las promociones',
                            hintStyle: AppTextStyle.inputStyle,
                            dropdownItems: state.categories
                                .map((item) => DropdownMenuItem<Category>(
                                      value: item,
                                      child: Text(
                                        item.name ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.inputStyle,
                                      ),
                                    ))
                                .toList(),
                            value: state.category,
                            onChanged: cubit.category,
                          ),
                          spacerM,
                          MySearchInput(
                            hintText: 'Buscar por proveedor...',
                            initialValue: state.query,
                            onChanged: cubit.query,
                            onFieldSubmitted: (_) => cubit.search(),
                            onTap: () => cubit.search(),
                          ),
                        ],
                      ),
                    ),
                    spacerL,
                    state.loading
                        ? const MyShimmer(
                            height: 240,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                          )
                        : Column(
                            children:
                                state.promotions.map((e) => _Card(e)).toList(),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card(
    this.promotion, {
    Key? key,
  }) : super(key: key);

  final Promotion promotion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailSaleRent.route,
          arguments: promotion,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(promotion.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Visibility(
                    visible: promotion.renting == 1,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.red500),
                      child: Text(
                        'Renting',
                        style: AppTextStyle.linkStyle.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                if (!promotion.informative && LocalDataRepository().isLogged)
                  Positioned(
                    right: 0,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 3)
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10))),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (!promotion.informative &&
                                  LocalDataRepository().isLogged) ...[
                                if (promotion.pvpLowered != null)
                                  Text(
                                    myFormatMoney(promotion.pvpOriginal ?? 0.0),
                                    style: AppTextStyle.pvpOrinigal,
                                  ),
                                spacerXs,
                                Text(
                                  myFormatMoney(promotion.pvpLowered ??
                                      promotion.pvpOriginal ??
                                      0.0),
                                  style: AppTextStyle.h2Style,
                                ),
                              ],
                            ])),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      promotion.name ?? '',
                      style: AppTextStyle.defaultStyle,
                    ),
                  ),
                  // if (!promotion.informative &&
                  //     LocalDataRepository().isLogged) ...[
                  //   if (promotion.pvpLowered != null)
                  //     Text(
                  //       myFormatMoney(promotion.pvpOriginal ?? 0.0),
                  //       style: AppTextStyle.pvpOrinigal,
                  //     ),
                  //   spacerXs,
                  //   Text(
                  //     myFormatMoney(
                  //         promotion.pvpLowered ?? promotion.pvpOriginal ?? 0.0),
                  //     style: AppTextStyle.h2Style,
                  //   ),
                  // ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
