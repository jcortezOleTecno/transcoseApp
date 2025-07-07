// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_vemare_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EventsVemareState {
  bool get loading => throw _privateConstructorUsedError;
  List<EventsHeld> get eventsVemare => throw _privateConstructorUsedError;
  List<String> get yearsList => throw _privateConstructorUsedError;
  HeaderEvents? get header => throw _privateConstructorUsedError;
  String? get yearSelected => throw _privateConstructorUsedError;

  /// Create a copy of EventsVemareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsVemareStateCopyWith<EventsVemareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsVemareStateCopyWith<$Res> {
  factory $EventsVemareStateCopyWith(
    EventsVemareState value,
    $Res Function(EventsVemareState) then,
  ) = _$EventsVemareStateCopyWithImpl<$Res, EventsVemareState>;
  @useResult
  $Res call({
    bool loading,
    List<EventsHeld> eventsVemare,
    List<String> yearsList,
    HeaderEvents? header,
    String? yearSelected,
  });
}

/// @nodoc
class _$EventsVemareStateCopyWithImpl<$Res, $Val extends EventsVemareState>
    implements $EventsVemareStateCopyWith<$Res> {
  _$EventsVemareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsVemareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? eventsVemare = null,
    Object? yearsList = null,
    Object? header = freezed,
    Object? yearSelected = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            eventsVemare:
                null == eventsVemare
                    ? _value.eventsVemare
                    : eventsVemare // ignore: cast_nullable_to_non_nullable
                        as List<EventsHeld>,
            yearsList:
                null == yearsList
                    ? _value.yearsList
                    : yearsList // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            header:
                freezed == header
                    ? _value.header
                    : header // ignore: cast_nullable_to_non_nullable
                        as HeaderEvents?,
            yearSelected:
                freezed == yearSelected
                    ? _value.yearSelected
                    : yearSelected // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventsVemareStateImplCopyWith<$Res>
    implements $EventsVemareStateCopyWith<$Res> {
  factory _$$EventsVemareStateImplCopyWith(
    _$EventsVemareStateImpl value,
    $Res Function(_$EventsVemareStateImpl) then,
  ) = __$$EventsVemareStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    List<EventsHeld> eventsVemare,
    List<String> yearsList,
    HeaderEvents? header,
    String? yearSelected,
  });
}

/// @nodoc
class __$$EventsVemareStateImplCopyWithImpl<$Res>
    extends _$EventsVemareStateCopyWithImpl<$Res, _$EventsVemareStateImpl>
    implements _$$EventsVemareStateImplCopyWith<$Res> {
  __$$EventsVemareStateImplCopyWithImpl(
    _$EventsVemareStateImpl _value,
    $Res Function(_$EventsVemareStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventsVemareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? eventsVemare = null,
    Object? yearsList = null,
    Object? header = freezed,
    Object? yearSelected = freezed,
  }) {
    return _then(
      _$EventsVemareStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        eventsVemare:
            null == eventsVemare
                ? _value._eventsVemare
                : eventsVemare // ignore: cast_nullable_to_non_nullable
                    as List<EventsHeld>,
        yearsList:
            null == yearsList
                ? _value._yearsList
                : yearsList // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        header:
            freezed == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                    as HeaderEvents?,
        yearSelected:
            freezed == yearSelected
                ? _value.yearSelected
                : yearSelected // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$EventsVemareStateImpl extends _EventsVemareState {
  const _$EventsVemareStateImpl({
    this.loading = false,
    final List<EventsHeld> eventsVemare = const <EventsHeld>[],
    final List<String> yearsList = const <String>[],
    this.header,
    this.yearSelected,
  }) : _eventsVemare = eventsVemare,
       _yearsList = yearsList,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<EventsHeld> _eventsVemare;
  @override
  @JsonKey()
  List<EventsHeld> get eventsVemare {
    if (_eventsVemare is EqualUnmodifiableListView) return _eventsVemare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventsVemare);
  }

  final List<String> _yearsList;
  @override
  @JsonKey()
  List<String> get yearsList {
    if (_yearsList is EqualUnmodifiableListView) return _yearsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearsList);
  }

  @override
  final HeaderEvents? header;
  @override
  final String? yearSelected;

  @override
  String toString() {
    return 'EventsVemareState(loading: $loading, eventsVemare: $eventsVemare, yearsList: $yearsList, header: $header, yearSelected: $yearSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsVemareStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
              other._eventsVemare,
              _eventsVemare,
            ) &&
            const DeepCollectionEquality().equals(
              other._yearsList,
              _yearsList,
            ) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.yearSelected, yearSelected) ||
                other.yearSelected == yearSelected));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_eventsVemare),
    const DeepCollectionEquality().hash(_yearsList),
    header,
    yearSelected,
  );

  /// Create a copy of EventsVemareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsVemareStateImplCopyWith<_$EventsVemareStateImpl> get copyWith =>
      __$$EventsVemareStateImplCopyWithImpl<_$EventsVemareStateImpl>(
        this,
        _$identity,
      );
}

abstract class _EventsVemareState extends EventsVemareState {
  const factory _EventsVemareState({
    final bool loading,
    final List<EventsHeld> eventsVemare,
    final List<String> yearsList,
    final HeaderEvents? header,
    final String? yearSelected,
  }) = _$EventsVemareStateImpl;
  const _EventsVemareState._() : super._();

  @override
  bool get loading;
  @override
  List<EventsHeld> get eventsVemare;
  @override
  List<String> get yearsList;
  @override
  HeaderEvents? get header;
  @override
  String? get yearSelected;

  /// Create a copy of EventsVemareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsVemareStateImplCopyWith<_$EventsVemareStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
