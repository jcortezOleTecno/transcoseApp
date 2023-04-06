import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/formation.dart';

class FormationsRepository {
  final MyApiClient _apiClient;

  FormationsRepository(this._apiClient);

  Future<List<Formations>> getFormations() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/formaciones');
    return (res as List).map(Formations.fromJson).toList();
  }
}
