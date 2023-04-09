import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/view/shared/bloc/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._authRepository,
  ) : super(const UserState());

  final AuthRepository _authRepository;

  Future<void> getEmployeesAndEnterprises() async {
    List<Employee> employees = [];
    List<Enterprise> enterprises = [];

    await Future.wait([
      _authRepository.getEmployee().then((v) => employees = v),
      _authRepository.getEnterprise().then((v) => enterprises = v),
    ]);

    emit(state.copyWith(employees: employees, enterprises: enterprises));
  }
}
