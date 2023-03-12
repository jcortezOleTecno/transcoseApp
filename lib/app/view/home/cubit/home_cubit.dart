import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._localDataRepository)
      : super(HomeState(
          user: _localDataRepository.user,
          isLogged: _localDataRepository.isLogged,
        ));

  final LocalDataRepository _localDataRepository;
}
