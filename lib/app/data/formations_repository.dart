import 'dart:convert';
import 'dart:developer';

import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/locations.dart';
import 'package:vemare/app/domain/model/plazas_contratadas_error.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_cubit.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_cubit.dart';

import 'local_data_repository.dart';

class FormationsRepository {
  final MyApiClient _apiClient;

  FormationsRepository(this._apiClient);

  Future<List<TrainigGroup>> getTrainingGroup() async {
    String dataUser = SharedPreferencesLocal.veraneDAuthUser;
    if(dataUser.isNotEmpty){
      dataUser = jsonDecode(dataUser)['id'].toString();
    }
    final dynamic res =
    await _apiClient.getRequest('$BASE_API_URL/api/grupos-formativos',
        params: <String, dynamic>{
          'user_id': dataUser.isEmpty ? '0' : dataUser,
        });
    return (res as List).map(TrainigGroup.fromJson).toList();
  }

  Future<List<Formation>> getFormations(int formationGroupId) async {
    final dynamic res = await _apiClient.getRequest(
      '$BASE_API_URL/api/formaciones',
      params: {"formation_group_id": formationGroupId.toString()},
    );
    return (res as List).map(Formation.fromJson).toList();
  }

  Future<EnrollResponse> enrollFormations({
    required int dateId,
    List<int>? idsEmployees,
    List<Employee>? persons,
  }) async {
    final user = LocalDataRepository().user;

    idsEmployees!.add(user!.id);
    final data = {
      'date_id': dateId,
      'employee': idsEmployees.join(',').toString(),
      'persons': persons?.map((e) => e.toEnrollData()).toList(),
    };

    log(jsonEncode(data));

    var res = await _apiClient.postRequest(
        '$BASE_API_URL/api/formaciones/inscripcion',
        body: jsonEncode(data),
        customHeaders: headerContentTypeApplicationJson);

    return EnrollResponse(res["response"] == "success", res["message"]);
  }

  Future<List<Locations>> getLocationsFormations(int id) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/formaciones/ubicaciones',
        params: {"id": id.toString()});
    return (res["locations"] as List).map(Locations.fromJson).toList();
  }

  Future<PLazasContratadasError?> getPlazasContratadas(int id) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/formaciones/ubicaciones',
        params: {"id": id.toString()});
    if (res["response"] == 'error') {
      return PLazasContratadasError.fromJson(res);
    }
    return null;
  }

  Future<CalendarResponse> getHorariosFormations(
      int id, String location) async {
    final dynamic res = await _apiClient
        .getRequest('$BASE_API_URL/api/formaciones/calendario', params: {
      "formation_id": id.toString(),
      "location": location,
    });
    return CalendarResponse(
      horarios: (res["data"]["horario"] as List).map(Horario.fromJson).toList(),
      showCalendar: res["data"]["show_calendar"] as bool,
    );
  }

  Future<List<Formation>> getRegisteredTrainings({String search = '', String formationGroupId = '', String orderByDateLocation = 'desc'}) async {

    String url = '/api/formaciones/inscritas?orderByDateLocation=$orderByDateLocation';
    if(search.isNotEmpty){ url = '$url&search=$search'; }
    if(formationGroupId.isNotEmpty){ url = '$url&formationGroupId=$formationGroupId'; }
    final dynamic res =
    await _apiClient.getRequest('$BASE_API_URL$url');
    return (res['data'] as List).map(Formation.fromJson).toList();
  }
}
