import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/work_with_us/bloc/work_with_us_state.dart';

class WorkWithUsCubit extends Cubit<WorkWithUsState> {
  WorkWithUsCubit(
    this._workWithUsRepository,
  ) : super(const WorkWithUsState());

  final WorkWithUsRepository _workWithUsRepository;

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
          phone: state.phone!);
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
