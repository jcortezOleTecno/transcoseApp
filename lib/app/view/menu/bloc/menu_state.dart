import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/user_data.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    @Default(false) bool isOpenMenu,
    @Default(false) bool isOpenNotification,
    // @Default(false) bool isLogged,
    // UserData? user,
  }) = _MenuState;

  const MenuState._();
}
