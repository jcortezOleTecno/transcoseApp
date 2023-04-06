import 'package:bloc/bloc.dart';
import 'package:vemare/app/view/menu/bloc/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuState());

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
