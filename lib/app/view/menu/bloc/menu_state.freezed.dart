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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MenuState {
  bool get isOpenMenu => throw _privateConstructorUsedError;
  bool get isOpenNotification => throw _privateConstructorUsedError;
  List<Notification> get notifications => throw _privateConstructorUsedError;
  WorkWithUs? get workWithUs => throw _privateConstructorUsedError;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuStateCopyWith<MenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) then) =
      _$MenuStateCopyWithImpl<$Res, MenuState>;
  @useResult
  $Res call({
    bool isOpenMenu,
    bool isOpenNotification,
    List<Notification> notifications,
    WorkWithUs? workWithUs,
  });
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res, $Val extends MenuState>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpenMenu = null,
    Object? isOpenNotification = null,
    Object? notifications = null,
    Object? workWithUs = freezed,
  }) {
    return _then(
      _value.copyWith(
            isOpenMenu:
                null == isOpenMenu
                    ? _value.isOpenMenu
                    : isOpenMenu // ignore: cast_nullable_to_non_nullable
                        as bool,
            isOpenNotification:
                null == isOpenNotification
                    ? _value.isOpenNotification
                    : isOpenNotification // ignore: cast_nullable_to_non_nullable
                        as bool,
            notifications:
                null == notifications
                    ? _value.notifications
                    : notifications // ignore: cast_nullable_to_non_nullable
                        as List<Notification>,
            workWithUs:
                freezed == workWithUs
                    ? _value.workWithUs
                    : workWithUs // ignore: cast_nullable_to_non_nullable
                        as WorkWithUs?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuStateImplCopyWith<$Res>
    implements $MenuStateCopyWith<$Res> {
  factory _$$MenuStateImplCopyWith(
    _$MenuStateImpl value,
    $Res Function(_$MenuStateImpl) then,
  ) = __$$MenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isOpenMenu,
    bool isOpenNotification,
    List<Notification> notifications,
    WorkWithUs? workWithUs,
  });
}

/// @nodoc
class __$$MenuStateImplCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$MenuStateImpl>
    implements _$$MenuStateImplCopyWith<$Res> {
  __$$MenuStateImplCopyWithImpl(
    _$MenuStateImpl _value,
    $Res Function(_$MenuStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpenMenu = null,
    Object? isOpenNotification = null,
    Object? notifications = null,
    Object? workWithUs = freezed,
  }) {
    return _then(
      _$MenuStateImpl(
        isOpenMenu:
            null == isOpenMenu
                ? _value.isOpenMenu
                : isOpenMenu // ignore: cast_nullable_to_non_nullable
                    as bool,
        isOpenNotification:
            null == isOpenNotification
                ? _value.isOpenNotification
                : isOpenNotification // ignore: cast_nullable_to_non_nullable
                    as bool,
        notifications:
            null == notifications
                ? _value._notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as List<Notification>,
        workWithUs:
            freezed == workWithUs
                ? _value.workWithUs
                : workWithUs // ignore: cast_nullable_to_non_nullable
                    as WorkWithUs?,
      ),
    );
  }
}

/// @nodoc

class _$MenuStateImpl extends _MenuState {
  const _$MenuStateImpl({
    this.isOpenMenu = false,
    this.isOpenNotification = false,
    final List<Notification> notifications = const <Notification>[],
    this.workWithUs,
  }) : _notifications = notifications,
       super._();

  @override
  @JsonKey()
  final bool isOpenMenu;
  @override
  @JsonKey()
  final bool isOpenNotification;
  final List<Notification> _notifications;
  @override
  @JsonKey()
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final WorkWithUs? workWithUs;

  @override
  String toString() {
    return 'MenuState(isOpenMenu: $isOpenMenu, isOpenNotification: $isOpenNotification, notifications: $notifications, workWithUs: $workWithUs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuStateImpl &&
            (identical(other.isOpenMenu, isOpenMenu) ||
                other.isOpenMenu == isOpenMenu) &&
            (identical(other.isOpenNotification, isOpenNotification) ||
                other.isOpenNotification == isOpenNotification) &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ) &&
            (identical(other.workWithUs, workWithUs) ||
                other.workWithUs == workWithUs));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isOpenMenu,
    isOpenNotification,
    const DeepCollectionEquality().hash(_notifications),
    workWithUs,
  );

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuStateImplCopyWith<_$MenuStateImpl> get copyWith =>
      __$$MenuStateImplCopyWithImpl<_$MenuStateImpl>(this, _$identity);
}

abstract class _MenuState extends MenuState {
  const factory _MenuState({
    final bool isOpenMenu,
    final bool isOpenNotification,
    final List<Notification> notifications,
    final WorkWithUs? workWithUs,
  }) = _$MenuStateImpl;
  const _MenuState._() : super._();

  @override
  bool get isOpenMenu;
  @override
  bool get isOpenNotification;
  @override
  List<Notification> get notifications;
  @override
  WorkWithUs? get workWithUs;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuStateImplCopyWith<_$MenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
