import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/menu/bloc/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._localDataRepository)
      : super(
          MenuState(
              isLogged: _localDataRepository.isLogged,
              user: _localDataRepository.user),
        );

  final LocalDataRepository _localDataRepository;

  void toggleMenu() {
    emit(state.copyWith(
      isOpenMenu: !state.isOpenMenu,
      isOpenNotification: false,
    ));
  }

  void toggleNotification() {
    emit(state.copyWith(
      isOpenNotification: !state.isOpenNotification,
      isOpenMenu: false,
    ));
  }
}
