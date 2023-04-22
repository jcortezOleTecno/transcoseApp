import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';

import 'sat_details_state.dart';

class SatDetailCubit extends Cubit<SatDetailState> {
  SatDetailCubit(
    this._myAccountRepository,
    Intervenciones data,
  ) : super(SatDetailState(intervencion: data)) {
    getDetail();
  }

  final MyAccountRepository _myAccountRepository;

  Future<void> getDetail() async {
    emit(state.copyWith(loading: true));

    var detail = await _myAccountRepository.getMySATDetails(
      codigoIntervencion: state.intervencion!.codigoIntervencion.toString(),
    );

    emit(state.copyWith(
      detail: detail,
      loading: false,
    ));
  }

  // Future<void> sign({
  //   required String name,
  //   required String nif,
  //   required String signature,
  // }) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   print(name);
  //   print(nif);
  //   print(signature);
  // }
}
