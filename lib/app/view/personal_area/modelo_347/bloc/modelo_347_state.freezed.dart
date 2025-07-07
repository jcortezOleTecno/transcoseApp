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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Modelo347State {
  bool get loading => throw _privateConstructorUsedError;
  List<Modelo347> get modelos => throw _privateConstructorUsedError;
  String? get yearSelect => throw _privateConstructorUsedError;

  /// Create a copy of Modelo347State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Modelo347StateCopyWith<Modelo347State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Modelo347StateCopyWith<$Res> {
  factory $Modelo347StateCopyWith(
    Modelo347State value,
    $Res Function(Modelo347State) then,
  ) = _$Modelo347StateCopyWithImpl<$Res, Modelo347State>;
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

  /// Create a copy of Modelo347State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? modelos = null,
    Object? yearSelect = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            modelos:
                null == modelos
                    ? _value.modelos
                    : modelos // ignore: cast_nullable_to_non_nullable
                        as List<Modelo347>,
            yearSelect:
                freezed == yearSelect
                    ? _value.yearSelect
                    : yearSelect // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Modelo347StateImplCopyWith<$Res>
    implements $Modelo347StateCopyWith<$Res> {
  factory _$$Modelo347StateImplCopyWith(
    _$Modelo347StateImpl value,
    $Res Function(_$Modelo347StateImpl) then,
  ) = __$$Modelo347StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Modelo347> modelos, String? yearSelect});
}

/// @nodoc
class __$$Modelo347StateImplCopyWithImpl<$Res>
    extends _$Modelo347StateCopyWithImpl<$Res, _$Modelo347StateImpl>
    implements _$$Modelo347StateImplCopyWith<$Res> {
  __$$Modelo347StateImplCopyWithImpl(
    _$Modelo347StateImpl _value,
    $Res Function(_$Modelo347StateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Modelo347State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? modelos = null,
    Object? yearSelect = freezed,
  }) {
    return _then(
      _$Modelo347StateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        modelos:
            null == modelos
                ? _value._modelos
                : modelos // ignore: cast_nullable_to_non_nullable
                    as List<Modelo347>,
        yearSelect:
            freezed == yearSelect
                ? _value.yearSelect
                : yearSelect // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$Modelo347StateImpl implements _Modelo347State {
  const _$Modelo347StateImpl({
    this.loading = false,
    final List<Modelo347> modelos = const <Modelo347>[],
    this.yearSelect = '2021',
  }) : _modelos = modelos;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Modelo347StateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._modelos, _modelos) &&
            (identical(other.yearSelect, yearSelect) ||
                other.yearSelect == yearSelect));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_modelos),
    yearSelect,
  );

  /// Create a copy of Modelo347State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Modelo347StateImplCopyWith<_$Modelo347StateImpl> get copyWith =>
      __$$Modelo347StateImplCopyWithImpl<_$Modelo347StateImpl>(
        this,
        _$identity,
      );
}

abstract class _Modelo347State implements Modelo347State {
  const factory _Modelo347State({
    final bool loading,
    final List<Modelo347> modelos,
    final String? yearSelect,
  }) = _$Modelo347StateImpl;

  @override
  bool get loading;
  @override
  List<Modelo347> get modelos;
  @override
  String? get yearSelect;

  /// Create a copy of Modelo347State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Modelo347StateImplCopyWith<_$Modelo347StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
