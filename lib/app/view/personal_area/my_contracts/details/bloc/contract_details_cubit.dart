import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contrats.dart';

import 'contract_details_state.dart';

class ContratDetailCubit extends Cubit<ContratDetailState> {
  ContratDetailCubit(
    this._contratsRepository,
    Contrats contrat,
  ) : super(ContratDetailState(contract: contrat)) {
    getDetail();
  }

  final ContratsRepository _contratsRepository;

  Future<void> getDetail() async {
    emit(state.copyWith(loading: true));

    var detail = await _contratsRepository.getContratDetail(
      codigoContrato: state.contract!.codigoContrato!.toString(),
      numeroProyecto: state.contract!.numeroProyecto!,
    );

    emit(state.copyWith(
      loading: false,
      detail: detail,
    ));
  }

  Future<void> sign({
    required String name,
    required String nif,
    required String signature,
  }) async {
    await _contratsRepository
        .signCRD(
            numeroProyecto: state.contract!.numeroProyecto!,
            codigoContrato: state.contract!.codigoContrato.toString(),
            name: name,
            nif: nif,
            signature: signature)
        .then((value) {
      if (value) {
        getDetail();
      }
    });
  }
}
