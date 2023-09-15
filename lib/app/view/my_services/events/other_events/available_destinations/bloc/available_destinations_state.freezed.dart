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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AvailableDestinationsState {
  Events? get event => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  List<Locations> get locationReferences => throw _privateConstructorUsedError;
  List<Locations> get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailableDestinationsStateCopyWith<AvailableDestinationsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableDestinationsStateCopyWith<$Res> {
  factory $AvailableDestinationsStateCopyWith(AvailableDestinationsState value,
          $Res Function(AvailableDestinationsState) then) =
      _$AvailableDestinationsStateCopyWithImpl<$Res,
          AvailableDestinationsState>;
  @useResult
  $Res call(
      {Events? event,
      bool loading,
      List<Locations> locationReferences,
      List<Locations> location});
}

/// @nodoc
class _$AvailableDestinationsStateCopyWithImpl<$Res,
        $Val extends AvailableDestinationsState>
    implements $AvailableDestinationsStateCopyWith<$Res> {
  _$AvailableDestinationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
    Object? loading = null,
    Object? locationReferences = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Events?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      locationReferences: null == locationReferences
          ? _value.locationReferences
          : locationReferences // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailableDestinationsStateCopyWith<$Res>
    implements $AvailableDestinationsStateCopyWith<$Res> {
  factory _$$_AvailableDestinationsStateCopyWith(
          _$_AvailableDestinationsState value,
          $Res Function(_$_AvailableDestinationsState) then) =
      __$$_AvailableDestinationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Events? event,
      bool loading,
      List<Locations> locationReferences,
      List<Locations> location});
}

/// @nodoc
class __$$_AvailableDestinationsStateCopyWithImpl<$Res>
    extends _$AvailableDestinationsStateCopyWithImpl<$Res,
        _$_AvailableDestinationsState>
    implements _$$_AvailableDestinationsStateCopyWith<$Res> {
  __$$_AvailableDestinationsStateCopyWithImpl(
      _$_AvailableDestinationsState _value,
      $Res Function(_$_AvailableDestinationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
    Object? loading = null,
    Object? locationReferences = null,
    Object? location = null,
  }) {
    return _then(_$_AvailableDestinationsState(
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Events?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      locationReferences: null == locationReferences
          ? _value._locationReferences
          : locationReferences // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
    ));
  }
}

/// @nodoc

class _$_AvailableDestinationsState extends _AvailableDestinationsState {
  const _$_AvailableDestinationsState(
      {this.event,
      this.loading = false,
      final List<Locations> locationReferences = const <Locations>[],
      final List<Locations> location = const <Locations>[]})
      : _locationReferences = locationReferences,
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailableDestinationsState &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._locationReferences, _locationReferences) &&
            const DeepCollectionEquality().equals(other._location, _location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      event,
      loading,
      const DeepCollectionEquality().hash(_locationReferences),
      const DeepCollectionEquality().hash(_location));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableDestinationsStateCopyWith<_$_AvailableDestinationsState>
      get copyWith => __$$_AvailableDestinationsStateCopyWithImpl<
          _$_AvailableDestinationsState>(this, _$identity);
}

abstract class _AvailableDestinationsState extends AvailableDestinationsState {
  const factory _AvailableDestinationsState(
      {final Events? event,
      final bool loading,
      final List<Locations> locationReferences,
      final List<Locations> location}) = _$_AvailableDestinationsState;
  const _AvailableDestinationsState._() : super._();

  @override
  Events? get event;
  @override
  bool get loading;
  @override
  List<Locations> get locationReferences;
  @override
  List<Locations> get location;
  @override
  @JsonKey(ignore: true)
  _$$_AvailableDestinationsStateCopyWith<_$_AvailableDestinationsState>
      get copyWith => throw _privateConstructorUsedError;
}
