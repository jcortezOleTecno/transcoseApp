import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/domain/model/vemare_contacts.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(<Employee>[]) List<Employee> employees,
    @Default(<Enterprise>[]) List<Enterprise> enterprises,
    VemareContacts? contacts,
    UserData? user,
  }) = _UserState;
  const UserState._();
}
