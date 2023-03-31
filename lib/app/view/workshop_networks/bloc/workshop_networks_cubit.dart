import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/view/workshop_networks/bloc/workshop_networks_state.dart';

class WorkshopNetworksCubit extends Cubit<WorkshopNetworksState> {
  WorkshopNetworksCubit(this._workShopsRepository, this._idWorkShop)
      : super(const WorkshopNetworksState()) {
    fetchData();
  }

  final WorkShopsRepository _workShopsRepository;
  final int? _idWorkShop;

  Future<void> fetchData() async {
    final workShops = await _workShopsRepository.getWorkShops();

    emit(state.copyWith(
      workShops: workShops,
      workShop: _idWorkShop != null
          ? workShops.firstWhere((e) => e.id == _idWorkShop)
          : null,
    ));
  }

  void workShop(WorkShop? workShop) {
    emit(state.copyWith(workShop: workShop));
  }
}
