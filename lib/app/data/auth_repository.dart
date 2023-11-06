import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_data.dart';
import 'package:vemare/app/domain/model/user_rol.dart';
import 'package:vemare/app/domain/model/vemare_contacts.dart';
import 'package:vemare/app/view/shared/notifications/push_notifications.dart';

class AuthRepository {
  AuthRepository(this.apiClient);

  final MyApiClient apiClient;

  Future<void> login({required String email, required String password}) async {

    final body = <String, dynamic>{
      'email': email,
      'password': password,
      'device_id': tokenFirebase ?? ''
    };
    final dynamic res = await apiClient.postRequest('$BASE_API_URL/api/login', body: body);



    LocalDataRepository().authToken = res["access_token"];
    final user = UserData.fromJson(res['user']);
    LocalDataRepository().isLogged = true;
    LocalDataRepository().user = user;
  }

  Future<String?> recoverPassword({required String email}) async {
    final body = <String, dynamic>{'email': email};
    final dynamic res = await apiClient
        .postRequest('$BASE_API_URL/api/recovery-password', body: body);
    return res["message"];
  }

  /*
  ERROR=>
  {
    "error": "error",
    "message": "Lo sentimos, no hemos podido encontrar ningún usuario registrado con el correo electrónico ingresado. Por favor, asegúrate de que el correo electrónico ingresado sea el correcto e inténtalo de nuevo."
}
SUCCESS
{
    "response": "success",
    "message": "Se ha enviado un correo a empresa@gmail.com para restablecer la contraseña. Por favor, revisa tu bandeja de entrada e sigue las instrucciones. Si necesitas ayuda, contáctanos."
}
  */

  Future<void> registerEnterprise(Map<String, dynamic> data) async {
    await apiClient.postRequest(
      '$BASE_API_URL/api/register',
      body: data,
    );
  }

  Future<void> registerEmployee(Map<String, dynamic> data) async {
    await apiClient.postRequest(
      '$BASE_API_URL/api/register-employee',
      body: data,
    );
  }

  Future<List<UserRol>> getUserRoles() async {
    final dynamic res =
        await apiClient.getRequest('$BASE_API_URL/api/user/roles');
    return (res['data'] as List<dynamic>).map(UserRol.fromJson).toList();
  }

  Future<List<Enterprise>> getEnterprise() async {
    final dynamic res =
        await apiClient.getRequest('$BASE_API_URL/api/user/enterprises');
    return (res['data'] as List<dynamic>).map(Enterprise.fromJson).toList();
  }

  Future<List<Employee>> getEmployee() async {
    try {
      final dynamic res =
          await apiClient.getRequest('$BASE_API_URL/api/user/employee');
      return (res['data'] as List<dynamic>).map(Employee.fromJson).toList();
    } catch (e) {
      return <Employee>[];
    }
  }

  Future getUser() async {
    try{
      final dynamic res = await apiClient.getRequest('$BASE_API_URL/api/user');
      final user = UserData.fromJson(res['data']);
      LocalDataRepository().user = user;
    }catch(e){
      log(e.toString());
    }
  }

  Future<String?> updateUser({
    File? logo,
    String? name,
    String? email,
    String? code,
    String? cif,
    String? phone,
    String? address,
    String? city,
    String? province,
    String? postalCode,
  }) async {
    String fileName = 'logo.png';
    var token = LocalDataRepository().authToken;
    Response res = await Dio().post('$BASE_API_URL/api/user/update',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }),
        data: FormData.fromMap({
          "logo": logo != null
              ? await MultipartFile.fromFile(
                  logo.path,
                  filename: fileName,
                )
              : "",
          "name": name ?? "",
          "email": email ?? "",
          "code": code ?? "",
          "cif": cif ?? "",
          "phone": phone ?? "",
          "address": address ?? "",
          "city": city ?? "",
          "province": province ?? "",
          "postalCode": postalCode ?? "",
        }));

    return (res.data["message"] as String);
  }

  // Future<List<String>> getEnterprisesSearch({required String term}) async {
  //   final dynamic res = await apiClient.getRequest(
  //       '$BASE_API_URL/api/user/enterprises',
  //       params: {"term": term});
  //   return (res as List).map((e) => e["value"] as String).toList();
  // }

  Future<VemareContacts> getVemareContacts() async {

    log('BASE_API_URL : $BASE_API_URL');
    VemareContacts? vemareContacts;
    try{
      final dynamic res = await apiClient.getRequest(
          '$BASE_API_URL/api/mis_contactos_vemare',
          params: {"code": LocalDataRepository().user?.code ?? ''});
      vemareContacts = VemareContacts.fromJson(res);
    }catch(e){
      log(e.toString());
    }
    return vemareContacts!;
  }

  Future<bool> deleteUser() async {
    try {
      await apiClient.postRequest('$BASE_API_URL/api/user/delete');
      return true;
    } catch (e) {
      return false;
    }
  }
}
