import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/domain/value_object/status.dart';

part 'formations_state.freezed.dart';

@freezed
class FormationsState with _$FormationsState {
  const factory FormationsState({
    @Default(false) bool loading,
    @Default(FormStatus.editing) FormStatus status,
    @Default(<Header>[]) List<Header> headers,
    @Default(<TrainigGroup>[]) List<TrainigGroup> formations,
  }) = _FormationsState;
  const FormationsState._();
}
