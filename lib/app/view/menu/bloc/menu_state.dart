import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/notification.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    @Default(false) bool isOpenMenu,
    @Default(false) bool isOpenNotification,
    @Default(<Notification>[]) List<Notification> notifications,
    WorkWithUs? workWithUs
  }) = _MenuState;

  const MenuState._();
}
