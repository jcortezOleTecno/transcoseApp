import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/our_products/detail_product/detail_product.dart';
import 'package:vemare/app/view/our_products/product/bloc/product_cubit.dart';
import 'package:vemare/app/view/our_products/search_my_product/search_my_product_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/product_state.dart';

class ProductPage extends StatelessWidget {
  const ProductPage._();

  static const route = '/products';

  static Widget create(Category categoty) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt.get<ProductsRepository>(),
        categoty,
      ),
      child: const ProductPage._(),
    );
  }

  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];
  // String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
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
                          Row(
                            children: [
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
                              Text(
                                state.category?.name ?? '',
                                style: AppTextStyle.h1Style,
                              ),
                            ],
                          ),
                          spacerM,
                          Text(
                            state.category?.subtitle ?? '',
                            style: AppTextStyle.defaultStyle,
                          ),
                          spacerM,
                          Center(
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SearchMyProductPage.route,
                                    arguments: state.category);
                              },
                              label: Image.asset(
                                'assets/icons/arrow_next.png',
                                scale: 2,
                              ),
                              icon: Text(
                                'Buscar mi ${state.category?.name ?? ''}',
                                style: AppTextStyle.linkStyle,
                              ),
                            ),
                          ),
                          spacerM,
                          // MyCustomDropdownButton(
                          //   hint: 'Todos los productos',
                          //   dropdownItems: items
                          //       .map((item) => DropdownMenuItem(
                          //             value: item,
                          //             child: Text(
                          //               item,
                          //               overflow: TextOverflow.ellipsis,
                          //               maxLines: 1,
                          //               style: const TextStyle(
                          //                 fontSize: 14,
                          //               ),
                          //             ),
                          //           ))
                          //       .toList(),
                          //   value: selectedValue,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       selectedValue = value;
                          //     });
                          //   },
                          // ),
                          // spacerM,
                          const MySearchInput(),
                        ],
                      ),
                    ),
                    spacerS,
                    _listBrands(context, brands: state.brands),
                    spacerS,
                    if (!state.loading && state.details != null)
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
      {required CategoryDetail cat}) {
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
                    const MySpacer(height: 60),
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
                      cat.description ?? '',
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
