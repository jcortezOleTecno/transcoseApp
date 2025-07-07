// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_destinations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AvailableDestinationsState {
  Events? get event => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  List<Locations> get locationReferences => throw _privateConstructorUsedError;
  List<Locations> get location => throw _privateConstructorUsedError;

  /// Create a copy of AvailableDestinationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableDestinationsStateCopyWith<AvailableDestinationsState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableDestinationsStateCopyWith<$Res> {
  factory $AvailableDestinationsStateCopyWith(
    AvailableDestinationsState value,
    $Res Function(AvailableDestinationsState) then,
  ) =
      _$AvailableDestinationsStateCopyWithImpl<
        $Res,
        AvailableDestinationsState
      >;
  @useResult
  $Res call({
    Events? event,
    bool loading,
    List<Locations> locationReferences,
    List<Locations> location,
  });
}

/// @nodoc
class _$AvailableDestinationsStateCopyWithImpl<
  $Res,
  $Val extends AvailableDestinationsState
>
    implements $AvailableDestinationsStateCopyWith<$Res> {
  _$AvailableDestinationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableDestinationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
    Object? loading = null,
    Object? locationReferences = null,
    Object? location = null,
  }) {
    return _then(
      _value.copyWith(
            event:
                freezed == event
                    ? _value.event
                    : event // ignore: cast_nullable_to_non_nullable
                        as Events?,
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            locationReferences:
                null == locationReferences
                    ? _value.locationReferences
                    : locationReferences // ignore: cast_nullable_to_non_nullable
                        as List<Locations>,
            location:
                null == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as List<Locations>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailableDestinationsStateImplCopyWith<$Res>
    implements $AvailableDestinationsStateCopyWith<$Res> {
  factory _$$AvailableDestinationsStateImplCopyWith(
    _$AvailableDestinationsStateImpl value,
    $Res Function(_$AvailableDestinationsStateImpl) then,
  ) = __$$AvailableDestinationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Events? event,
    bool loading,
    List<Locations> locationReferences,
    List<Locations> location,
  });
}

/// @nodoc
class __$$AvailableDestinationsStateImplCopyWithImpl<$Res>
    extends
        _$AvailableDestinationsStateCopyWithImpl<
          $Res,
          _$AvailableDestinationsStateImpl
        >
    implements _$$AvailableDestinationsStateImplCopyWith<$Res> {
  __$$AvailableDestinationsStateImplCopyWithImpl(
    _$AvailableDestinationsStateImpl _value,
    $Res Function(_$AvailableDestinationsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailableDestinationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
    Object? loading = null,
    Object? locationReferences = null,
    Object? location = null,
  }) {
    return _then(
      _$AvailableDestinationsStateImpl(
        event:
            freezed == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as Events?,
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        locationReferences:
            null == locationReferences
                ? _value._locationReferences
                : locationReferences // ignore: cast_nullable_to_non_nullable
                    as List<Locations>,
        location:
            null == location
                ? _value._location
                : location // ignore: cast_nullable_to_non_nullable
                    as List<Locations>,
      ),
    );
  }
}

/// @nodoc

class _$AvailableDestinationsStateImpl extends _AvailableDestinationsState {
  const _$AvailableDestinationsStateImpl({
    this.event,
    this.loading = false,
    final List<Locations> locationReferences = const <Locations>[],
    final List<Locations> location = const <Locations>[],
  }) : _locationReferences = locationReferences,
       _location = location,
       super._();

  @override
  final Events? event;
  @override
  @JsonKey()
  final bool loading;
  final List<Locations> _locationReferences;
  @override
  @JsonKey()
  List<Locations> get locationReferences {
    if (_locationReferences is EqualUnmodifiableListView)
      return _locationReferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationReferences);
  }

  final List<Locations> _location;
  @override
  @JsonKey()
  List<Locations> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  @override
  String toString() {
    return 'AvailableDestinationsState(event: $event, loading: $loading, locationReferences: $locationReferences, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableDestinationsStateImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
              other._locationReferences,
              _locationReferences,
            ) &&
            const DeepCollectionEquality().equals(other._location, _location));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    event,
    loading,
    const DeepCollectionEquality().hash(_locationReferences),
    const DeepCollectionEquality().hash(_location),
  );

  /// Create a copy of AvailableDestinationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableDestinationsStateImplCopyWith<_$AvailableDestinationsStateImpl>
  get copyWith => __$$AvailableDestinationsStateImplCopyWithImpl<
    _$AvailableDestinationsStateImpl
  >(this, _$identity);
}

abstract class _AvailableDestinationsState extends AvailableDestinationsState {
  const factory _AvailableDestinationsState({
    final Events? event,
    final bool loading,
    final List<Locations> locationReferences,
    final List<Locations> location,
  }) = _$AvailableDestinationsStateImpl;
  const _AvailableDestinationsState._() : super._();

  @override
  Events? get event;
  @override
  bool get loading;
  @override
  List<Locations> get locationReferences;
  @override
  List<Locations> get location;

  /// Create a copy of AvailableDestinationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableDestinationsStateImplCopyWith<_$AvailableDestinationsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
