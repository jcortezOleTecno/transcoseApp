import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';

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

    var detail = await _contratsRepository.getContratPmpDetail(
      codigoContrato: state.contract!.codigoContrato!.toString(),
    );

    emit(state.copyWith(
      detail: detail,
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
}
