// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyAccountState {
  UserData? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAccountStateCopyWith<MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountStateCopyWith<$Res> {
  factory $MyAccountStateCopyWith(
          MyAccountState value, $Res Function(MyAccountState) then) =
      _$MyAccountStateCopyWithImpl<$Res, MyAccountState>;
  @useResult
  $Res call({UserData? user});
}

/// @nodoc
class _$MyAccountStateCopyWithImpl<$Res, $Val extends MyAccountState>
    implements $MyAccountStateCopyWith<$Res> {
  _$MyAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyAccountStateCopyWith<$Res>
    implements $MyAccountStateCopyWith<$Res> {
  factory _$$_MyAccountStateCopyWith(
          _$_MyAccountState value, $Res Function(_$_MyAccountState) then) =
      __$$_MyAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserData? user});
}

/// @nodoc
class __$$_MyAccountStateCopyWithImpl<$Res>
    extends _$MyAccountStateCopyWithImpl<$Res, _$_MyAccountState>
    implements _$$_MyAccountStateCopyWith<$Res> {
  __$$_MyAccountStateCopyWithImpl(
      _$_MyAccountState _value, $Res Function(_$_MyAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_MyAccountState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$_MyAccountState implements _MyAccountState {
  const _$_MyAccountState({this.user});

  @override
  final UserData? user;

  @override
  String toString() {
    return 'MyAccountState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyAccountState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyAccountStateCopyWith<_$_MyAccountState> get copyWith =>
      __$$_MyAccountStateCopyWithImpl<_$_MyAccountState>(this, _$identity);
}

abstract class _MyAccountState implements MyAccountState {
  const factory _MyAccountState({final UserData? user}) = _$_MyAccountState;

  @override
  UserData? get user;
  @override
  @JsonKey(ignore: true)
  _$$_MyAccountStateCopyWith<_$_MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
