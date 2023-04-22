// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SatState {
  bool get loading => throw _privateConstructorUsedError;
  List<Intervenciones> get sats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SatStateCopyWith<SatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SatStateCopyWith<$Res> {
  factory $SatStateCopyWith(SatState value, $Res Function(SatState) then) =
      _$SatStateCopyWithImpl<$Res, SatState>;
  @useResult
  $Res call({bool loading, List<Intervenciones> sats});
}

/// @nodoc
class _$SatStateCopyWithImpl<$Res, $Val extends SatState>
    implements $SatStateCopyWith<$Res> {
  _$SatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sats = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sats: null == sats
          ? _value.sats
          : sats // ignore: cast_nullable_to_non_nullable
              as List<Intervenciones>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SatStateCopyWith<$Res> implements $SatStateCopyWith<$Res> {
  factory _$$_SatStateCopyWith(
          _$_SatState value, $Res Function(_$_SatState) then) =
      __$$_SatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Intervenciones> sats});
}

/// @nodoc
class __$$_SatStateCopyWithImpl<$Res>
    extends _$SatStateCopyWithImpl<$Res, _$_SatState>
    implements _$$_SatStateCopyWith<$Res> {
  __$$_SatStateCopyWithImpl(
      _$_SatState _value, $Res Function(_$_SatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? sats = null,
  }) {
    return _then(_$_SatState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sats: null == sats
          ? _value._sats
          : sats // ignore: cast_nullable_to_non_nullable
              as List<Intervenciones>,
    ));
  }
}

/// @nodoc

class _$_SatState implements _SatState {
  const _$_SatState(
      {this.loading = false,
      final List<Intervenciones> sats = const <Intervenciones>[]})
      : _sats = sats;

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
  String toString() {
    return 'SatState(loading: $loading, sats: $sats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SatState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._sats, _sats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_sats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SatStateCopyWith<_$_SatState> get copyWith =>
      __$$_SatStateCopyWithImpl<_$_SatState>(this, _$identity);
}

abstract class _SatState implements SatState {
  const factory _SatState(
      {final bool loading, final List<Intervenciones> sats}) = _$_SatState;

  @override
  bool get loading;
  @override
  List<Intervenciones> get sats;
  @override
  @JsonKey(ignore: true)
  _$$_SatStateCopyWith<_$_SatState> get copyWith =>
      throw _privateConstructorUsedError;
}
