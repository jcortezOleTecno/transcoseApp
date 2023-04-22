import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/observation.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'services_state.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState({
    @Default(false) bool loading,
    @Default(FormStatus.editing) FormStatus status,
    @Default(<Services>[]) List<Services> services,
    Name? name,
    Email? email,
    Phone? phone,
    Name? provincia,
    Name? ciudad,
    Observation? message,
  }) = _ServicesState;
  const ServicesState._();

  bool get isCompleted =>
      name != null &&
      email != null &&
      phone != null &&
      provincia != null &&
      ciudad != null &&
      message != null;
}
