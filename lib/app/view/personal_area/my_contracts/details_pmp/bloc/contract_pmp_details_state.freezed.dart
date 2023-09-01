// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_pmp_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContratPMPDetailState {
  bool get loading => throw _privateConstructorUsedError;
  ContratPmpDetail? get detail => throw _privateConstructorUsedError;
  ContratoPmp? get contract => throw _privateConstructorUsedError;
  DataTableSource? get dataMaquinas => throw _privateConstructorUsedError;
  DataTableSource? get dataServicios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContratPMPDetailStateCopyWith<ContratPMPDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContratPMPDetailStateCopyWith<$Res> {
  factory $ContratPMPDetailStateCopyWith(ContratPMPDetailState value,
          $Res Function(ContratPMPDetailState) then) =
      _$ContratPMPDetailStateCopyWithImpl<$Res, ContratPMPDetailState>;
  @useResult
  $Res call(
      {bool loading,
      ContratPmpDetail? detail,
      ContratoPmp? contract,
      DataTableSource? dataMaquinas,
      DataTableSource? dataServicios});
}

/// @nodoc
class _$ContratPMPDetailStateCopyWithImpl<$Res,
        $Val extends ContratPMPDetailState>
    implements $ContratPMPDetailStateCopyWith<$Res> {
  _$ContratPMPDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? contract = freezed,
    Object? dataMaquinas = freezed,
    Object? dataServicios = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ContratPmpDetail?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as ContratoPmp?,
      dataMaquinas: freezed == dataMaquinas
          ? _value.dataMaquinas
          : dataMaquinas // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
      dataServicios: freezed == dataServicios
          ? _value.dataServicios
          : dataServicios // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContratPMPDetailStateCopyWith<$Res>
    implements $ContratPMPDetailStateCopyWith<$Res> {
  factory _$$_ContratPMPDetailStateCopyWith(_$_ContratPMPDetailState value,
          $Res Function(_$_ContratPMPDetailState) then) =
      __$$_ContratPMPDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      ContratPmpDetail? detail,
      ContratoPmp? contract,
      DataTableSource? dataMaquinas,
      DataTableSource? dataServicios});
}

/// @nodoc
class __$$_ContratPMPDetailStateCopyWithImpl<$Res>
    extends _$ContratPMPDetailStateCopyWithImpl<$Res, _$_ContratPMPDetailState>
    implements _$$_ContratPMPDetailStateCopyWith<$Res> {
  __$$_ContratPMPDetailStateCopyWithImpl(_$_ContratPMPDetailState _value,
      $Res Function(_$_ContratPMPDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? contract = freezed,
    Object? dataMaquinas = freezed,
    Object? dataServicios = freezed,
  }) {
    return _then(_$_ContratPMPDetailState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ContratPmpDetail?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as ContratoPmp?,
      dataMaquinas: freezed == dataMaquinas
          ? _value.dataMaquinas
          : dataMaquinas // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
      dataServicios: freezed == dataServicios
          ? _value.dataServicios
          : dataServicios // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
    ));
  }
}

/// @nodoc

class _$_ContratPMPDetailState implements _ContratPMPDetailState {
  const _$_ContratPMPDetailState(
      {this.loading = false,
      this.detail,
      this.contract,
      this.dataMaquinas,
      this.dataServicios});

  @override
  @JsonKey()
  final bool loading;
  @override
  final ContratPmpDetail? detail;
  @override
  final ContratoPmp? contract;
  @override
  final DataTableSource? dataMaquinas;
  @override
  final DataTableSource? dataServicios;

  @override
  String toString() {
    return 'ContratPMPDetailState(loading: $loading, detail: $detail, contract: $contract, dataMaquinas: $dataMaquinas, dataServicios: $dataServicios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContratPMPDetailState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.dataMaquinas, dataMaquinas) ||
                other.dataMaquinas == dataMaquinas) &&
            (identical(other.dataServicios, dataServicios) ||
                other.dataServicios == dataServicios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, detail, contract, dataMaquinas, dataServicios);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContratPMPDetailStateCopyWith<_$_ContratPMPDetailState> get copyWith =>
      __$$_ContratPMPDetailStateCopyWithImpl<_$_ContratPMPDetailState>(
          this, _$identity);
}

abstract class _ContratPMPDetailState implements ContratPMPDetailState {
  const factory _ContratPMPDetailState(
      {final bool loading,
      final ContratPmpDetail? detail,
      final ContratoPmp? contract,
      final DataTableSource? dataMaquinas,
      final DataTableSource? dataServicios}) = _$_ContratPMPDetailState;

  @override
  bool get loading;
  @override
  ContratPmpDetail? get detail;
  @override
  ContratoPmp? get contract;
  @override
  DataTableSource? get dataMaquinas;
  @override
  DataTableSource? get dataServicios;
  @override
  @JsonKey(ignore: true)
  _$$_ContratPMPDetailStateCopyWith<_$_ContratPMPDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
