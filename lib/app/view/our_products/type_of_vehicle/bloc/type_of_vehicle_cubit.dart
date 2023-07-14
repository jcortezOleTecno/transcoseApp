import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/products_repository.dart';

import '../../../../domain/model/category.dart';
import 'type_of_vehicle_state.dart';

class TypeOfVehicleCubit extends Cubit<TypeOfVehicleState> {
  TypeOfVehicleCubit(
    this._productsRepository,
    Category? category,
  ) : super(TypeOfVehicleState(category: category)) {
    getTypesOfVehicle();
  }
  final ProductsRepository _productsRepository;

  Future<void> getTypesOfVehicle() async {
    if (state.category != null) return;
    emit(state.copyWith(loading: true));
    var data = await _productsRepository.getTypeOfVehicle();
    emit(state.copyWith(loading: false, types: data));
  }
}
