import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';

import 'available_destinations_formations_state.dart';

class AvailableDestinationsFormationsCubit
    extends Cubit<AvailableDestinationsFormationsState> {
  AvailableDestinationsFormationsCubit(
    this._formationsRepository,
    Formation formation,
  ) : super(AvailableDestinationsFormationsState(formation: formation)) {
    fetchData();
  }

  final FormationsRepository _formationsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Locations> data = await _formationsRepository
        .getLocationsFormations(state.formation!.id!);
    emit(state.copyWith(
      location: data.where((e) => !e.centerReference).toList(),
      locationReferences: data.where((e) => e.centerReference).toList(),
      loading: false,
    ));
  }
}
