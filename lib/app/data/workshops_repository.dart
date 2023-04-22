import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/workshop.dart';

class WorkShopsRepository {
  final MyApiClient _apiClient;

  WorkShopsRepository(this._apiClient);

  Future<List<WorkShop>> getWorkShops() async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/talleres',
        params: <String, dynamic>{'limit': '3'});
    return (res as List).map(WorkShop.froJson).toList();
  }

  Future<void> setForm({
    required String name,
    required String email,
    required String phone,
    required String observation,
    required String workshopId,
  }) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/talleres/solicitar',
        body: <String, dynamic>{
          "name": name,
          "email": email,
          "phone": phone,
          "observation": observation,
          "workshop_id": workshopId,
        });
    print(res);
  }
}
