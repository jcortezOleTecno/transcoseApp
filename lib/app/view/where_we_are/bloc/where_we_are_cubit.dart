import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/domain/model/center.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';

class WhereWeAreCubit extends Cubit<WhereWeAreState> {
  WhereWeAreCubit(
    this._centerRepository,
  ) : super(const WhereWeAreState()) {
    fetchData();
  }

  final CenterRepository _centerRepository;

  Future<void> fetchData() async {
    List<Center> centers = await _centerRepository.getCenters(limit: 0);
    emit(state.copyWith(centers: centers));
  }
}
