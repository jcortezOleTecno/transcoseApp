import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/we_help_you.dart';

class ServicesRepository {
  final MyApiClient _apiClient;

  ServicesRepository(this._apiClient);

  Future<List<Services>> getServices({int limit = 0}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/servicios',
        params: <String, dynamic>{'limit': '$limit'});
    return (res as List).map(Services.froJson).toList();
  }

  Future<WeHelpYou> getWeHelpYou() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/servicios/te_ayudamos');
    return WeHelpYou.fromJson(res);
  }

  Future<void> setForm({
    required String name,
    required String email,
    required String phone,
    required String province,
    required String city,
    required String message,
  }) async {
    await _apiClient.postRequest('$BASE_API_URL/api/formulario_contacto',
        body: <String, dynamic>{
          "name": name,
          "email": email,
          "phone": phone,
          "province": province,
          "city": city,
          "message": message,
        });
  }
}
