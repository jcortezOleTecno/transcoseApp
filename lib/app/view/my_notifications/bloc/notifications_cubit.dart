import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notifications_repository.dart';
import 'package:vemare/app/domain/model/notification.dart';
import 'package:vemare/app/domain/value_object/notifications_type.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_state.dart';

import '../../shared/notifications_counter_bloc/notifications_cubit.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
      this._notificationsRepository, this._notificationsCounterCubit)
      : super(const NotificationsState()) {
    getNotifications();
  }

  final NotificationsRepository _notificationsRepository;
  final NotificationsCounterCubit _notificationsCounterCubit;

  Future<void> getNotifications({String? type}) async {
    emit(state.copyWith(loading: true));
    List<Notification> data =
        await _notificationsRepository.getNotifications(tipo: type);

    emit(state.copyWith(
        notifications: data.where((e) => e.delete == 0).toList(),
        loading: false));

    for (var e in data) {
      if (e.dataNotification == null && e.read != 'visto') {
        _notificationsCounterCubit.deleteNotification(e.id!);
      }
    }
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
