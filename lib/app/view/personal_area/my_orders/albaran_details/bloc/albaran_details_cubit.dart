import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_details/bloc/albaran_details_state.dart';

class AlbaranDetailCubit extends Cubit<AlbaranDetailState> {
  AlbaranDetailCubit(
    this._myAccountRepository,
    Albaran albaran,
  ) : super(AlbaranDetailState(albaran: albaran)) {
    fetchData();
  }

  final MyAccountRepository _myAccountRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));

    var details = await _myAccountRepository.getOrderDetail(
      contador: state.albaran!.contador!,
      documento: state.albaran!.documento.toString(),
      ejercicio: state.albaran!.ejercicio.toString(),
      tipoAlbaran: state.albaran!.tipoAlbaran!,
    );

    emit(state.copyWith(
      details: details,
      loading: false,
    ));
  }
}
