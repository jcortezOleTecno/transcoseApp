import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/we_help_you.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/observation.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/my_services/services/bloc/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(
    this._servicesRepository,
    this._headerRepository,
  ) : super(const ServicesState()) {
    fetchData();
  }

  final ServicesRepository _servicesRepository;
  final HeaderRepository _headerRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Services> services = await _servicesRepository.getServices(limit: 0);
    WeHelpYou? weHelpYou = await _servicesRepository.getWeHelpYou();
    List<Header> headers = await _headerRepository.getHeaders();
    emit(state.copyWith(
      services: services,
      weHelpYou: weHelpYou,
      headers: headers,
      loading: false,
    ));
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

  void province(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          provincia: Name(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          provincia: null,
        ),
      );
    }
  }

  void ciudad(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          ciudad: Name(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          ciudad: null,
        ),
      );
    }
  }

  void message(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          message: Observation(value.trim()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          message: null,
        ),
      );
    }
  }

  Future<void> sendForm() async {
    emit(state.copyWith(status: FormStatus.loading));
    await _servicesRepository.setForm(
      name: state.name!.value,
      email: state.email!.value,
      phone: state.phone!.value,
      province: state.provincia!.value,
      city: state.ciudad!.value,
      message: state.message!.value,
    );
    emit(state.copyWith(
      status: FormStatus.done,
      email: null,
      name: null,
      phone: null,
      provincia: null,
      ciudad: null,
      message: null,
    ));
  }
}
