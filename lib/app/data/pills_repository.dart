import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/pills.dart';

class PillsRepository {
  final MyApiClient _apiClient;

  PillsRepository(this._apiClient);

  Future<PillsResponse> getPills({required int limit}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/pildoras',
        params: <String, dynamic>{'limit': '$limit'});
    return PillsResponse(
      pills: (res["data"] as List).map(Pills.fromJson).toList(),
      mostRead: (res["most_read"] as List).map(Pills.fromJson).toList(),
    );
  }
}

class PillsResponse {
  final List<Pills> mostRead;
  final List<Pills> pills;

  PillsResponse({required this.mostRead, required this.pills});
}
