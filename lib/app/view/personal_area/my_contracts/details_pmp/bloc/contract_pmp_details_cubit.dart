import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_pmp_detail.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details_pmp/contract_pmp_detail.dart';

import 'contract_pmp_details_state.dart';

class ContratPMPDetailCubit extends Cubit<ContratPMPDetailState> {
  ContratPMPDetailCubit(
    this._contratsRepository,
    ContratoPmp contrat,
  ) : super(ContratPMPDetailState(contract: contrat)) {
    getDetail();
  }

  final ContratsRepository _contratsRepository;

  Future<void> getDetail() async {
    emit(state.copyWith(loading: true));

    ContratPmpDetail detail = await _contratsRepository.getContratPmpDetail(
      codigoContrato: state.contract!.codigoContrato!.toString(),
    );

    emit(state.copyWith(
      detail: detail,
      dataMaquinas: MyDataMaquinas(detail.maquinas ?? []),
      dataServicios: MyDataServicios(detail.servicions ?? []),
      loading: false,
    ));
  }

  Future<void> sign({
    required String name,
    required String nif,
    required String signature,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void filtroMaquinas(String? value) {
    emit(
      state.copyWith(
        dataMaquinas: MyDataMaquinas(state.detail!.maquinas!.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList()),
      ),
    );
  }

  void filtroServicios(String? value) {
    emit(
      state.copyWith(
        dataServicios: MyDataServicios(state.detail!.servicions!.where((e) {
          return e
              .toFilter()
              .toLowerCase()
              .contains(value!.trim().toLowerCase());
        }).toList()),
      ),
    );
  }
}
