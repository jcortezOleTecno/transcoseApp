// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EventsState {
  bool get loading =>
      throw _privateConstructorUsedError; // @Default(<Header>[]) List<Header> headers,
  Header? get hPage => throw _privateConstructorUsedError;
  Header? get hMyEvents => throw _privateConstructorUsedError;
  Header? get hEventosVemare => throw _privateConstructorUsedError;
  Header? get hEventosCelebrados => throw _privateConstructorUsedError;

  /// Create a copy of EventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsStateCopyWith<EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsStateCopyWith<$Res> {
  factory $EventsStateCopyWith(
    EventsState value,
    $Res Function(EventsState) then,
  ) = _$EventsStateCopyWithImpl<$Res, EventsState>;
  @useResult
  $Res call({
    bool loading,
    Header? hPage,
    Header? hMyEvents,
    Header? hEventosVemare,
    Header? hEventosCelebrados,
  });
}

/// @nodoc
class _$EventsStateCopyWithImpl<$Res, $Val extends EventsState>
    implements $EventsStateCopyWith<$Res> {
  _$EventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hPage = freezed,
    Object? hMyEvents = freezed,
    Object? hEventosVemare = freezed,
    Object? hEventosCelebrados = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            hPage:
                freezed == hPage
                    ? _value.hPage
                    : hPage // ignore: cast_nullable_to_non_nullable
                        as Header?,
            hMyEvents:
                freezed == hMyEvents
                    ? _value.hMyEvents
                    : hMyEvents // ignore: cast_nullable_to_non_nullable
                        as Header?,
            hEventosVemare:
                freezed == hEventosVemare
                    ? _value.hEventosVemare
                    : hEventosVemare // ignore: cast_nullable_to_non_nullable
                        as Header?,
            hEventosCelebrados:
                freezed == hEventosCelebrados
                    ? _value.hEventosCelebrados
                    : hEventosCelebrados // ignore: cast_nullable_to_non_nullable
                        as Header?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventsStateImplCopyWith<$Res>
    implements $EventsStateCopyWith<$Res> {
  factory _$$EventsStateImplCopyWith(
    _$EventsStateImpl value,
    $Res Function(_$EventsStateImpl) then,
  ) = __$$EventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    Header? hPage,
    Header? hMyEvents,
    Header? hEventosVemare,
    Header? hEventosCelebrados,
  });
}

/// @nodoc
class __$$EventsStateImplCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$EventsStateImpl>
    implements _$$EventsStateImplCopyWith<$Res> {
  __$$EventsStateImplCopyWithImpl(
    _$EventsStateImpl _value,
    $Res Function(_$EventsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hPage = freezed,
    Object? hMyEvents = freezed,
    Object? hEventosVemare = freezed,
    Object? hEventosCelebrados = freezed,
  }) {
    return _then(
      _$EventsStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        hPage:
            freezed == hPage
                ? _value.hPage
                : hPage // ignore: cast_nullable_to_non_nullable
                    as Header?,
        hMyEvents:
            freezed == hMyEvents
                ? _value.hMyEvents
                : hMyEvents // ignore: cast_nullable_to_non_nullable
                    as Header?,
        hEventosVemare:
            freezed == hEventosVemare
                ? _value.hEventosVemare
                : hEventosVemare // ignore: cast_nullable_to_non_nullable
                    as Header?,
        hEventosCelebrados:
            freezed == hEventosCelebrados
                ? _value.hEventosCelebrados
                : hEventosCelebrados // ignore: cast_nullable_to_non_nullable
                    as Header?,
      ),
    );
  }
}

/// @nodoc

class _$EventsStateImpl extends _EventsState {
  const _$EventsStateImpl({
    this.loading = false,
    this.hPage,
    this.hMyEvents,
    this.hEventosVemare,
    this.hEventosCelebrados,
  }) : super._();

  @override
  @JsonKey()
  final bool loading;
  // @Default(<Header>[]) List<Header> headers,
  @override
  final Header? hPage;
  @override
  final Header? hMyEvents;
  @override
  final Header? hEventosVemare;
  @override
  final Header? hEventosCelebrados;

  @override
  String toString() {
    return 'EventsState(loading: $loading, hPage: $hPage, hMyEvents: $hMyEvents, hEventosVemare: $hEventosVemare, hEventosCelebrados: $hEventosCelebrados)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.hPage, hPage) || other.hPage == hPage) &&
            (identical(other.hMyEvents, hMyEvents) ||
                other.hMyEvents == hMyEvents) &&
            (identical(other.hEventosVemare, hEventosVemare) ||
                other.hEventosVemare == hEventosVemare) &&
            (identical(other.hEventosCelebrados, hEventosCelebrados) ||
                other.hEventosCelebrados == hEventosCelebrados));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    hPage,
    hMyEvents,
    hEventosVemare,
    hEventosCelebrados,
  );

  /// Create a copy of EventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsStateImplCopyWith<_$EventsStateImpl> get copyWith =>
      __$$EventsStateImplCopyWithImpl<_$EventsStateImpl>(this, _$identity);
}

abstract class _EventsState extends EventsState {
  const factory _EventsState({
    final bool loading,
    final Header? hPage,
    final Header? hMyEvents,
    final Header? hEventosVemare,
    final Header? hEventosCelebrados,
  }) = _$EventsStateImpl;
  const _EventsState._() : super._();

  @override
  bool get loading; // @Default(<Header>[]) List<Header> headers,
  @override
  Header? get hPage;
  @override
  Header? get hMyEvents;
  @override
  Header? get hEventosVemare;
  @override
  Header? get hEventosCelebrados;

  /// Create a copy of EventsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsStateImplCopyWith<_$EventsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
