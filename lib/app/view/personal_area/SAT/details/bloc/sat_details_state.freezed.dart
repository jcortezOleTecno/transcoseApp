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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SatDetailState {
  bool get loading => throw _privateConstructorUsedError;
  IntervencionesDetalle? get detail => throw _privateConstructorUsedError;
  Intervenciones? get intervencion => throw _privateConstructorUsedError;
  DataTableSource? get dataMaquinas => throw _privateConstructorUsedError;
  DataTableSource? get dataMateriales => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SatDetailStateCopyWith<SatDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SatDetailStateCopyWith<$Res> {
  factory $SatDetailStateCopyWith(
          SatDetailState value, $Res Function(SatDetailState) then) =
      _$SatDetailStateCopyWithImpl<$Res, SatDetailState>;
  @useResult
  $Res call(
      {bool loading,
      IntervencionesDetalle? detail,
      Intervenciones? intervencion,
      DataTableSource? dataMaquinas,
      DataTableSource? dataMateriales});
}

/// @nodoc
class _$SatDetailStateCopyWithImpl<$Res, $Val extends SatDetailState>
    implements $SatDetailStateCopyWith<$Res> {
  _$SatDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? intervencion = freezed,
    Object? dataMaquinas = freezed,
    Object? dataMateriales = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as IntervencionesDetalle?,
      intervencion: freezed == intervencion
          ? _value.intervencion
          : intervencion // ignore: cast_nullable_to_non_nullable
              as Intervenciones?,
      dataMaquinas: freezed == dataMaquinas
          ? _value.dataMaquinas
          : dataMaquinas // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
      dataMateriales: freezed == dataMateriales
          ? _value.dataMateriales
          : dataMateriales // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SatDetailStateCopyWith<$Res>
    implements $SatDetailStateCopyWith<$Res> {
  factory _$$_SatDetailStateCopyWith(
          _$_SatDetailState value, $Res Function(_$_SatDetailState) then) =
      __$$_SatDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      IntervencionesDetalle? detail,
      Intervenciones? intervencion,
      DataTableSource? dataMaquinas,
      DataTableSource? dataMateriales});
}

/// @nodoc
class __$$_SatDetailStateCopyWithImpl<$Res>
    extends _$SatDetailStateCopyWithImpl<$Res, _$_SatDetailState>
    implements _$$_SatDetailStateCopyWith<$Res> {
  __$$_SatDetailStateCopyWithImpl(
      _$_SatDetailState _value, $Res Function(_$_SatDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? detail = freezed,
    Object? intervencion = freezed,
    Object? dataMaquinas = freezed,
    Object? dataMateriales = freezed,
  }) {
    return _then(_$_SatDetailState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as IntervencionesDetalle?,
      intervencion: freezed == intervencion
          ? _value.intervencion
          : intervencion // ignore: cast_nullable_to_non_nullable
              as Intervenciones?,
      dataMaquinas: freezed == dataMaquinas
          ? _value.dataMaquinas
          : dataMaquinas // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
      dataMateriales: freezed == dataMateriales
          ? _value.dataMateriales
          : dataMateriales // ignore: cast_nullable_to_non_nullable
              as DataTableSource?,
    ));
  }
}

/// @nodoc

class _$_SatDetailState implements _SatDetailState {
  const _$_SatDetailState(
      {this.loading = false,
      this.detail,
      this.intervencion,
      this.dataMaquinas,
      this.dataMateriales});

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SatDetailState &&
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
      runtimeType, loading, detail, intervencion, dataMaquinas, dataMateriales);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SatDetailStateCopyWith<_$_SatDetailState> get copyWith =>
      __$$_SatDetailStateCopyWithImpl<_$_SatDetailState>(this, _$identity);
}

abstract class _SatDetailState implements SatDetailState {
  const factory _SatDetailState(
      {final bool loading,
      final IntervencionesDetalle? detail,
      final Intervenciones? intervencion,
      final DataTableSource? dataMaquinas,
      final DataTableSource? dataMateriales}) = _$_SatDetailState;

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
  @override
  @JsonKey(ignore: true)
  _$$_SatDetailStateCopyWith<_$_SatDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
