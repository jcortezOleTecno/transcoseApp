import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';

class FormationsRegisteredProvider with ChangeNotifier{

  FormationsRegisteredProvider(this._formationsRepository, this.formationsGroup){
    initialData();
  }

  final FormationsRepository _formationsRepository;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}


  List<TrainigGroup> formationsGroup = [];
  Map<String,String> mapFormationsGroup = {'0' : 'Selecciona una opción'};
  String _categorySelected = '0';
  String get categorySelected => _categorySelected;
  set categorySelected(String value){ _categorySelected = value; notifyListeners();}

  List<String> listOrd = ['De más próxima a más lejana','De más lejan a más apróxima'];
  Map<String,String> mapListOrd = {'De más próxima a más lejana' : 'asc', 'De más lejan a más apróxima' : 'desc',};
  String _orderBy = 'De más próxima a más lejana';
  String get orderBy => _orderBy;
  set orderBy(String value){ _orderBy = value; notifyListeners();}

  String _textSearch = '';
  String get textSearch => _textSearch;
  set textSearch(String value){ _textSearch = value; notifyListeners();}

  List<Formation> formations = [];
  List<Formation> formationsData = [];



  Future initialData() async{
    await getTrainig();

    for(int x = 0; x < formationsGroup.length; x++){
      mapFormationsGroup[formationsGroup[x].id.toString()] = formationsGroup[x].title!;
    }

    loadData = false;
  }

  Future getTrainig() async {
    formations = await _formationsRepository.getRegisteredTrainings();
    formationsData = formations;
    notifyListeners();
  }

  Future resetTrainig() async {
    formations = formationsData;
    notifyListeners();
  }

  Future filterData() async {
    loadData = true;
    formations = await _formationsRepository.getRegisteredTrainings(
      search: textSearch,
      orderByDateLocation: mapListOrd[orderBy]!,
      formationGroupId: categorySelected == '0' ? '' : categorySelected,
    );
    notifyListeners();
    loadData = false;
  }





}