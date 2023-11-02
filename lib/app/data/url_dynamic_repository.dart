import 'dart:developer';
import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';

class UrlDynamicRepository {
  UrlDynamicRepository(this.apiClient);

  final MyApiClient apiClient;

  Future<String?> getTotem() async {
    final body = <String, dynamic>{
      'clv': '4NkL\$86@wVU0',
    };
    final dynamic res = await apiClient.postRequestDynamic(
        '$BASE_API_URL_DYNAMIC/totem',
        body: body,
        customHeaders: headerContentTypeApplicationUrlencoded
    );
    return res["totem"];
  }

  Future<String?> getUrl({required totem}) async {
    final body = <String, dynamic>{
      'totem': totem,
    };
    final dynamic res = await apiClient.postRequestDynamic(
        '$BASE_API_URL_DYNAMIC/app_url_conexion',
        body: body,
        customHeaders: headerContentTypeApplicationUrlencoded
    );
    return res["url_data"] ?? '';
  }

  Future<Map<String,dynamic>> getFooter() async {
    final dynamic res = await apiClient.getRequest(
        '$BASE_API_URL/api/footer-data',
        customHeaders: allHeaders
    );
    return res ?? {};
  }
}
