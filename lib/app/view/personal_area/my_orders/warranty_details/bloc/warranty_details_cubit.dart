import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/warranty.dart';

import 'warranty_details_state.dart';

class WarrantyDetailsCubit extends Cubit<WarrantyDetailsState> {
  WarrantyDetailsCubit(
    this._myAccountRepository,
    Warranty warranty,
  ) : super(WarrantyDetailsState(warranty: warranty)) {
    fetchData();
  }

  final MyAccountRepository _myAccountRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    var details = await _myAccountRepository.getWarrantyDetail(
        codigoGarantia: state.warranty!.codigoGarantia!.toString());

    emit(state.copyWith(
      details: details,
      loading: false,
    ));
  }

  Future<void> sign({
    required String name,
    required String nif,
    required String signature,
  }) async {
    await _myAccountRepository
        .signWarranty(
            codigoGarantia: state.warranty!.codigoGarantia.toString(),
            persona: name,
            nif: nif,
            firma: signature)
        .then((value) {
      if (value) {
        fetchData();
      }
    });
  }
}
