import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/notifications_repository.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/model/notification.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/view/menu/bloc/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._notificationsRepository, this._workWithUsRepository)
      : super(const MenuState()) {
    getNotifications();
  }

  final NotificationsRepository _notificationsRepository;
  final WorkWithUsRepository _workWithUsRepository;

  Future<void> getNotifications() async {
    if (!LocalDataRepository().isLogged) return;

    WorkWithUs? workWithUs = await _workWithUsRepository.getData();
    List<Notification> data =
        await _notificationsRepository.getNotifications(limit: '2');
    emit(state.copyWith(notifications: data,workWithUs: workWithUs));
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
