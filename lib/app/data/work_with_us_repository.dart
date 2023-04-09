import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/api_response.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/phone.dart';

class WorkWithUsRepository {
  final MyApiClient _apiClient;

  WorkWithUsRepository(this._apiClient);

  Future<String?> formRequest({
    required File doc,
    required Name name,
    required Phone phone,
    required Email email,
  }) async {
    String fileName = doc.path.split('/').last;
    dynamic res = await Dio().post('$BASE_API_URL/api/form_request',
        options: Options(headers: allHeaders),
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(
            doc.path,
            filename: fileName,
          ),
          "name": name.value,
          "email": email.value,
          "phone": phone.value,
        }));
    return ApiResponse.fromJson(res.data).message;
  }
}
