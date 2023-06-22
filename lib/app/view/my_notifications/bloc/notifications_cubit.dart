import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notifications_repository.dart';
import 'package:vemare/app/domain/model/notification.dart';
import 'package:vemare/app/domain/value_object/notifications_type.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._notificationsRepository)
      : super(const NotificationsState()) {
    getNotifications();
  }

  final NotificationsRepository _notificationsRepository;

  Future<void> getNotifications({String? type}) async {
    emit(state.copyWith(loading: true));
    List<Notification> data =
        await _notificationsRepository.getNotifications(tipo: type);
    emit(state.copyWith(
        notifications: data.where((e) => e.delete == 1).toList(),
        loading: false));
  }

  void deleteNotification(int id) {
    unawaited(_notificationsRepository.deleteNotification(id: id.toString()));

    emit(
      state.copyWith(
        notifications: state.notifications.where((e) => e.id != id).toList(),
      ),
    );
  }

  Future<void> getNotificationsType(NotificationType type) async {
    switch (type) {
      case NotificationType.general:
        await getNotifications();
        break;

      case NotificationType.events:
        await getNotifications(type: 'Event');
        break;
      case NotificationType.promotions:
        await getNotifications(type: 'Promotion');
        break;
      case NotificationType.formations:
        await getNotifications(type: 'Formation');
        break;
      case NotificationType.sat:
        await getNotifications(type: 'SAT');
        break;
      default:
        await getNotifications();
        break;
    }
  }
}
