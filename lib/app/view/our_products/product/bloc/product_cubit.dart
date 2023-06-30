import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';
import 'package:vemare/app/view/our_products/product/bloc/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._productsRepository,
    Category? category,
    String? query,
  ) : super(ProductState(
          category: category,
          query: query,
        )) {
    fetchData();
  }

  final ProductsRepository _productsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    CategoryDetail? detail;
    List<Category> categories = [Category(id: 0, name: 'Todas las categorías')];

    await Future.wait([
      _productsRepository.getProductsCategories().then(categories.addAll),
      _productsRepository
          .getCategoryDetail(
              id: state.category?.id?.toString() ?? '',
              search: state.query ?? '')
          .then((value) => detail = value),
    ]);

    // List<Brand> brandsAll = [];
    // detail?.subcategories?.forEach((e) {
    //   brandsAll.addAll(e.brands ?? []);
    // });
    // var brands = brandsAll.toSet().toList();

    emit(state.copyWith(
      details: detail,
      categories: categories,
      category: state.category != null
          ? categories.firstWhere((e) => e.id == state.category!.id!)
          : null,
      // brands: brands,
      loading: false,
    ));
  }

  void category(Category? category) {
    emit(state.copyWith(category: category));
    search();
  }

  Future<void> search() async {
    emit(state.copyWith(loading: true));
    var data = await _productsRepository.getCategoryDetail(
        id: state.category?.id?.toString() ?? '', search: state.query ?? '');

    // List<Brand> brandsAll = [];
    // data.subcategories?.forEach((e) {
    //   brandsAll.addAll(e.brands ?? []);
    // });
    // var brands = brandsAll.toSet().toList();

    emit(state.copyWith(
      loading: false,
      details: data,
      // brands: brands,
    ));
  }

  void query(String? value) {
    emit(state.copyWith(query: value));
  }
}
