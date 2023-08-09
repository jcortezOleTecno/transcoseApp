import 'dart:developer';

import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/brand.dart';

class BrandsRepository {
  final MyApiClient _apiClient;

  BrandsRepository(this._apiClient);

  Future<List<Brand>> getBrands() async {
    try {
      final dynamic res = await _apiClient.getRequest(
          '$BASE_API_URL/api/marcas',
          params: <String, dynamic>{'limit': '6'});
      return (res as List).map(Brand.froJson).toList();
    } catch (e) {
      log('ERROR $e');
      return [];
    }
  }
}
