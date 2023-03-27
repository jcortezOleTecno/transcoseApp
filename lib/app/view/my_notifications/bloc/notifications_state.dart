import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/value_object/notifications_type.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(NotificationType.general) NotificationType type,
    @Default(<int>[1, 2, 3, 4]) List<int> notifications,
  }) = _NotificationsState;
}
