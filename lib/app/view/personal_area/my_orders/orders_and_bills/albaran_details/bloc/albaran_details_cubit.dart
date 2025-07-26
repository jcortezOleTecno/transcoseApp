import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';

import 'albaran_details_state.dart';

class AlbaranDetailCubit extends Cubit<AlbaranDetailState> {
  AlbaranDetailCubit(
    this._myAccountRepository,
    AlbaranISI albaran,
  ) : super(AlbaranDetailState(albaran: albaran)) {
    fetchData();
  }

  final MyAccountRepository _myAccountRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    // var details = await _myAccountRepository.getOrderDetail(
    //   contador: '',
    //   documento: state.albaran!.albaran,
    //   ejercicio: state.albaran!.total.toString(),
    //   tipoAlbaran: state.albaran!.tipoAlbaran!,
    // );

    emit(state.copyWith(
      details: [],
      loading: false,
    ));
  }

  void changePage({required int page}){
    emit(state.copyWith(
      currentPage: page,
    ));
  }
}
