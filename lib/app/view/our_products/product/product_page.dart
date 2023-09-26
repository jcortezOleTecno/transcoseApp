import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/product/bloc/product_cubit.dart';
import 'package:vemare/app/view/promotions/promotion/promotion_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/product_state.dart';

class ProductPage extends StatelessWidget {
  const ProductPage._();

  static const route = '/products';

  static Widget create(SearchArgs args) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt.get<ProductsRepository>(),
        args.category,
        args.query,
      ),
      child: const ProductPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductState>(
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
                          Row(
                            children: [
                              if (state.category?.id != 0)
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.blue100,
                                  ),
                                  height: 60,
                                  width: 60,
                                  child: Image.network(
                                    state.category!.image!,
                                  ),
                                ),
                              spacerS,
                              Expanded(
                                child: Text(
                                  state.category?.name ?? 'Todos los productos',
                                  style: AppTextStyle.h1Style,
                                ),
                              ),
                            ],
                          ),
                          spacerS,
                          MyHtml(text: state.category?.description ?? ''),
                          // Text(
                          //   state.category?.subtitle ?? '',
                          //   style: AppTextStyle.defaultStyle,
                          // ),
                          // spacerL,
                          // if (state.category?.id != 0)
                          //   Center(
                          //     child: TextButton.icon(
                          //       onPressed: () {
                          //         Navigator.pushNamed(
                          //             context, SearchMyProductPage.route,
                          //             arguments: state.category);
                          //       },
                          //       label: Image.asset(
                          //         'assets/icons/arrow_next.png',
                          //         scale: 2,
                          //       ),
                          //       icon: Text(
                          //         'Buscar mi ${state.category?.name ?? ''}',
                          //         style: AppTextStyle.linkStyle,
                          //       ),
                          //     ),
                          //   ),
                          // spacerL,
                          MyCustomDropdownButton(
                            hint: 'Todos los productos',
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
                            hintText: 'Buscar por palabras claves',
                            initialValue: state.query,
                            onChanged: cubit.query,
                            onFieldSubmitted: (_) => cubit.search(),
                            onTap: () => cubit.search(),
                          ),
                        ],
                      ),
                    ),
                    spacerS,
                    _listBrands(context, brands: state.details?.brands ?? []),
                    spacerS,
                    if (state.loading)
                      ...List.generate(
                          3,
                          (_) => const MyShimmer(
                                height: 200,
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                              )),
                    if (!state.loading && state.details != null)
                      // _cardCategory(context, cat: state.details!),
                      ...state.details!.subcategories!
                          .map(
                            (e) => _cardCategory(context, cat: e),
                          )
                          .toList(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox _listBrands(BuildContext context, {required List<Brand> brands}) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .5,
      child: PageView.builder(
        itemCount: brands.length,
        controller: PageController(initialPage: 1, viewportFraction: 0.5),
        itemBuilder: (context, i) => ClipRRect(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(120),
            ),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Image.network(
              brands[i].image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _cardCategory(BuildContext context,
      {required Subcategory cat}) {
    final state = context.read<ProductCubit>().state;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailProductPage.route,
          arguments:
              DetailProductPageArg(cat: cat, icon: state.category?.image ?? ''),
        );
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(cat.image!),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const MyFilterImage(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          cat.name ?? '',
                          style: AppTextStyle.h3Style.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.white),
                        ),
                        spacerExpanded,
                        Image.asset(
                          'assets/icons/arrow_next.png',
                          scale: 2,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                    spacerS,
                    Text(
                      cat.subtitle ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.contentCard
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
