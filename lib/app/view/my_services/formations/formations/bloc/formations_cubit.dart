import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/view/my_services/formations/formations/bloc/formations_state.dart';

class FormationsCubit extends Cubit<FormationsState> {
  FormationsCubit(
      this._formationsRepository,
      this._headerRepository,
      ) : super(const FormationsState()) {
    fetchData();
  }

  final FormationsRepository _formationsRepository;
  final HeaderRepository _headerRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<TrainigGroup> formations = await _formationsRepository.getTrainingGroup();
    List<Header> headers = await _headerRepository.getHeaders();
    emit(state.copyWith(
      formations: formations,
      loading: false,
      headers: headers,
    ));
  }
}
