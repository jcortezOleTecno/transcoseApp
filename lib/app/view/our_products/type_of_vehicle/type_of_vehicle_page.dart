import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/products_categories/our_products_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle/bloc/type_of_vehicle_state.dart';
import 'package:vemare/app/view/promotions/promotion/promotion_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/type_of_vehicle_cubit.dart';

class TypeOfVehiclePage extends StatelessWidget {
  const TypeOfVehiclePage._();
  static const route = '/type_of_vehicle';

  static Widget create(Category? category) {
    return BlocProvider(
      create: (context) => TypeOfVehicleCubit(
        getIt<ProductsRepository>(),
        getIt<HeaderRepository>(),
        category,
      ),
      child: const TypeOfVehiclePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TypeOfVehicleCubit, TypeOfVehicleState>(
        builder: (context, state) {
          return MyBody(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                            child: Column(
                              children: [
                                Text(state.header?.title ?? '', style: AppTextStyle.h1Style),
                                spacerS,
                                Text(state.header?.description ?? ''),
                                spacerM,
                                if (state.loading)
                                  ...List.generate(
                                      2,
                                          (_) => const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: MyShimmer(
                                          height: 220,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                        ),
                                      )),
                                ...state.types
                                    .map(
                                      (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, OurProductsPage.route,
                                          arguments: e),
                                      child: TypeVehicleCard(
                                          title: e.name ?? '',
                                          img: e.image ?? '',
                                          subtitle: e.subtitle ?? ''),
                                    ),
                                  ),
                                )
                                    .toList(),
                                if (state.category != null)
                                  ...state.category!.typeVehicle!
                                      .map(
                                        (e) => Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(
                                            context, ProductPage.route,
                                            arguments:
                                            SearchArgs(category: state.category)),
                                        child: TypeVehicleCard(
                                            title: e.name ?? '',
                                            img: e.image ?? '',
                                            subtitle: e.subtitle ?? ''),
                                      ),
                                    ),
                                  )
                                      .toList(),
                              ],
                            ),
                          ),
                          const Footer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class TypeVehicleCard extends StatelessWidget {
  const TypeVehicleCard(
      {required this.title,
      required this.subtitle,
      required this.img,
      Key? key})
      : super(key: key);
  final String title;
  final String subtitle;
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MyNetworkImage(image: img, fit: BoxFit.cover),
            // Image(
            //   image: NetworkImage(img),
            //   fit: BoxFit.cover,
            // ),
            const MyFilterImage(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTextStyle.h2Style
                                  .copyWith(color: AppColor.white),
                            ),
                            Text(
                              subtitle,
                              style: AppTextStyle.titleCard
                                  .copyWith(color: AppColor.white),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/arrow_next.png',
                        color: AppColor.white,
                        scale: 2,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
