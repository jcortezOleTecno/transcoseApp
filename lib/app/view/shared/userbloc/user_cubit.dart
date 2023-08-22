import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/domain/model/vemare_contacts.dart';
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

    UserData? userData = LocalDataRepository().user;
    Employee? user;

    if (userData != null) {
      user = Employee(
          email: userData.email,
          firstName: userData.name,
          lastName: userData.lastname,
          id: userData.id);
    }

    emit(state.copyWith(
      employees: [user!, ...employees],
      enterprises: enterprises,
    ));
  }

  Future<void> getUser() async {
    VemareContacts? contacts = await _authRepository.getVemareContacts();
    emit(state.copyWith(contacts: contacts));
    if (!LocalDataRepository().isLogged) return;
    UserData? user = await _authRepository.getUser();
    emit(state.copyWith(user: user));
  }

  void deleteUser() {
    emit(state.copyWith(user: null));
  }
}
