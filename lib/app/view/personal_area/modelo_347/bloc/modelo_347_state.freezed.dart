// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modelo_347_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Modelo347State {
  bool get loading => throw _privateConstructorUsedError;
  List<Modelo347> get modelos => throw _privateConstructorUsedError;
  String? get yearSelect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Modelo347StateCopyWith<Modelo347State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Modelo347StateCopyWith<$Res> {
  factory $Modelo347StateCopyWith(
          Modelo347State value, $Res Function(Modelo347State) then) =
      _$Modelo347StateCopyWithImpl<$Res, Modelo347State>;
  @useResult
  $Res call({bool loading, List<Modelo347> modelos, String? yearSelect});
}

/// @nodoc
class _$Modelo347StateCopyWithImpl<$Res, $Val extends Modelo347State>
    implements $Modelo347StateCopyWith<$Res> {
  _$Modelo347StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? modelos = null,
    Object? yearSelect = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      modelos: null == modelos
          ? _value.modelos
          : modelos // ignore: cast_nullable_to_non_nullable
              as List<Modelo347>,
      yearSelect: freezed == yearSelect
          ? _value.yearSelect
          : yearSelect // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Modelo347StateCopyWith<$Res>
    implements $Modelo347StateCopyWith<$Res> {
  factory _$$_Modelo347StateCopyWith(
          _$_Modelo347State value, $Res Function(_$_Modelo347State) then) =
      __$$_Modelo347StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Modelo347> modelos, String? yearSelect});
}

/// @nodoc
class __$$_Modelo347StateCopyWithImpl<$Res>
    extends _$Modelo347StateCopyWithImpl<$Res, _$_Modelo347State>
    implements _$$_Modelo347StateCopyWith<$Res> {
  __$$_Modelo347StateCopyWithImpl(
      _$_Modelo347State _value, $Res Function(_$_Modelo347State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? modelos = null,
    Object? yearSelect = freezed,
  }) {
    return _then(_$_Modelo347State(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      modelos: null == modelos
          ? _value._modelos
          : modelos // ignore: cast_nullable_to_non_nullable
              as List<Modelo347>,
      yearSelect: freezed == yearSelect
          ? _value.yearSelect
          : yearSelect // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Modelo347State implements _Modelo347State {
  const _$_Modelo347State(
      {this.loading = false,
      final List<Modelo347> modelos = const <Modelo347>[],
      this.yearSelect = '2021'})
      : _modelos = modelos;

  @override
  @JsonKey()
  final bool loading;
  final List<Modelo347> _modelos;
  @override
  @JsonKey()
  List<Modelo347> get modelos {
    if (_modelos is EqualUnmodifiableListView) return _modelos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modelos);
  }

  @override
  @JsonKey()
  final String? yearSelect;

  @override
  String toString() {
    return 'Modelo347State(loading: $loading, modelos: $modelos, yearSelect: $yearSelect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Modelo347State &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._modelos, _modelos) &&
            (identical(other.yearSelect, yearSelect) ||
                other.yearSelect == yearSelect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_modelos), yearSelect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Modelo347StateCopyWith<_$_Modelo347State> get copyWith =>
      __$$_Modelo347StateCopyWithImpl<_$_Modelo347State>(this, _$identity);
}

abstract class _Modelo347State implements Modelo347State {
  const factory _Modelo347State(
      {final bool loading,
      final List<Modelo347> modelos,
      final String? yearSelect}) = _$_Modelo347State;

  @override
  bool get loading;
  @override
  List<Modelo347> get modelos;
  @override
  String? get yearSelect;
  @override
  @JsonKey(ignore: true)
  _$$_Modelo347StateCopyWith<_$_Modelo347State> get copyWith =>
      throw _privateConstructorUsedError;
}
