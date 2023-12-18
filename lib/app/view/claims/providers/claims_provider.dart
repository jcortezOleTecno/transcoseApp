import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/data/claims_repository.dart';
import 'package:vemare/app/domain/model/complaints_categories_model.dart';
import 'package:vemare/app/domain/model/complaints_model.dart';

class ClaimsProvider extends ChangeNotifier {

  ClaimsProvider(this._claimsRepository){
    initialData();
  }

  final ClaimsRepository _claimsRepository;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  bool _loadSend = false;
  bool get loadSend => _loadSend;
  set loadSend(bool value){ _loadSend = value; notifyListeners();}

  bool _searchClaims = false;
  bool get searchClaims => _searchClaims;
  set searchClaims(bool value){ _searchClaims = value; notifyListeners();}

  bool _isSelectCreate = true;
  bool get isSelectCreate => _isSelectCreate;
  set isSelectCreate(bool value){ _isSelectCreate = value; notifyListeners();}

  File? _nameFile;
  File? get nameFile => _nameFile;
  set nameFile(File? value){ _nameFile = value; notifyListeners();}

  String _hash = '';
  String get hash => _hash;
  set hash(String value){ _hash = value; notifyListeners();}

  List<ComplaintsModel> complaints = [];
  List<ComplaintsCategoriesModel> complaintsCategories = [];

  ComplaintsModel? _complaintSelected;
  ComplaintsModel? get complaintSelected => _complaintSelected;
  set complaintSelected(ComplaintsModel? value){ _complaintSelected = value; notifyListeners();}

  ComplaintsCategoriesModel? _complaintsCategoriesSelected;
  ComplaintsCategoriesModel? get complaintsCategoriesSelected => _complaintsCategoriesSelected;
  set complaintsCategoriesSelected(ComplaintsCategoriesModel? value){ _complaintsCategoriesSelected = value; notifyListeners();}


  late TextEditingController controllerApellido1;
  late TextEditingController controllerApellido2;
  late TextEditingController controllerNombre;
  late TextEditingController controllerCIF;
  late TextEditingController controllerEmail;
  late TextEditingController controllerTelefono;
  late TextEditingController controllerDireccion;
  late TextEditingController controllerAsunto;
  late TextEditingController controllerDetalle;

  late TextEditingController controllerCodConsulta;

  Map resultBusqueda = {};
  

  Future initialData() async {

    controllerApellido1 = TextEditingController();
    controllerApellido2 = TextEditingController();
    controllerNombre = TextEditingController();
    controllerCIF = TextEditingController();
    controllerEmail = TextEditingController();
    controllerTelefono = TextEditingController();
    controllerDireccion = TextEditingController();
    controllerAsunto = TextEditingController();
    controllerDetalle = TextEditingController();

    controllerCodConsulta = TextEditingController();

    complaintSelected = null;
    complaintsCategoriesSelected = null;
    nameFile = null;

    hash = '';

    notifyListeners();

    try{
      complaints = await _claimsRepository.getComplaints();
      complaintsCategories = await _claimsRepository.getComplaintsCategories();
      loadData = false;
    }catch(e){
      log(e.toString());
    }

  }


  Future<void> attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      nameFile = File(result.files.single.path!);
    }
  }

  Future<Map> sendData() async{
    Map result = {};
    try{
      loadSend = true;
      Map<String,dynamic> body = {
        'tipo_contacto' : complaintSelected!.codigoTipoContacto!.toString(),
        'categoria_denunciante' : complaintsCategoriesSelected!.codigoCategoria!.toString(),
        'nombre' : controllerNombre.text,
        'apellido1' : controllerApellido1.text,
        'apellido2' : controllerApellido2.text,
        'cif' : controllerCIF.text,
        'email' : controllerEmail.text,
        'direccion' : controllerDireccion.text,
        'telefono' : controllerTelefono.text,
        'asunto_denuncia' : controllerAsunto.text,
        'descripcion_denuncia' : controllerDetalle.text,
      };

      result = await _claimsRepository.postComplaintsStore(doc: nameFile, body: body);

    }catch(e){
      log(e.toString());
    }
    loadSend = false;
    return result;
  }

  Future consultarData({required String ref}) async{
    try{
      resultBusqueda = {};
      searchClaims = true;
      Map<String,dynamic> body = {
        'search' : ref,
      };

      Map result = await _claimsRepository.postComplaintsSearching(body: body);
      if(result['response'] == 'success'){
        resultBusqueda = result['data'] as Map<String,dynamic>;
      }
    }catch(e){
      log(e.toString());
    }
    searchClaims = false;
  }

}
