import 'package:vemare/app/data/_api_classes.dart';

import '../domain/model/header.dart';
import '_base_api_url.dart';

class HeaderRepository {
  final MyApiClient _apiClient;

  HeaderRepository(this._apiClient);

  Future<dynamic> getHeaders({String? module}) async {
    final dynamic res = await _apiClient.getRequest(
      '$BASE_API_URL/api/header-modules',
      params: {"module": module},
    );
    if (module != null) {
      return Header.fromJson(res);
    } else {
      return (res as List).map(Header.fromJson).toList();
    }
  }
}
