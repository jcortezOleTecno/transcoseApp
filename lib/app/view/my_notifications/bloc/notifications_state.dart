import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/notification.dart';
import 'package:vemare/app/domain/value_object/notifications_type.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(false) bool loading,
    @Default(NotificationType.general) NotificationType type,
    @Default(<Notification>[]) List<Notification> notifications,
  }) = _NotificationsState;
}
