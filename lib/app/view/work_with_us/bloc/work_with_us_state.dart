import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/opciones.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'work_with_us_state.freezed.dart';

@freezed
class WorkWithUsState with _$WorkWithUsState {
  const factory WorkWithUsState({
    @Default(FormStatus.editing) FormStatus status,
    Name? name,
    Phone? phone,
    Email? email,
    File? doc,
    String? message,
    String? zone,
    String? job,
    Opciones? opciones,
    WorkWithUs? workWithUs,
  }) = _WorkWithUsState;
  const WorkWithUsState._();

  bool get isComplete =>
      name != null &&
      phone != null &&
      doc != null &&
      zone != null &&
      job != null;
}
