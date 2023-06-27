import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notifications_repository.dart';

import 'notifications_state.dart';

class NotificationsCounterCubit extends Cubit<NotificationsCounterState> {
  NotificationsCounterCubit(this._repository)
      : super(const NotificationsCounterState()) {
    getNotifications();
  }

  final NotificationsRepository _repository;

  Future<void> getNotifications() async {
    var data = await _repository.getNotifications();
    addNotification(
        quantity: data.where((e) => e.read != 'visto' && e.delete == 0).length);
  }

  void addNotification({required int quantity}) {
    emit(state.copyWith(notifications: quantity));
  }

  void deleteNotification(int id) {
    unawaited(_repository.marckReadNotification(id: id.toString()));
    emit(state.copyWith(notifications: state.notifications - 1));
  }
}
