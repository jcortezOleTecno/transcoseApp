// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:vemare/app/data/contracts_repository.dart';
// import 'package:vemare/app/domain/model/contract_conventions.dart';
// import 'package:vemare/app/view/personal_area/my_contracts/page/conventions.dart';
//
// class ConventionsProvider with ChangeNotifier{
//
//   ConventionsProvider(this._contratsRepository){
//     initialData();
//   }
//
//   final ContratsRepository _contratsRepository;
//
//   ContratoConventionsModel? contratoConventionsModel;
//
//   DataTableSource? dataConventionHiredServices;
//   DataTableSource? dataConventionFiltrado;
//
//   bool _loadData = true;
//   bool get loadData => _loadData;
//   set loadData(bool value){ _loadData = value; notifyListeners();}
//
//   String _yearSelected = DateTime.now().year.toString();
//   String get yearSelected => _yearSelected;
//   set yearSelected(String value){ _yearSelected = value; notifyListeners(); getConventions();}
//
//   Future initialData() async {
//     yearSelected = DateTime.now().year.toString();
//
//     getConventions();
//
//     loadData = false;
//   }
//
//   Future getConventions() async{
//     loadData = true;
//
//     try{
//       contratoConventionsModel = await _contratsRepository.getContratConventions(anio: yearSelected);
//       if(contratoConventionsModel != null){
//         dataConventionHiredServices = MyDataConvencionHiredServices(contratoConventionsModel?.serviciosContratados ?? []);
//         dataConventionFiltrado = MyDataTableConvencione(contratoConventionsModel?.documentosFirmados ?? [],
//             contrato: contratoConventionsModel);
//       }
//     }catch(e){
//       log(e.toString());
//     }
//
//     loadData = false;
//   }
//
//   Future<void> signConvenciones({required String name,required String nif,required String signature}) async {
//     loadData = true;
//
//     try{
//       bool value = await _contratsRepository.signConvencion(
//           codigoContrato: contratoConventionsModel!.codigoContrato.toString(),
//           name: name,
//           nif: nif,
//           signature: signature
//       );
//
//       if (value) {
//         getConventions();
//       }
//     }catch(e){
//       log(e.toString());
//     }
//
//     loadData = false;
//   }
//
//   void filtroConvencionesHiredServices(String? value) {
//     dataConventionHiredServices = MyDataConvencionHiredServices(
//         contratoConventionsModel!.serviciosContratados!.where((e) {
//           return e.toFilter().toLowerCase().contains(value!.trim().toLowerCase());
//         }).toList());
//   }
//
//   void filtroMillenniumHiredServices(String? value) {
//     dataConventionFiltrado = MyDataTableConvencione(
//         contratoConventionsModel!.documentosFirmados!.where((e) {
//           return e
//               .toFilter()
//               .toLowerCase()
//               .contains(value!.trim().toLowerCase());
//         }).toList(), contrato: contratoConventionsModel);
//   }
//
// }