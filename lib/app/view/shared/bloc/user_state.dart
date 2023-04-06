import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/employee.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(<Employee>[]) List<Employee> employees,
  }) = _UserState;
  const UserState._();
}
