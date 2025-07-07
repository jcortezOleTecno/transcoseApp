// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sat_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SatDetailState {
  bool get loading => throw _privateConstructorUsedError;
  IntervencionesDetalle? get detail => throw _privateConstructorUsedError;
  Intervenciones? get intervencion => throw _privateConstructorUsedError;
  DataTableSource? get dataMaquinas => throw _privateConstructorUsedError;
  DataTableSource? get dataMateriales => throw _privateConstructorUsedError;

  /// Create a copy of SatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SatDetailStateCopyWith<SatDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SatDetailStateCopyWith<$Res> {
  factory $SatDetailStateCopyWith(
    SatDetailState value,
    $Res Function(SatDetailState) then,
  ) = _$SatDetailStateCopyWithImpl<$Res, SatDetailState>;
  @useResult
  $Res call({
    bool loading,
    IntervencionesDetalle? detail,
    Intervenciones? intervencion,
    DataTableSource? dataMaquinas,
    DataTableSource? dataMateriales,
  });
}

/// @nodoc
class _$SatDetailStateCopyWithImpl<$Res, $Val extends SatDetailState>
    implements $SatDetailStateCopyWith<$Res> {
  _$SatDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? intervencion = freezed,
    Object? dataMaquinas = freezed,
    Object? dataMateriales = freezed,
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
                        as IntervencionesDetalle?,
            intervencion:
                freezed == intervencion
                    ? _value.intervencion
                    : intervencion // ignore: cast_nullable_to_non_nullable
                        as Intervenciones?,
            dataMaquinas:
                freezed == dataMaquinas
                    ? _value.dataMaquinas
                    : dataMaquinas // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
            dataMateriales:
                freezed == dataMateriales
                    ? _value.dataMateriales
                    : dataMateriales // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SatDetailStateImplCopyWith<$Res>
    implements $SatDetailStateCopyWith<$Res> {
  factory _$$SatDetailStateImplCopyWith(
    _$SatDetailStateImpl value,
    $Res Function(_$SatDetailStateImpl) then,
  ) = __$$SatDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    IntervencionesDetalle? detail,
    Intervenciones? intervencion,
    DataTableSource? dataMaquinas,
    DataTableSource? dataMateriales,
  });
}

/// @nodoc
class __$$SatDetailStateImplCopyWithImpl<$Res>
    extends _$SatDetailStateCopyWithImpl<$Res, _$SatDetailStateImpl>
    implements _$$SatDetailStateImplCopyWith<$Res> {
  __$$SatDetailStateImplCopyWithImpl(
    _$SatDetailStateImpl _value,
    $Res Function(_$SatDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? intervencion = freezed,
    Object? dataMaquinas = freezed,
    Object? dataMateriales = freezed,
  }) {
    return _then(
      _$SatDetailStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        detail:
            freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                    as IntervencionesDetalle?,
        intervencion:
            freezed == intervencion
                ? _value.intervencion
                : intervencion // ignore: cast_nullable_to_non_nullable
                    as Intervenciones?,
        dataMaquinas:
            freezed == dataMaquinas
                ? _value.dataMaquinas
                : dataMaquinas // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
        dataMateriales:
            freezed == dataMateriales
                ? _value.dataMateriales
                : dataMateriales // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
      ),
    );
  }
}

/// @nodoc

class _$SatDetailStateImpl implements _SatDetailState {
  const _$SatDetailStateImpl({
    this.loading = false,
    this.detail,
    this.intervencion,
    this.dataMaquinas,
    this.dataMateriales,
  });

  @override
  @JsonKey()
  final bool loading;
  @override
  final IntervencionesDetalle? detail;
  @override
  final Intervenciones? intervencion;
  @override
  final DataTableSource? dataMaquinas;
  @override
  final DataTableSource? dataMateriales;

  @override
  String toString() {
    return 'SatDetailState(loading: $loading, detail: $detail, intervencion: $intervencion, dataMaquinas: $dataMaquinas, dataMateriales: $dataMateriales)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SatDetailStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.intervencion, intervencion) ||
                other.intervencion == intervencion) &&
            (identical(other.dataMaquinas, dataMaquinas) ||
                other.dataMaquinas == dataMaquinas) &&
            (identical(other.dataMateriales, dataMateriales) ||
                other.dataMateriales == dataMateriales));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    detail,
    intervencion,
    dataMaquinas,
    dataMateriales,
  );

  /// Create a copy of SatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SatDetailStateImplCopyWith<_$SatDetailStateImpl> get copyWith =>
      __$$SatDetailStateImplCopyWithImpl<_$SatDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SatDetailState implements SatDetailState {
  const factory _SatDetailState({
    final bool loading,
    final IntervencionesDetalle? detail,
    final Intervenciones? intervencion,
    final DataTableSource? dataMaquinas,
    final DataTableSource? dataMateriales,
  }) = _$SatDetailStateImpl;

  @override
  bool get loading;
  @override
  IntervencionesDetalle? get detail;
  @override
  Intervenciones? get intervencion;
  @override
  DataTableSource? get dataMaquinas;
  @override
  DataTableSource? get dataMateriales;

  /// Create a copy of SatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SatDetailStateImplCopyWith<_$SatDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
