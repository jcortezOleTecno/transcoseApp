import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/view/our_products/product/bloc/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._productsRepository,
    Category category,
  ) : super(ProductState(category: category)) {
    fetchData();
  }

  final ProductsRepository _productsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    var detail = await _productsRepository.getCategoryDetail(
      id: state.category!.id!,
    );

    List<Brand> brandsAll = [];
    detail.subcategories?.forEach((e) {
      brandsAll.addAll(e.brands ?? []);
    });
    var brands = brandsAll.toSet().toList();

    emit(state.copyWith(
      details: detail,
      loading: false,
      brands: brands,
    ));
  }
}
