import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/domain/model/encuesta.dart';

import '_base_api_url.dart';

class EncuestasRepository {
  final MyApiClient _apiClient;

  EncuestasRepository(this._apiClient);

  Future<Encuestas> getEncuestas() async {
    final dynamic res =
        await _apiClient.postRequest('$BASE_API_URL/api/verificar-encuesta');
    print(res);
    return Encuestas.fromJson(res);
  }

  Future<String> sendEncuestas({
    required String id,
    required String stars,
    required String comment,
  }) async {
    try {
      final dynamic res = await _apiClient
          .postRequest('$BASE_API_URL/api/enviar-encuesta', body: {
        "survey_id": id,
        "stars": stars,
        "survey_comment": comment,
      });

      return res["message"];
    } catch (e) {
      print('ERROR $e');
      return 'Error';
    }
  }
}
