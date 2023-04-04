// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'where_we_are_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WhereWeAreState {
  List<Center> get centers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WhereWeAreStateCopyWith<WhereWeAreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhereWeAreStateCopyWith<$Res> {
  factory $WhereWeAreStateCopyWith(
          WhereWeAreState value, $Res Function(WhereWeAreState) then) =
      _$WhereWeAreStateCopyWithImpl<$Res, WhereWeAreState>;
  @useResult
  $Res call({List<Center> centers});
}

/// @nodoc
class _$WhereWeAreStateCopyWithImpl<$Res, $Val extends WhereWeAreState>
    implements $WhereWeAreStateCopyWith<$Res> {
  _$WhereWeAreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? centers = null,
  }) {
    return _then(_value.copyWith(
      centers: null == centers
          ? _value.centers
          : centers // ignore: cast_nullable_to_non_nullable
              as List<Center>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WhereWeAreStateCopyWith<$Res>
    implements $WhereWeAreStateCopyWith<$Res> {
  factory _$$_WhereWeAreStateCopyWith(
          _$_WhereWeAreState value, $Res Function(_$_WhereWeAreState) then) =
      __$$_WhereWeAreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Center> centers});
}

/// @nodoc
class __$$_WhereWeAreStateCopyWithImpl<$Res>
    extends _$WhereWeAreStateCopyWithImpl<$Res, _$_WhereWeAreState>
    implements _$$_WhereWeAreStateCopyWith<$Res> {
  __$$_WhereWeAreStateCopyWithImpl(
      _$_WhereWeAreState _value, $Res Function(_$_WhereWeAreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? centers = null,
  }) {
    return _then(_$_WhereWeAreState(
      centers: null == centers
          ? _value._centers
          : centers // ignore: cast_nullable_to_non_nullable
              as List<Center>,
    ));
  }
}

/// @nodoc

class _$_WhereWeAreState extends _WhereWeAreState {
  const _$_WhereWeAreState({final List<Center> centers = const <Center>[]})
      : _centers = centers,
        super._();

  final List<Center> _centers;
  @override
  @JsonKey()
  List<Center> get centers {
    if (_centers is EqualUnmodifiableListView) return _centers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_centers);
  }

  @override
  String toString() {
    return 'WhereWeAreState(centers: $centers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WhereWeAreState &&
            const DeepCollectionEquality().equals(other._centers, _centers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_centers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WhereWeAreStateCopyWith<_$_WhereWeAreState> get copyWith =>
      __$$_WhereWeAreStateCopyWithImpl<_$_WhereWeAreState>(this, _$identity);
}

abstract class _WhereWeAreState extends WhereWeAreState {
  const factory _WhereWeAreState({final List<Center> centers}) =
      _$_WhereWeAreState;
  const _WhereWeAreState._() : super._();

  @override
  List<Center> get centers;
  @override
  @JsonKey(ignore: true)
  _$$_WhereWeAreStateCopyWith<_$_WhereWeAreState> get copyWith =>
      throw _privateConstructorUsedError;
}
