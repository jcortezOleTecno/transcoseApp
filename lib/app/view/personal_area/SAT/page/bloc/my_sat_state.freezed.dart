// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_sat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MySatState {
  bool get loading => throw _privateConstructorUsedError;
  List<Intervenciones> get sats => throw _privateConstructorUsedError;
  DataTableSource? get data => throw _privateConstructorUsedError;
  DataTableSource? get dataFiltrada => throw _privateConstructorUsedError;
  String? get filters => throw _privateConstructorUsedError;

  /// Create a copy of MySatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MySatStateCopyWith<MySatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MySatStateCopyWith<$Res> {
  factory $MySatStateCopyWith(
    MySatState value,
    $Res Function(MySatState) then,
  ) = _$MySatStateCopyWithImpl<$Res, MySatState>;
  @useResult
  $Res call({
    bool loading,
    List<Intervenciones> sats,
    DataTableSource? data,
    DataTableSource? dataFiltrada,
    String? filters,
  });
}

/// @nodoc
class _$MySatStateCopyWithImpl<$Res, $Val extends MySatState>
    implements $MySatStateCopyWith<$Res> {
  _$MySatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MySatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sats = null,
    Object? data = freezed,
    Object? dataFiltrada = freezed,
    Object? filters = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            sats:
                null == sats
                    ? _value.sats
                    : sats // ignore: cast_nullable_to_non_nullable
                        as List<Intervenciones>,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
            dataFiltrada:
                freezed == dataFiltrada
                    ? _value.dataFiltrada
                    : dataFiltrada // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
            filters:
                freezed == filters
                    ? _value.filters
                    : filters // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MySatStateImplCopyWith<$Res>
    implements $MySatStateCopyWith<$Res> {
  factory _$$MySatStateImplCopyWith(
    _$MySatStateImpl value,
    $Res Function(_$MySatStateImpl) then,
  ) = __$$MySatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    List<Intervenciones> sats,
    DataTableSource? data,
    DataTableSource? dataFiltrada,
    String? filters,
  });
}

/// @nodoc
class __$$MySatStateImplCopyWithImpl<$Res>
    extends _$MySatStateCopyWithImpl<$Res, _$MySatStateImpl>
    implements _$$MySatStateImplCopyWith<$Res> {
  __$$MySatStateImplCopyWithImpl(
    _$MySatStateImpl _value,
    $Res Function(_$MySatStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MySatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sats = null,
    Object? data = freezed,
    Object? dataFiltrada = freezed,
    Object? filters = freezed,
  }) {
    return _then(
      _$MySatStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        sats:
            null == sats
                ? _value._sats
                : sats // ignore: cast_nullable_to_non_nullable
                    as List<Intervenciones>,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
        dataFiltrada:
            freezed == dataFiltrada
                ? _value.dataFiltrada
                : dataFiltrada // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
        filters:
            freezed == filters
                ? _value.filters
                : filters // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$MySatStateImpl implements _MySatState {
  const _$MySatStateImpl({
    this.loading = false,
    final List<Intervenciones> sats = const <Intervenciones>[],
    this.data,
    this.dataFiltrada,
    this.filters,
  }) : _sats = sats;

  @override
  @JsonKey()
  final bool loading;
  final List<Intervenciones> _sats;
  @override
  @JsonKey()
  List<Intervenciones> get sats {
    if (_sats is EqualUnmodifiableListView) return _sats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sats);
  }

  @override
  final DataTableSource? data;
  @override
  final DataTableSource? dataFiltrada;
  @override
  final String? filters;

  @override
  String toString() {
    return 'MySatState(loading: $loading, sats: $sats, data: $data, dataFiltrada: $dataFiltrada, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MySatStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._sats, _sats) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.dataFiltrada, dataFiltrada) ||
                other.dataFiltrada == dataFiltrada) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_sats),
    data,
    dataFiltrada,
    filters,
  );

  /// Create a copy of MySatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MySatStateImplCopyWith<_$MySatStateImpl> get copyWith =>
      __$$MySatStateImplCopyWithImpl<_$MySatStateImpl>(this, _$identity);
}

abstract class _MySatState implements MySatState {
  const factory _MySatState({
    final bool loading,
    final List<Intervenciones> sats,
    final DataTableSource? data,
    final DataTableSource? dataFiltrada,
    final String? filters,
  }) = _$MySatStateImpl;

  @override
  bool get loading;
  @override
  List<Intervenciones> get sats;
  @override
  DataTableSource? get data;
  @override
  DataTableSource? get dataFiltrada;
  @override
  String? get filters;

  /// Create a copy of MySatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MySatStateImplCopyWith<_$MySatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
