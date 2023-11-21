// import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:developer';
import 'dart:io' as io;
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/domain/model/complaints_categories_model.dart';
import 'package:vemare/app/domain/model/complaints_model.dart';
import '_api_classes.dart';
import '_base_api_url.dart';

class ClaimsRepository {
  final MyApiClient _apiClient;

  ClaimsRepository(this._apiClient);

  Future<List<ComplaintsModel>> getComplaints() async {
    final dynamic res = await _apiClient.getRequest(
      '$BASE_API_URL/api/complaints/types_of_contact',);
    return (res["data"] as List).map(ComplaintsModel.fromJson).toList();
  }

  Future<List<ComplaintsCategoriesModel>> getComplaintsCategories() async {
    final dynamic res = await _apiClient.getRequest(
      '$BASE_API_URL/api/complaints/categories',);
    return (res["data"] as List).map(ComplaintsCategoriesModel.fromJson).toList();
  }

  Future<Map> postComplaintsStore({required io.File? doc,required Map<String,dynamic> body,}) async {
    if(doc != null){
      String fileName = doc.path.split('/').last;
      body['fichero'] = await MultipartFile.fromFile(doc.path,filename: fileName);
    }

    dynamic res = await Dio().post('$BASE_API_URL/api/complaints/store',
        options: Options(headers: allHeaders),
        data: FormData.fromMap(body));
    return res.data;
  }

}

String pdfBase64(String base64) {
  if (base64.length % 4 > 0) {
    return base64 += '=' * (4 - base64.length % 4);
  } else {
    return base64;
  }
}
