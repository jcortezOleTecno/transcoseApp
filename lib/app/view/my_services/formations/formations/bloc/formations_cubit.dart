import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/my_services/formations/formations/bloc/formations_state.dart';

class FormationsCubit extends Cubit<FormationsState> {
  FormationsCubit(
    this._formationsRepository,
  ) : super(const FormationsState()) {
    fetchData();
  }

  final FormationsRepository _formationsRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Formations> formations = await _formationsRepository.getFormations();
    emit(state.copyWith(formations: formations, loading: false));
  }
}
