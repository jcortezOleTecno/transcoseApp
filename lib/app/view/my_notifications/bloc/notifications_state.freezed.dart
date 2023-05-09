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
mixin _$NotificationsState {
  bool get loading => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  List<Notification> get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
  @useResult
  $Res call(
      {bool loading, NotificationType type, List<Notification> notifications});
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? type = null,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationsStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$_NotificationsStateCopyWith(_$_NotificationsState value,
          $Res Function(_$_NotificationsState) then) =
      __$$_NotificationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, NotificationType type, List<Notification> notifications});
}

/// @nodoc
class __$$_NotificationsStateCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsState>
    implements _$$_NotificationsStateCopyWith<$Res> {
  __$$_NotificationsStateCopyWithImpl(
      _$_NotificationsState _value, $Res Function(_$_NotificationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? type = null,
    Object? notifications = null,
  }) {
    return _then(_$_NotificationsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ));
  }
}

/// @nodoc

class _$_NotificationsState implements _NotificationsState {
  const _$_NotificationsState(
      {this.loading = false,
      this.type = NotificationType.general,
      final List<Notification> notifications = const <Notification>[]})
      : _notifications = notifications;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final NotificationType type;
  final List<Notification> _notifications;
  @override
  @JsonKey()
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsState(loading: $loading, type: $type, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, type,
      const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsStateCopyWith<_$_NotificationsState> get copyWith =>
      __$$_NotificationsStateCopyWithImpl<_$_NotificationsState>(
          this, _$identity);
}

abstract class _NotificationsState implements NotificationsState {
  const factory _NotificationsState(
      {final bool loading,
      final NotificationType type,
      final List<Notification> notifications}) = _$_NotificationsState;

  @override
  bool get loading;
  @override
  NotificationType get type;
  @override
  List<Notification> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsStateCopyWith<_$_NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
