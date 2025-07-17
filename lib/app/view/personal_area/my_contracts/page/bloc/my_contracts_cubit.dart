import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_conventions.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/bloc/my_contracts_state.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/conventions.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/crd.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/millennium.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/pmp.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/rappels.dart';

class MyContratsCubit extends Cubit<MyContratsState> {
  MyContratsCubit(this._contratsRepository) : super(const MyContratsState()) {
    getContrats();
  }

  final ContratsRepository _contratsRepository;

  Future<void> getContrats({Filter? filter}) async {
    emit(state.copyWith(
      loading: true,
      yearSelectedConvention: DateTime.now().year.toString(),
    ));
    List<Contrats> crd = [];
    List<ContratoMillenium> mill = [];
    List<ContratoPmp> pmp = [];
    List<ContratoConventionsModel> conventionsList = [];
    ContratoRappel? rappel;

    await Future.wait([
      _contratsRepository.getContratsCRD().then((value) => crd.addAll(value.data as List<Contrats>)),
      _contratsRepository.getContratMill().then((value) => mill = value),
      _contratsRepository.getContratConventions(anio: DateTime.now().year.toString()).then((value) => conventionsList = value),
      _contratsRepository.getContratsPMP().then((value) => pmp.addAll(value)),
      _contratsRepository.getContratReppel().then((value) => rappel = value),
    ]);

    ContratoMillenium? millSelected = mill.isEmpty ? null : mill[0];

    emit(state.copyWith(
      crd: crd,
      mill: millSelected,
      millList: mill,
      pmp: pmp,
      rappel: rappel,
      dataRappels: MyDataRappels(rappel?.documentosFirmados ?? [],
          codContrato: rappel?.codigoContrato?.toString() ?? '0'),
      dataRappelsFiltrado: MyDataRappels(rappel?.documentosFirmados ?? [],
          codContrato: rappel?.codigoContrato?.toString() ?? '0'),
      dataMillennium: MyDataMillennium(mill.isEmpty ? [] : (millSelected!.documentosFirmados ?? []),contrato: mill.isEmpty ? null : millSelected!,),
      dataMillenniumFiltrado: MyDataMillennium(mill.isEmpty ? [] : (millSelected!.documentosFirmados ?? []),contrato: mill.isEmpty ? null : millSelected!,),
      dataMillenniumHiredServices: MyDataMillenniumHiredServices(mill.isEmpty ? [] : (millSelected!.serviciosContratados ?? [])),
      dataPMPFiltrado: MyDataPMP(pmp),
      dataCRDFiltrado: MyDataCRD(crd),
      loading: false,

      yearSelectedConvention: DateTime.now().year.toString(),
      contratoConventionsList: conventionsList,
      contratoConventionsModel: conventionsList.isNotEmpty ? conventionsList[0] : null,
      dataConventionHiredServicesConvention: MyDataConvencionHiredServices(conventionsList.isNotEmpty ? (conventionsList[0].serviciosContratados ?? []) : []),
      dataConventionFiltradoConvention: MyDataTableConvencione(conventionsList.isNotEmpty ? (conventionsList[0].documentosFirmados ?? []) : [],contrato: conventionsList.isNotEmpty ? (conventionsList[0]) : null),
      loadDataConvention: false,
    ));
  }

  Future<void> getCRD({Filter? filter, bool reset = false}) async {
    emit(state.copyWith(loading: true, filtersCRD: null));
    var data = await _contratsRepository.getContratsCRD(filter: filter);
    emit(state.copyWith(
      crd: data.data as List<Contrats>,
      filtersCRD: reset ? null : data.filter,
      loading: false,
    ));
  }

  Future<void> getMill(String year) async {
    emit(state.copyWith(
        yearSelectMill: year,
        loading: true,
      millList: [],
    ));
    List<ContratoMillenium> data = await _contratsRepository.getContratMill(anio: year);
    emit(state.copyWith(
      mill: data.isEmpty ? null : data[0],
      millList: data,
      loading: false,
    ));
  }

  Future<void> getMillContrato(int idContrato) async {
    emit(state.copyWith(
      loading: true,
    ));

    ContratoMillenium? contratoMillenium;
    state.millList.forEach((element) {
      if(element.codigoContrato! == idContrato){
        contratoMillenium = element;
      }
    });

    emit(state.copyWith(
      mill: contratoMillenium,
      dataMillennium: MyDataMillennium(contratoMillenium!.documentosFirmados ?? [],contrato: contratoMillenium,),
      dataMillenniumFiltrado: MyDataMillennium(contratoMillenium!.documentosFirmados ?? [],contrato: contratoMillenium,),
      dataMillenniumHiredServices: MyDataMillenniumHiredServices(contratoMillenium!.serviciosContratados ?? []),
      loading: false,
    ));
  }



  Future<void> getRappel(String year) async {
    emit(state.copyWith(yearSelectRappel: year, loading: true));
    var data = await _contratsRepository.getContratReppel(anio: year);
    emit(state.copyWith(
      rappel: data,
      loading: false,
    ));
  }

  Future<void> signMill({required String name,required String nif,required String signature,}) async {
    await _contratsRepository
        .signMill(
            codigoContrato: state.mill!.codigoContrato.toString(),
            name: name,
            nif: nif,
            signature: signature)
        .then((value) {
      if (value) {
        getMill(state.yearSelectMill ?? DateTime.now().year.toString());
      }
    });
  }

  Future<void> signRappel({required String name,required String nif,required String signature,}) async {
    await _contratsRepository
        .signRappel(
            codigoContrato: state.rappel!.codigoContrato.toString(),
            name: name,
            nif: nif,
            signature: signature)
        .then((value) {
      if (value) {
        getRappel(state.yearSelectRappel ?? DateTime.now().year.toString());
      }
    });
  }

  void filtroRappels(String? value) {
    emit(
      state.copyWith(
        dataRappelsFiltrado: MyDataRappels(
            state.rappel!.documentosFirmados!.where((e) {
              return e
                  .toFilter()
                  .toLowerCase()
                  .contains(value!.trim().toLowerCase());
            }).toList(),
            codContrato: state.rappel!.codigoContrato!.toString()),
      ),
    );
  }

  void filtroMillennium(String? value) {
    emit(
      state.copyWith(
        dataMillenniumFiltrado: MyDataMillennium(
            state.mill!.documentosFirmados!.where((e) {
              return e
                  .toFilter()
                  .toLowerCase()
                  .contains(value!.trim().toLowerCase());
            }).toList(),
            contrato: state.mill!),
      ),
    );
  }

  void filtroMillenniumHiredServices(String? value) {
    emit(
      state.copyWith(
        dataMillenniumHiredServices: MyDataMillenniumHiredServices(
            state.mill!.serviciosContratados!.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList()),
      ),
    );
  }

  void filtroPMP(String? value) {
    emit(
      state.copyWith(
        dataPMPFiltrado: MyDataPMP(state.pmp.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList()),
      ),
    );
  }

  void filtroCRD(String? value) {
    emit(
      state.copyWith(
        dataCRDFiltrado: MyDataCRD(state.crd.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList()),
      ),
    );
  }

  Future changeDateConvention({required String anio}) async{
    emit(state.copyWith(
      yearSelectedConvention: anio,
      contratoConventionsList: [],
    ));
    getConventions();
  }

  Future getConventions() async{

    emit(state.copyWith(
      contratoConventionsModel: null,
      loadDataConvention: true,
    ));

    List<ContratoConventionsModel> conventionsListAux = [];
    DataTableSource? dataConventionHiredServicesAux;
    DataTableSource? dataConventionFiltradoAux;
    ContratoConventionsModel? contratoConventionsModelAux;

    try{
      conventionsListAux = await _contratsRepository.getContratConventions(anio: state.yearSelectedConvention);
      if(conventionsListAux.isNotEmpty){
        contratoConventionsModelAux = conventionsListAux[0];
        dataConventionHiredServicesAux = MyDataConvencionHiredServices(contratoConventionsModelAux.serviciosContratados ?? []);
        dataConventionFiltradoAux = MyDataTableConvencione(contratoConventionsModelAux.documentosFirmados ?? [], contrato: contratoConventionsModelAux);
      }
    }catch(e){
      log(e.toString());
    }

    emit(state.copyWith(
      contratoConventionsModel: contratoConventionsModelAux,
      contratoConventionsList: conventionsListAux,
      dataConventionHiredServicesConvention: dataConventionHiredServicesAux,
      dataConventionFiltradoConvention: dataConventionFiltradoAux,
      loadDataConvention: false,
    ));
  }

  Future<void> signConvenciones({required String name,required String nif,required String signature}) async {
    emit(state.copyWith( loadDataConvention: true,));

    try{
      bool value = await _contratsRepository.signConvencion(
          codigoContrato: state.contratoConventionsModel!.codigoContrato.toString(),
          name: name,
          nif: nif,
          signature: signature
      );

      if (value) {
        getConventions();
      }
    }catch(e){
      log(e.toString());
    }

    emit(state.copyWith( loadDataConvention: false,));
  }

  Future getConvencionSelect(int idContrato) async{
    emit(state.copyWith(
      contratoConventionsModel: null,
      loadDataConvention: true,
    ));

    DataTableSource? dataConventionHiredServicesAux;
    DataTableSource? dataConventionFiltradoAux;
    ContratoConventionsModel? contratoConventionsModelAux;

    try{
      for (int x = 0; x < state.contratoConventionsList.length; x++) {
        if(state.contratoConventionsList[x].codigoContrato! == idContrato){
          contratoConventionsModelAux = state.contratoConventionsList[x];
          dataConventionHiredServicesAux = MyDataConvencionHiredServices(contratoConventionsModelAux.serviciosContratados ?? []);
          dataConventionFiltradoAux = MyDataTableConvencione(contratoConventionsModelAux.documentosFirmados ?? [],contrato: contratoConventionsModelAux);
        }
      }
    }catch(e){
      log('Error ${e.toString()}');
    }

    emit(state.copyWith(
      contratoConventionsModel: contratoConventionsModelAux,
      dataConventionHiredServicesConvention: dataConventionHiredServicesAux,
      dataConventionFiltradoConvention: dataConventionFiltradoAux,
      loadDataConvention: false,
    ));
  }

  void filtroConvencionesHiredServices(String? value) {
    DataTableSource? dataConventionHiredServicesAux = MyDataConvencionHiredServices(
        state.contratoConventionsModel!.serviciosContratados!.where((e) {
          return e.toFilter().toLowerCase().contains(value!.trim().toLowerCase());
        }).toList());
    emit(state.copyWith(
      dataConventionHiredServicesConvention: dataConventionHiredServicesAux,
    ));
  }

  void filtroConventionFirmados(String? value) {
    DataTableSource? dataConventionFiltradoAux = MyDataTableConvencione(
        state.contratoConventionsModel!.documentosFirmados!.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList(), contrato: state.contratoConventionsModel);
    emit(state.copyWith(
      dataConventionFiltradoConvention: dataConventionFiltradoAux,
    ));
  }
}
