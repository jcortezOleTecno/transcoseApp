import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/domain/model/header.dart';

import '../../../../domain/model/category.dart';
import 'type_of_vehicle_state.dart';

class TypeOfVehicleCubit extends Cubit<TypeOfVehicleState> {
  TypeOfVehicleCubit(
    this._productsRepository,
    this._headerRepository,
    Category? category,
  ) : super(TypeOfVehicleState(category: category)) {
    getTypesOfVehicle();
  }
  final ProductsRepository _productsRepository;
  final HeaderRepository _headerRepository;

  Future<void> getTypesOfVehicle() async {
    if (state.category != null) return;
    emit(state.copyWith(loading: true));
    var data = await _productsRepository.getTypeOfVehicle();
    Header header = await _headerRepository.getHeaders(module: "Category");
    emit(state.copyWith(loading: false, types: data, header: header));
  }
}
