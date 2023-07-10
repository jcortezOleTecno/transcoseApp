import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/view/shared/userbloc/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._authRepository,
  ) : super(const UserState()) {
    getUser();
  }

  final AuthRepository _authRepository;

  Future<void> getEmployeesAndEnterprises() async {
    List<Employee> employees = [];
    List<Enterprise> enterprises = [];

    await Future.wait([
      _authRepository.getEmployee().then((v) => employees = v),
      _authRepository.getEnterprise().then((v) => enterprises = v),
    ]);

    emit(state.copyWith(
      employees: employees,
      enterprises: enterprises,
    ));
  }

  Future<void> getUser() async {
    print(' =========================>>   GETUSER');
    if (!LocalDataRepository().isLogged) return;
    UserData? user = await _authRepository.getUser();
    emit(state.copyWith(user: user));
  }

  void deleteUser() {
    emit(state.copyWith(user: null));
  }
}
