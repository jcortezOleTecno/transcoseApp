import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/view/shared/bloc/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._authRepository,
  ) : super(const UserState());

  final AuthRepository _authRepository;

  Future<void> getEmployees() async {
    List<Employee> employees = await _authRepository.getEmployee();
    emit(state.copyWith(employees: employees));
  }
}
