import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/domain/model/user_rol.dart';
import 'package:vemare/app/view/shared/notifications/push_notifications.dart';

class AuthRepository {
  AuthRepository(this.apiClient);

  final MyApiClient apiClient;

  Future<void> login({required String email, required String password}) async {
    final body = <String, dynamic>{
      'email': email,
      'password': password,
      'device_id': tokenFirebase
    };
    final dynamic res =
        await apiClient.postRequest('$BASE_API_URL/api/login', body: body);
    LocalDataRepository().authToken = res["access_token"];
    final user = UserData.froJson(res['user']);
    LocalDataRepository().isLogged = true;
    LocalDataRepository().user = user;
  }

  Future<void> registerEnterprise(Map<String, dynamic> data) async {
    final dynamic res = await apiClient.postRequest(
      '$BASE_API_URL/api/register',
      body: data,
    );
  }

  Future<void> registerEmployee(Map<String, dynamic> data) async {
    final dynamic res = await apiClient.postRequest(
      '$BASE_API_URL/api/register-employee',
      body: data,
    );
  }

  Future<List<UserRol>> getUserRoles() async {
    final dynamic res =
        await apiClient.getRequest('$BASE_API_URL/api/user/roles');
    return (res['data'] as List<dynamic>).map(UserRol.fromJson).toList();
  }

  Future<List<Enterprise>> getEnterprise() async {
    final dynamic res =
        await apiClient.getRequest('$BASE_API_URL/api/user/enterprises');
    return (res['data'] as List<dynamic>).map(Enterprise.fromJson).toList();
  }

  Future<List<Employee>> getEmployee() async {
    try {
      final dynamic res =
          await apiClient.getRequest('$BASE_API_URL/api/user/employee');
      return (res['data'] as List<dynamic>).map(Employee.fromJson).toList();
    } catch (e) {
      return <Employee>[];
    }
  }

  Future<void> getUser() async {
    final dynamic res = await apiClient.getRequest('$BASE_API_URL/api/user');
    final user = UserData.froJson(res['data']);
    LocalDataRepository().user = user;
  }

  Future<void> updateUser() async {
    final dynamic res = await apiClient.getRequest('$BASE_API_URL/api/user');
    final user = UserData.froJson(res['user']);
    LocalDataRepository().user = user;
  }

  // Future<bool> forgotPassword({required String email}) async {
  //   final dynamic res = await apiClient.postRequest(
  //     '$BASE_API_URL/api/users/forgot-password?Email=$email',
  //   );
  //   return true;
  // }

}
