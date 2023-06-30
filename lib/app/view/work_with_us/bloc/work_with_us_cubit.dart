import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/work_with_us/bloc/work_with_us_state.dart';

class WorkWithUsCubit extends Cubit<WorkWithUsState> {
  WorkWithUsCubit(this._workWithUsRepository, WorkWithUs? workWithUs)
      : super(WorkWithUsState(workWithUs: workWithUs)) {
    getOptions();
  }

  final WorkWithUsRepository _workWithUsRepository;

  Future<void> getOptions() async {
    var data = await _workWithUsRepository.getOpciones();
    emit(state.copyWith(opciones: data));
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
          phone: Phone(phone),
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

  void zone(String? zone) {
    emit(state.copyWith(zone: zone));
  }

  void job(String? job) {
    emit(state.copyWith(job: job));
  }

  Future<void> attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      emit(state.copyWith(doc: file));
    }
  }

  void acceptPolicy(bool value) {
    emit(state.copyWith(acceptPolicy: value));
  }

  void deleteDoc() {
    emit(state.copyWith(doc: null, status: FormStatus.editing));
  }

  Future<void> sendData() async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      String? message = await _workWithUsRepository.formRequest(
        doc: state.doc!,
        email: state.email!,
        name: state.name!,
        phone: state.phone!,
        zone: state.zone!,
        job: state.job!,
      );
      emit(state.copyWith(
        status: FormStatus.done,
        message: message,
      ));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: FormStatus.error));
    }
  }
}
