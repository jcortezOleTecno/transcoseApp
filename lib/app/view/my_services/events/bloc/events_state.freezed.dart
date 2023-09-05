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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventsState {
  bool get loading =>
      throw _privateConstructorUsedError; // @Default(<Header>[]) List<Header> headers,
  Header? get hPage => throw _privateConstructorUsedError;
  Header? get hEventosVemare => throw _privateConstructorUsedError;
  Header? get hEventosCelebrados => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventsStateCopyWith<EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsStateCopyWith<$Res> {
  factory $EventsStateCopyWith(
          EventsState value, $Res Function(EventsState) then) =
      _$EventsStateCopyWithImpl<$Res, EventsState>;
  @useResult
  $Res call(
      {bool loading,
      Header? hPage,
      Header? hEventosVemare,
      Header? hEventosCelebrados});
}

/// @nodoc
class _$EventsStateCopyWithImpl<$Res, $Val extends EventsState>
    implements $EventsStateCopyWith<$Res> {
  _$EventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hPage = freezed,
    Object? hEventosVemare = freezed,
    Object? hEventosCelebrados = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hPage: freezed == hPage
          ? _value.hPage
          : hPage // ignore: cast_nullable_to_non_nullable
              as Header?,
      hEventosVemare: freezed == hEventosVemare
          ? _value.hEventosVemare
          : hEventosVemare // ignore: cast_nullable_to_non_nullable
              as Header?,
      hEventosCelebrados: freezed == hEventosCelebrados
          ? _value.hEventosCelebrados
          : hEventosCelebrados // ignore: cast_nullable_to_non_nullable
              as Header?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventsStateCopyWith<$Res>
    implements $EventsStateCopyWith<$Res> {
  factory _$$_EventsStateCopyWith(
          _$_EventsState value, $Res Function(_$_EventsState) then) =
      __$$_EventsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      Header? hPage,
      Header? hEventosVemare,
      Header? hEventosCelebrados});
}

/// @nodoc
class __$$_EventsStateCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$_EventsState>
    implements _$$_EventsStateCopyWith<$Res> {
  __$$_EventsStateCopyWithImpl(
      _$_EventsState _value, $Res Function(_$_EventsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hPage = freezed,
    Object? hEventosVemare = freezed,
    Object? hEventosCelebrados = freezed,
  }) {
    return _then(_$_EventsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hPage: freezed == hPage
          ? _value.hPage
          : hPage // ignore: cast_nullable_to_non_nullable
              as Header?,
      hEventosVemare: freezed == hEventosVemare
          ? _value.hEventosVemare
          : hEventosVemare // ignore: cast_nullable_to_non_nullable
              as Header?,
      hEventosCelebrados: freezed == hEventosCelebrados
          ? _value.hEventosCelebrados
          : hEventosCelebrados // ignore: cast_nullable_to_non_nullable
              as Header?,
    ));
  }
}

/// @nodoc

class _$_EventsState extends _EventsState {
  const _$_EventsState(
      {this.loading = false,
      this.hPage,
      this.hEventosVemare,
      this.hEventosCelebrados})
      : super._();

  @override
  @JsonKey()
  final bool loading;
// @Default(<Header>[]) List<Header> headers,
  @override
  final Header? hPage;
  @override
  final Header? hEventosVemare;
  @override
  final Header? hEventosCelebrados;

  @override
  String toString() {
    return 'EventsState(loading: $loading, hPage: $hPage, hEventosVemare: $hEventosVemare, hEventosCelebrados: $hEventosCelebrados)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.hPage, hPage) || other.hPage == hPage) &&
            (identical(other.hEventosVemare, hEventosVemare) ||
                other.hEventosVemare == hEventosVemare) &&
            (identical(other.hEventosCelebrados, hEventosCelebrados) ||
                other.hEventosCelebrados == hEventosCelebrados));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, hPage, hEventosVemare, hEventosCelebrados);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventsStateCopyWith<_$_EventsState> get copyWith =>
      __$$_EventsStateCopyWithImpl<_$_EventsState>(this, _$identity);
}

abstract class _EventsState extends EventsState {
  const factory _EventsState(
      {final bool loading,
      final Header? hPage,
      final Header? hEventosVemare,
      final Header? hEventosCelebrados}) = _$_EventsState;
  const _EventsState._() : super._();

  @override
  bool get loading;
  @override // @Default(<Header>[]) List<Header> headers,
  Header? get hPage;
  @override
  Header? get hEventosVemare;
  @override
  Header? get hEventosCelebrados;
  @override
  @JsonKey(ignore: true)
  _$$_EventsStateCopyWith<_$_EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}
