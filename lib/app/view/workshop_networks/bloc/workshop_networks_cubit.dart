import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/observation.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';
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

  void name(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          name: Name(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          name: null,
        ),
      );
    }
  }

  void phone(String value) {
    var phone = value.replaceAll(" ", "");
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          phone: Phone(phone.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          phone: null,
        ),
      );
    }
  }

  void email(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          email: Email(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          email: null,
        ),
      );
    }
  }

  void observation(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          observation: Observation(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          observation: null,
        ),
      );
    }
  }

  Future<void> sendForm() async {
    emit(state.copyWith(status: FormStatus.loading));
    await _workShopsRepository.setForm(
        name: state.name!.value,
        email: state.email!.value,
        phone: state.phone!.value,
        observation: state.observation!.value,
        workshopId: state.workShop!.id.toString());
    emit(state.copyWith(
      status: FormStatus.done,
      email: null,
      name: null,
      phone: null,
      observation: null,
    ));
  }
}
