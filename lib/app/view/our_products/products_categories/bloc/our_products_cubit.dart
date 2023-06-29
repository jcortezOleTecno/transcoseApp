import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/type_of_vehicle.dart';
import 'package:vemare/app/view/our_products/products_categories/bloc/our_products_state.dart';

class OurProductsCubit extends Cubit<OurProductsState> {
  OurProductsCubit(this._productsRepository, TypeOfVehicle? typeOfVehicle)
      : super(OurProductsState(typeOfVehicle: typeOfVehicle)) {
    fetchData();
  }

  final ProductsRepository _productsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Category> categories = [];

    await Future.wait([
      _productsRepository
          .getProductsCategories(
              vehicletypesid: state.typeOfVehicle?.id?.toString() ?? '')
          .then((v) => categories.addAll(v))
    ]);

    emit(state.copyWith(categories: categories, loading: false));
  }

  void category(Category? category) {
    emit(state.copyWith(category: category));
  }

  void query(String? value) {
    emit(state.copyWith(query: value));
  }
}
