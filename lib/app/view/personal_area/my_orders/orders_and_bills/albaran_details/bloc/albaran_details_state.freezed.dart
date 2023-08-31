// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'albaran_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlbaranDetailState {
  bool get loading => throw _privateConstructorUsedError;
  List<AlbaranDetails> get details => throw _privateConstructorUsedError;
  Albaran? get albaran => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbaranDetailStateCopyWith<AlbaranDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbaranDetailStateCopyWith<$Res> {
  factory $AlbaranDetailStateCopyWith(
          AlbaranDetailState value, $Res Function(AlbaranDetailState) then) =
      _$AlbaranDetailStateCopyWithImpl<$Res, AlbaranDetailState>;
  @useResult
  $Res call({bool loading, List<AlbaranDetails> details, Albaran? albaran});
}

/// @nodoc
class _$AlbaranDetailStateCopyWithImpl<$Res, $Val extends AlbaranDetailState>
    implements $AlbaranDetailStateCopyWith<$Res> {
  _$AlbaranDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? details = null,
    Object? albaran = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<AlbaranDetails>,
      albaran: freezed == albaran
          ? _value.albaran
          : albaran // ignore: cast_nullable_to_non_nullable
              as Albaran?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbaranDetailStateCopyWith<$Res>
    implements $AlbaranDetailStateCopyWith<$Res> {
  factory _$$_AlbaranDetailStateCopyWith(_$_AlbaranDetailState value,
          $Res Function(_$_AlbaranDetailState) then) =
      __$$_AlbaranDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<AlbaranDetails> details, Albaran? albaran});
}

/// @nodoc
class __$$_AlbaranDetailStateCopyWithImpl<$Res>
    extends _$AlbaranDetailStateCopyWithImpl<$Res, _$_AlbaranDetailState>
    implements _$$_AlbaranDetailStateCopyWith<$Res> {
  __$$_AlbaranDetailStateCopyWithImpl(
      _$_AlbaranDetailState _value, $Res Function(_$_AlbaranDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? details = null,
    Object? albaran = freezed,
  }) {
    return _then(_$_AlbaranDetailState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<AlbaranDetails>,
      albaran: freezed == albaran
          ? _value.albaran
          : albaran // ignore: cast_nullable_to_non_nullable
              as Albaran?,
    ));
  }
}

/// @nodoc

class _$_AlbaranDetailState extends _AlbaranDetailState {
  const _$_AlbaranDetailState(
      {this.loading = false,
      final List<AlbaranDetails> details = const <AlbaranDetails>[],
      this.albaran})
      : _details = details,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<AlbaranDetails> _details;
  @override
  @JsonKey()
  List<AlbaranDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final Albaran? albaran;

  @override
  String toString() {
    return 'AlbaranDetailState(loading: $loading, details: $details, albaran: $albaran)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbaranDetailState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.albaran, albaran) || other.albaran == albaran));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_details), albaran);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbaranDetailStateCopyWith<_$_AlbaranDetailState> get copyWith =>
      __$$_AlbaranDetailStateCopyWithImpl<_$_AlbaranDetailState>(
          this, _$identity);
}

abstract class _AlbaranDetailState extends AlbaranDetailState {
  const factory _AlbaranDetailState(
      {final bool loading,
      final List<AlbaranDetails> details,
      final Albaran? albaran}) = _$_AlbaranDetailState;
  const _AlbaranDetailState._() : super._();

  @override
  bool get loading;
  @override
  List<AlbaranDetails> get details;
  @override
  Albaran? get albaran;
  @override
  @JsonKey(ignore: true)
  _$$_AlbaranDetailStateCopyWith<_$_AlbaranDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
