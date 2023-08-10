// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enroll_training_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EnrollTrainingState {
// @Default(false) bool loading,
  int get peopleCounter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnrollTrainingStateCopyWith<EnrollTrainingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollTrainingStateCopyWith<$Res> {
  factory $EnrollTrainingStateCopyWith(
          EnrollTrainingState value, $Res Function(EnrollTrainingState) then) =
      _$EnrollTrainingStateCopyWithImpl<$Res, EnrollTrainingState>;
  @useResult
  $Res call({int peopleCounter});
}

/// @nodoc
class _$EnrollTrainingStateCopyWithImpl<$Res, $Val extends EnrollTrainingState>
    implements $EnrollTrainingStateCopyWith<$Res> {
  _$EnrollTrainingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peopleCounter = null,
  }) {
    return _then(_value.copyWith(
      peopleCounter: null == peopleCounter
          ? _value.peopleCounter
          : peopleCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnrollTrainingStateCopyWith<$Res>
    implements $EnrollTrainingStateCopyWith<$Res> {
  factory _$$_EnrollTrainingStateCopyWith(_$_EnrollTrainingState value,
          $Res Function(_$_EnrollTrainingState) then) =
      __$$_EnrollTrainingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int peopleCounter});
}

/// @nodoc
class __$$_EnrollTrainingStateCopyWithImpl<$Res>
    extends _$EnrollTrainingStateCopyWithImpl<$Res, _$_EnrollTrainingState>
    implements _$$_EnrollTrainingStateCopyWith<$Res> {
  __$$_EnrollTrainingStateCopyWithImpl(_$_EnrollTrainingState _value,
      $Res Function(_$_EnrollTrainingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peopleCounter = null,
  }) {
    return _then(_$_EnrollTrainingState(
      peopleCounter: null == peopleCounter
          ? _value.peopleCounter
          : peopleCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_EnrollTrainingState extends _EnrollTrainingState {
  const _$_EnrollTrainingState({this.peopleCounter = 0}) : super._();

// @Default(false) bool loading,
  @override
  @JsonKey()
  final int peopleCounter;

  @override
  String toString() {
    return 'EnrollTrainingState(peopleCounter: $peopleCounter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnrollTrainingState &&
            (identical(other.peopleCounter, peopleCounter) ||
                other.peopleCounter == peopleCounter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, peopleCounter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnrollTrainingStateCopyWith<_$_EnrollTrainingState> get copyWith =>
      __$$_EnrollTrainingStateCopyWithImpl<_$_EnrollTrainingState>(
          this, _$identity);
}

abstract class _EnrollTrainingState extends EnrollTrainingState {
  const factory _EnrollTrainingState({final int peopleCounter}) =
      _$_EnrollTrainingState;
  const _EnrollTrainingState._() : super._();

  @override // @Default(false) bool loading,
  int get peopleCounter;
  @override
  @JsonKey(ignore: true)
  _$$_EnrollTrainingStateCopyWith<_$_EnrollTrainingState> get copyWith =>
      throw _privateConstructorUsedError;
}
