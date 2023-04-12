import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/warranty.dart';

class WarrantyRepository {
  final MyApiClient _apiClient;

  WarrantyRepository(this._apiClient);

  Future<List<Warranty>> getWarranties(
      {String? startDate = '', String? endDate = ''}) async {
    final dynamic res = await _apiClient.postRequest(
        '$BASE_API_URL/api/mi-cuenta/garantias',
        body: <String, dynamic>{'start_date': startDate, 'end_date': endDate});
    return (res["datos"]["garantias"] as List).map(Warranty.fromJson).toList();
  }
}
