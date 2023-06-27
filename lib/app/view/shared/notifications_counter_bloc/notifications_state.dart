import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsCounterState with _$NotificationsCounterState {
  const factory NotificationsCounterState({
    @Default(0) int notifications,
  }) = _NotificationsCounterState;
  const NotificationsCounterState._();
}
