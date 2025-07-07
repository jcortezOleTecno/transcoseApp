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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ContratPMPDetailState {
  bool get loading => throw _privateConstructorUsedError;
  ContratPmpDetail? get detail => throw _privateConstructorUsedError;
  ContratoPmp? get contract => throw _privateConstructorUsedError;
  DataTableSource? get dataMaquinas => throw _privateConstructorUsedError;
  DataTableSource? get dataServicios => throw _privateConstructorUsedError;

  /// Create a copy of ContratPMPDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContratPMPDetailStateCopyWith<ContratPMPDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContratPMPDetailStateCopyWith<$Res> {
  factory $ContratPMPDetailStateCopyWith(
    ContratPMPDetailState value,
    $Res Function(ContratPMPDetailState) then,
  ) = _$ContratPMPDetailStateCopyWithImpl<$Res, ContratPMPDetailState>;
  @useResult
  $Res call({
    bool loading,
    ContratPmpDetail? detail,
    ContratoPmp? contract,
    DataTableSource? dataMaquinas,
    DataTableSource? dataServicios,
  });
}

/// @nodoc
class _$ContratPMPDetailStateCopyWithImpl<
  $Res,
  $Val extends ContratPMPDetailState
>
    implements $ContratPMPDetailStateCopyWith<$Res> {
  _$ContratPMPDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContratPMPDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? contract = freezed,
    Object? dataMaquinas = freezed,
    Object? dataServicios = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            detail:
                freezed == detail
                    ? _value.detail
                    : detail // ignore: cast_nullable_to_non_nullable
                        as ContratPmpDetail?,
            contract:
                freezed == contract
                    ? _value.contract
                    : contract // ignore: cast_nullable_to_non_nullable
                        as ContratoPmp?,
            dataMaquinas:
                freezed == dataMaquinas
                    ? _value.dataMaquinas
                    : dataMaquinas // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
            dataServicios:
                freezed == dataServicios
                    ? _value.dataServicios
                    : dataServicios // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContratPMPDetailStateImplCopyWith<$Res>
    implements $ContratPMPDetailStateCopyWith<$Res> {
  factory _$$ContratPMPDetailStateImplCopyWith(
    _$ContratPMPDetailStateImpl value,
    $Res Function(_$ContratPMPDetailStateImpl) then,
  ) = __$$ContratPMPDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    ContratPmpDetail? detail,
    ContratoPmp? contract,
    DataTableSource? dataMaquinas,
    DataTableSource? dataServicios,
  });
}

/// @nodoc
class __$$ContratPMPDetailStateImplCopyWithImpl<$Res>
    extends
        _$ContratPMPDetailStateCopyWithImpl<$Res, _$ContratPMPDetailStateImpl>
    implements _$$ContratPMPDetailStateImplCopyWith<$Res> {
  __$$ContratPMPDetailStateImplCopyWithImpl(
    _$ContratPMPDetailStateImpl _value,
    $Res Function(_$ContratPMPDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContratPMPDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? contract = freezed,
    Object? dataMaquinas = freezed,
    Object? dataServicios = freezed,
  }) {
    return _then(
      _$ContratPMPDetailStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        detail:
            freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                    as ContratPmpDetail?,
        contract:
            freezed == contract
                ? _value.contract
                : contract // ignore: cast_nullable_to_non_nullable
                    as ContratoPmp?,
        dataMaquinas:
            freezed == dataMaquinas
                ? _value.dataMaquinas
                : dataMaquinas // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
        dataServicios:
            freezed == dataServicios
                ? _value.dataServicios
                : dataServicios // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
      ),
    );
  }
}

/// @nodoc

class _$ContratPMPDetailStateImpl implements _ContratPMPDetailState {
  const _$ContratPMPDetailStateImpl({
    this.loading = false,
    this.detail,
    this.contract,
    this.dataMaquinas,
    this.dataServicios,
  });

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContratPMPDetailStateImpl &&
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
    runtimeType,
    loading,
    detail,
    contract,
    dataMaquinas,
    dataServicios,
  );

  /// Create a copy of ContratPMPDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContratPMPDetailStateImplCopyWith<_$ContratPMPDetailStateImpl>
  get copyWith =>
      __$$ContratPMPDetailStateImplCopyWithImpl<_$ContratPMPDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ContratPMPDetailState implements ContratPMPDetailState {
  const factory _ContratPMPDetailState({
    final bool loading,
    final ContratPmpDetail? detail,
    final ContratoPmp? contract,
    final DataTableSource? dataMaquinas,
    final DataTableSource? dataServicios,
  }) = _$ContratPMPDetailStateImpl;

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

  /// Create a copy of ContratPMPDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContratPMPDetailStateImplCopyWith<_$ContratPMPDetailStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
