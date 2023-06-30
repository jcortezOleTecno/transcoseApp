import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'my_account_state.freezed.dart';

@freezed
class MyAccountState with _$MyAccountState {
  const factory MyAccountState({
    @Default(FormStatus.editing) FormStatus status,
    String? name,
    String? email,
    String? code,
    String? cif,
    String? phone,
    String? address,
    String? city,
    String? province,
    String? postalCode,
    File? foto,
  }) = _MyAccountState;
}
