import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/bloc/my_contracts_state.dart';
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
    emit(state.copyWith(loading: true));
    List<Contrats> crd = [];
    ContratoMillenium? mill;
    List<ContratoPmp> pmp = [];
    ContratoRappel? rappel;

    await Future.wait([
      _contratsRepository
          .getContratsCRD()
          .then((value) => crd.addAll(value.data as List<Contrats>)),
      _contratsRepository.getContratMill().then((value) => mill = value),
      _contratsRepository.getContratsPMP().then((value) => pmp.addAll(value)),
      _contratsRepository.getContratReppel().then((value) => rappel = value),
    ]);

    emit(state.copyWith(
      crd: crd,
      mill: mill,
      pmp: pmp,
      rappel: rappel,
      dataRappels: MyDataRappels(rappel?.documentosFirmados ?? [],
          codContrato: rappel?.codigoContrato?.toString() ?? '0'),
      dataRappelsFiltrado: MyDataRappels(rappel?.documentosFirmados ?? [],
          codContrato: rappel?.codigoContrato?.toString() ?? '0'),
      dataMillennium: MyDataMillennium(
        mill?.documentosFirmados ?? [],
        contrato: mill,
      ),
      dataMillenniumFiltrado: MyDataMillennium(
        mill?.documentosFirmados ?? [],
        contrato: mill,
      ),
      dataMillenniumHiredServices:
          MyDataMillenniumHiredServices(mill!.serviciosContratados!),
      dataPMPFiltrado: MyDataPMP(pmp),
      dataCRDFiltrado: MyDataCRD(crd),
      loading: false,
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
    emit(state.copyWith(yearSelectMill: year, loading: true));
    var data = await _contratsRepository.getContratMill(anio: year);
    emit(state.copyWith(
      mill: data,
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

  Future<void> signMill({
    required String name,
    required String nif,
    required String signature,
  }) async {
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

  Future<void> signRappel({
    required String name,
    required String nif,
    required String signature,
  }) async {
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
}
