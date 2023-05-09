import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notifications_repository.dart';
import 'package:vemare/app/domain/model/notification.dart';
import 'package:vemare/app/view/menu/bloc/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._notificationsRepository) : super(const MenuState()) {
    getNotifications();
  }

  final NotificationsRepository _notificationsRepository;

  Future<void> getNotifications() async {
    List<Notification> data =
        await _notificationsRepository.getNotifications(limit: '2');
    emit(state.copyWith(notifications: data));
  }

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
