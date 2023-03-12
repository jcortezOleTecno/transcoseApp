import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/user_data.dart';

class AuthRepository {
  AuthRepository({
    required this.apiClient,
    required LocalDataRepository localDataRepository,
  }) {
    _localDataRepository = localDataRepository;
  }

  final MyApiClient apiClient;
  late final LocalDataRepository _localDataRepository;

  Future<void> login({required String email, required String password}) async {
    final body = <String, dynamic>{'email': email, 'password': password};
    print(body);
    final dynamic res =
        await apiClient.postRequest('$BASE_API_URL/api/login', body: body);
    print(res);
    _localDataRepository.authToken = res["access_token"];
    final user = UserData.froJson(res['user']);
    _localDataRepository.isLogged = true;
    _localDataRepository.user = user;
  }

  Future<void> register(Map<String, dynamic> data) async {
    print(data);
    final dynamic res =
        await apiClient.postRequest('$BASE_API_URL/api/register', body: data);
    print(res);
  }

  // Future<bool> forgotPassword({required String email}) async {
  //   final dynamic res = await apiClient.postRequest(
  //     '$BASE_API_URL/api/users/forgot-password?Email=$email',
  //   );
  //   return true;
  // }

}
