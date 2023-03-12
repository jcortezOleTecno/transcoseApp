// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuState {
  bool get isOpenMenu => throw _privateConstructorUsedError;
  bool get isLogged => throw _privateConstructorUsedError;
  UserData? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuStateCopyWith<MenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) then) =
      _$MenuStateCopyWithImpl<$Res, MenuState>;
  @useResult
  $Res call({bool isOpenMenu, bool isLogged, UserData? user});
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res, $Val extends MenuState>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpenMenu = null,
    Object? isLogged = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isOpenMenu: null == isOpenMenu
          ? _value.isOpenMenu
          : isOpenMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogged: null == isLogged
          ? _value.isLogged
          : isLogged // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuStateCopyWith<$Res> implements $MenuStateCopyWith<$Res> {
  factory _$$_MenuStateCopyWith(
          _$_MenuState value, $Res Function(_$_MenuState) then) =
      __$$_MenuStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpenMenu, bool isLogged, UserData? user});
}

/// @nodoc
class __$$_MenuStateCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$_MenuState>
    implements _$$_MenuStateCopyWith<$Res> {
  __$$_MenuStateCopyWithImpl(
      _$_MenuState _value, $Res Function(_$_MenuState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpenMenu = null,
    Object? isLogged = null,
    Object? user = freezed,
  }) {
    return _then(_$_MenuState(
      isOpenMenu: null == isOpenMenu
          ? _value.isOpenMenu
          : isOpenMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogged: null == isLogged
          ? _value.isLogged
          : isLogged // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$_MenuState extends _MenuState {
  const _$_MenuState(
      {this.isOpenMenu = false, this.isLogged = false, this.user})
      : super._();

  @override
  @JsonKey()
  final bool isOpenMenu;
  @override
  @JsonKey()
  final bool isLogged;
  @override
  final UserData? user;

  @override
  String toString() {
    return 'MenuState(isOpenMenu: $isOpenMenu, isLogged: $isLogged, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuState &&
            (identical(other.isOpenMenu, isOpenMenu) ||
                other.isOpenMenu == isOpenMenu) &&
            (identical(other.isLogged, isLogged) ||
                other.isLogged == isLogged) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpenMenu, isLogged, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuStateCopyWith<_$_MenuState> get copyWith =>
      __$$_MenuStateCopyWithImpl<_$_MenuState>(this, _$identity);
}

abstract class _MenuState extends MenuState {
  const factory _MenuState(
      {final bool isOpenMenu,
      final bool isLogged,
      final UserData? user}) = _$_MenuState;
  const _MenuState._() : super._();

  @override
  bool get isOpenMenu;
  @override
  bool get isLogged;
  @override
  UserData? get user;
  @override
  @JsonKey(ignore: true)
  _$$_MenuStateCopyWith<_$_MenuState> get copyWith =>
      throw _privateConstructorUsedError;
}
