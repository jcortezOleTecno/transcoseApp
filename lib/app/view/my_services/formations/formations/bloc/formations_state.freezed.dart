// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormationsState {
  bool get loading => throw _privateConstructorUsedError;
  List<Formations> get formations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormationsStateCopyWith<FormationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormationsStateCopyWith<$Res> {
  factory $FormationsStateCopyWith(
          FormationsState value, $Res Function(FormationsState) then) =
      _$FormationsStateCopyWithImpl<$Res, FormationsState>;
  @useResult
  $Res call({bool loading, List<Formations> formations});
}

/// @nodoc
class _$FormationsStateCopyWithImpl<$Res, $Val extends FormationsState>
    implements $FormationsStateCopyWith<$Res> {
  _$FormationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? formations = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      formations: null == formations
          ? _value.formations
          : formations // ignore: cast_nullable_to_non_nullable
              as List<Formations>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormationsStateCopyWith<$Res>
    implements $FormationsStateCopyWith<$Res> {
  factory _$$_FormationsStateCopyWith(
          _$_FormationsState value, $Res Function(_$_FormationsState) then) =
      __$$_FormationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Formations> formations});
}

/// @nodoc
class __$$_FormationsStateCopyWithImpl<$Res>
    extends _$FormationsStateCopyWithImpl<$Res, _$_FormationsState>
    implements _$$_FormationsStateCopyWith<$Res> {
  __$$_FormationsStateCopyWithImpl(
      _$_FormationsState _value, $Res Function(_$_FormationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? formations = null,
  }) {
    return _then(_$_FormationsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      formations: null == formations
          ? _value._formations
          : formations // ignore: cast_nullable_to_non_nullable
              as List<Formations>,
    ));
  }
}

/// @nodoc

class _$_FormationsState extends _FormationsState {
  const _$_FormationsState(
      {this.loading = false,
      final List<Formations> formations = const <Formations>[]})
      : _formations = formations,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<Formations> _formations;
  @override
  @JsonKey()
  List<Formations> get formations {
    if (_formations is EqualUnmodifiableListView) return _formations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formations);
  }

  @override
  String toString() {
    return 'FormationsState(loading: $loading, formations: $formations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormationsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._formations, _formations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_formations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormationsStateCopyWith<_$_FormationsState> get copyWith =>
      __$$_FormationsStateCopyWithImpl<_$_FormationsState>(this, _$identity);
}

abstract class _FormationsState extends FormationsState {
  const factory _FormationsState(
      {final bool loading,
      final List<Formations> formations}) = _$_FormationsState;
  const _FormationsState._() : super._();

  @override
  bool get loading;
  @override
  List<Formations> get formations;
  @override
  @JsonKey(ignore: true)
  _$$_FormationsStateCopyWith<_$_FormationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
