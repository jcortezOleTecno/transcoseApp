import 'package:bloc/bloc.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState());

  void deleteNotification(int i) {
    emit(
      state.copyWith(
        notifications: state.notifications
            .where((e) => e != state.notifications[i])
            .toList(),
      ),
    );
  }
}
