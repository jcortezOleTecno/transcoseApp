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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationsCounterState {
  int get notifications => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsCounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsCounterStateCopyWith<NotificationsCounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCounterStateCopyWith<$Res> {
  factory $NotificationsCounterStateCopyWith(
    NotificationsCounterState value,
    $Res Function(NotificationsCounterState) then,
  ) = _$NotificationsCounterStateCopyWithImpl<$Res, NotificationsCounterState>;
  @useResult
  $Res call({int notifications});
}

/// @nodoc
class _$NotificationsCounterStateCopyWithImpl<
  $Res,
  $Val extends NotificationsCounterState
>
    implements $NotificationsCounterStateCopyWith<$Res> {
  _$NotificationsCounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsCounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null}) {
    return _then(
      _value.copyWith(
            notifications:
                null == notifications
                    ? _value.notifications
                    : notifications // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationsCounterStateImplCopyWith<$Res>
    implements $NotificationsCounterStateCopyWith<$Res> {
  factory _$$NotificationsCounterStateImplCopyWith(
    _$NotificationsCounterStateImpl value,
    $Res Function(_$NotificationsCounterStateImpl) then,
  ) = __$$NotificationsCounterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int notifications});
}

/// @nodoc
class __$$NotificationsCounterStateImplCopyWithImpl<$Res>
    extends
        _$NotificationsCounterStateCopyWithImpl<
          $Res,
          _$NotificationsCounterStateImpl
        >
    implements _$$NotificationsCounterStateImplCopyWith<$Res> {
  __$$NotificationsCounterStateImplCopyWithImpl(
    _$NotificationsCounterStateImpl _value,
    $Res Function(_$NotificationsCounterStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsCounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null}) {
    return _then(
      _$NotificationsCounterStateImpl(
        notifications:
            null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$NotificationsCounterStateImpl extends _NotificationsCounterState {
  const _$NotificationsCounterStateImpl({this.notifications = 0}) : super._();

  @override
  @JsonKey()
  final int notifications;

  @override
  String toString() {
    return 'NotificationsCounterState(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsCounterStateImpl &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notifications);

  /// Create a copy of NotificationsCounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsCounterStateImplCopyWith<_$NotificationsCounterStateImpl>
  get copyWith => __$$NotificationsCounterStateImplCopyWithImpl<
    _$NotificationsCounterStateImpl
  >(this, _$identity);
}

abstract class _NotificationsCounterState extends NotificationsCounterState {
  const factory _NotificationsCounterState({final int notifications}) =
      _$NotificationsCounterStateImpl;
  const _NotificationsCounterState._() : super._();

  @override
  int get notifications;

  /// Create a copy of NotificationsCounterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsCounterStateImplCopyWith<_$NotificationsCounterStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
