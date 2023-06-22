import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';

import 'skillful_formation_state.dart';

class SkillfulFormationCubit extends Cubit<SkillfulFormationState> {
  SkillfulFormationCubit(this._formationsRepository, TrainigGroup? trainigGroup)
      : super(SkillfulFormationState(trainigGroup: trainigGroup)) {
    getFormations();
  }

  final FormationsRepository _formationsRepository;

  Future<void> getFormations() async {
    emit(state.copyWith(loading: true));
    List<Formation> data =
        await _formationsRepository.getFormations(state.trainigGroup!.id!);
    emit(state.copyWith(formations: data, loading: false));
  }
}
