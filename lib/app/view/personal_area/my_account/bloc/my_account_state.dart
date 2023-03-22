import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/user_data.dart';

part 'my_account_state.freezed.dart';

@freezed
class MyAccountState with _$MyAccountState {
  const factory MyAccountState({
    UserData? user,
  }) = _MyAccountState;
}
