// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_events_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtherEventsState {
  bool get loading => throw _privateConstructorUsedError;
  List<Events> get events => throw _privateConstructorUsedError;
  HeaderEvents? get header => throw _privateConstructorUsedError;

  /// Create a copy of OtherEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtherEventsStateCopyWith<OtherEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherEventsStateCopyWith<$Res> {
  factory $OtherEventsStateCopyWith(
    OtherEventsState value,
    $Res Function(OtherEventsState) then,
  ) = _$OtherEventsStateCopyWithImpl<$Res, OtherEventsState>;
  @useResult
  $Res call({bool loading, List<Events> events, HeaderEvents? header});
}

/// @nodoc
class _$OtherEventsStateCopyWithImpl<$Res, $Val extends OtherEventsState>
    implements $OtherEventsStateCopyWith<$Res> {
  _$OtherEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtherEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? events = null,
    Object? header = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            events:
                null == events
                    ? _value.events
                    : events // ignore: cast_nullable_to_non_nullable
                        as List<Events>,
            header:
                freezed == header
                    ? _value.header
                    : header // ignore: cast_nullable_to_non_nullable
                        as HeaderEvents?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtherEventsStateImplCopyWith<$Res>
    implements $OtherEventsStateCopyWith<$Res> {
  factory _$$OtherEventsStateImplCopyWith(
    _$OtherEventsStateImpl value,
    $Res Function(_$OtherEventsStateImpl) then,
  ) = __$$OtherEventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Events> events, HeaderEvents? header});
}

/// @nodoc
class __$$OtherEventsStateImplCopyWithImpl<$Res>
    extends _$OtherEventsStateCopyWithImpl<$Res, _$OtherEventsStateImpl>
    implements _$$OtherEventsStateImplCopyWith<$Res> {
  __$$OtherEventsStateImplCopyWithImpl(
    _$OtherEventsStateImpl _value,
    $Res Function(_$OtherEventsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtherEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? events = null,
    Object? header = freezed,
  }) {
    return _then(
      _$OtherEventsStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        events:
            null == events
                ? _value._events
                : events // ignore: cast_nullable_to_non_nullable
                    as List<Events>,
        header:
            freezed == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                    as HeaderEvents?,
      ),
    );
  }
}

/// @nodoc

class _$OtherEventsStateImpl extends _OtherEventsState {
  const _$OtherEventsStateImpl({
    this.loading = false,
    final List<Events> events = const <Events>[],
    this.header,
  }) : _events = events,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<Events> _events;
  @override
  @JsonKey()
  List<Events> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final HeaderEvents? header;

  @override
  String toString() {
    return 'OtherEventsState(loading: $loading, events: $events, header: $header)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherEventsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.header, header) || other.header == header));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_events),
    header,
  );

  /// Create a copy of OtherEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherEventsStateImplCopyWith<_$OtherEventsStateImpl> get copyWith =>
      __$$OtherEventsStateImplCopyWithImpl<_$OtherEventsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OtherEventsState extends OtherEventsState {
  const factory _OtherEventsState({
    final bool loading,
    final List<Events> events,
    final HeaderEvents? header,
  }) = _$OtherEventsStateImpl;
  const _OtherEventsState._() : super._();

  @override
  bool get loading;
  @override
  List<Events> get events;
  @override
  HeaderEvents? get header;

  /// Create a copy of OtherEventsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherEventsStateImplCopyWith<_$OtherEventsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
