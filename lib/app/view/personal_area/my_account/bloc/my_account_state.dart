import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_account_state.freezed.dart';

@freezed
class MyAccountState with _$MyAccountState {
  const factory MyAccountState({
    File? foto,
  }) = _MyAccountState;
}
