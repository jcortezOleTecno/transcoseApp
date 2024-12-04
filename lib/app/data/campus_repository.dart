import 'dart:convert';
import 'dart:developer';

import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/domain/model/campus_model.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';
import 'package:vemare/app/domain/model/plazas_contratadas_error.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_cubit.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_cubit.dart';

import 'local_data_repository.dart';

class CampusRepository {
  final MyApiClient _apiClient;

  CampusRepository(this._apiClient);

  Future<List<CampusModel>> getCampus() async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/cursos');
    return (res as List).map(CampusModel.fromJson).toList();
  }

  Future<List<CampusModel>> getCampusHome() async {
    List<CampusModel> list = [];
    try{
      final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/cursos');
      List<CampusModel> listAux = (res as List).map(CampusModel.fromJson).toList();
      for (var element in listAux) {
        if(element.homeAppearance == 1){
          list.add(element);
        }
      }
    }catch(e){
      log('message : ${e.toString()}');
    }
    return list;
  }

  Future<List<TopicsModel>> getCampusDetails({required String id}) async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/cursos/temas?course_id=$id&details=1');
    //log('message');
    return (res as List).map(TopicsModel.fromJson).toList();
  }

  Future<List<QuestionTest>> getTest({required String id}) async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/cursos/temas/details?topic_id=$id');
    log('message');
    return (res['questions'] as List).map(QuestionTest.fromJson).toList();
  }

  Future<TestResult> getTestResult({required String id}) async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/cursos/temas/details?topic_id=$id');
    log('message');
    return TestResult.fromJson(res['test']);
  }

  Future posSendTet({required Map<String,dynamic> body}) async {
    try {
      final dynamic res = await _apiClient.postRequest('$BASE_API_URL/api/cursos/temas/answer-test',
          body: jsonEncode(body),
          customHeaders: headerContentTypeApplicationJson
      );
    } catch (e) {
      log('message ${e.toString()}');
    }
  }

  Future posCompletedTet({required Map<String,dynamic> body}) async {
    try {
      final dynamic res = await _apiClient.postRequest('$BASE_API_URL/api/cursos/temas/mark-completed',
          body: body,
      );
      log('message');
    } catch (e) {
      log('message ${e.toString()}');
    }
  }


}
