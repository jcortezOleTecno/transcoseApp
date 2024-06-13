import 'package:flutter/material.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/domain/model/rrhh_models.dart';
import 'package:vemare/app/domain/model/services.dart';

class WorkWithUsHomeProvider with ChangeNotifier{

  WorkWithUsHomeProvider({required this.workWithUsRepository, required this.headerRepository}){
    initialData();
  }

  final WorkWithUsRepository workWithUsRepository;
  final HeaderRepository headerRepository;

  bool _loading = true;
  bool get loading => _loading;
  set loading(bool value){ _loading = value; notifyListeners();}

  List<RrhhModels> services = [];
  List<Header> headers = [];

  Future initialData() async{
    services = await workWithUsRepository.getRrhh();
    headers = await headerRepository.getHeaders();
    loading = false;
  }


}