// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsCounterState {
  int get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsCounterStateCopyWith<NotificationsCounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCounterStateCopyWith<$Res> {
  factory $NotificationsCounterStateCopyWith(NotificationsCounterState value,
          $Res Function(NotificationsCounterState) then) =
      _$NotificationsCounterStateCopyWithImpl<$Res, NotificationsCounterState>;
  @useResult
  $Res call({int notifications});
}

/// @nodoc
class _$NotificationsCounterStateCopyWithImpl<$Res,
        $Val extends NotificationsCounterState>
    implements $NotificationsCounterStateCopyWith<$Res> {
  _$NotificationsCounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationsCounterStateCopyWith<$Res>
    implements $NotificationsCounterStateCopyWith<$Res> {
  factory _$$_NotificationsCounterStateCopyWith(
          _$_NotificationsCounterState value,
          $Res Function(_$_NotificationsCounterState) then) =
      __$$_NotificationsCounterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int notifications});
}

/// @nodoc
class __$$_NotificationsCounterStateCopyWithImpl<$Res>
    extends _$NotificationsCounterStateCopyWithImpl<$Res,
        _$_NotificationsCounterState>
    implements _$$_NotificationsCounterStateCopyWith<$Res> {
  __$$_NotificationsCounterStateCopyWithImpl(
      _$_NotificationsCounterState _value,
      $Res Function(_$_NotificationsCounterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$_NotificationsCounterState(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NotificationsCounterState extends _NotificationsCounterState {
  const _$_NotificationsCounterState({this.notifications = 0}) : super._();

  @override
  @JsonKey()
  final int notifications;

  @override
  String toString() {
    return 'NotificationsCounterState(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsCounterState &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsCounterStateCopyWith<_$_NotificationsCounterState>
      get copyWith => __$$_NotificationsCounterStateCopyWithImpl<
          _$_NotificationsCounterState>(this, _$identity);
}

abstract class _NotificationsCounterState extends NotificationsCounterState {
  const factory _NotificationsCounterState({final int notifications}) =
      _$_NotificationsCounterState;
  const _NotificationsCounterState._() : super._();

  @override
  int get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsCounterStateCopyWith<_$_NotificationsCounterState>
      get copyWith => throw _privateConstructorUsedError;
}
