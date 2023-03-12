import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/user_data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLogged,
    UserData? user,
  }) = _HomeState;
  const HomeState._();
}
