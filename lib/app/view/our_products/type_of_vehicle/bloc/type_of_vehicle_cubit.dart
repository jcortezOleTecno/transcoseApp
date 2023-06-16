import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/products_repository.dart';

import 'type_of_vehicle_state.dart';

class TypeOfVehicleCubit extends Cubit<TypeOfVehicleState> {
  TypeOfVehicleCubit(this._productsRepository)
      : super(const TypeOfVehicleState()) {
    getTypesOfVehicle();
  }
  final ProductsRepository _productsRepository;

  Future<void> getTypesOfVehicle() async {
    emit(state.copyWith(loading: true));
    var data = await _productsRepository.getTypeOfVehicle();
    emit(state.copyWith(loading: false, types: data));
  }
}
