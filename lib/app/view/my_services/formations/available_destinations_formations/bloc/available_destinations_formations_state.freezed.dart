// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_destinations_formations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AvailableDestinationsFormationsState {
  bool get loading => throw _privateConstructorUsedError;
  List<Locations> get location => throw _privateConstructorUsedError;
  List<Locations> get locationReferences => throw _privateConstructorUsedError;
  Formation? get formation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailableDestinationsFormationsStateCopyWith<
          AvailableDestinationsFormationsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableDestinationsFormationsStateCopyWith<$Res> {
  factory $AvailableDestinationsFormationsStateCopyWith(
          AvailableDestinationsFormationsState value,
          $Res Function(AvailableDestinationsFormationsState) then) =
      _$AvailableDestinationsFormationsStateCopyWithImpl<$Res,
          AvailableDestinationsFormationsState>;
  @useResult
  $Res call(
      {bool loading,
      List<Locations> location,
      List<Locations> locationReferences,
      Formation? formation});
}

/// @nodoc
class _$AvailableDestinationsFormationsStateCopyWithImpl<$Res,
        $Val extends AvailableDestinationsFormationsState>
    implements $AvailableDestinationsFormationsStateCopyWith<$Res> {
  _$AvailableDestinationsFormationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? location = null,
    Object? locationReferences = null,
    Object? formation = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
      locationReferences: null == locationReferences
          ? _value.locationReferences
          : locationReferences // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
      formation: freezed == formation
          ? _value.formation
          : formation // ignore: cast_nullable_to_non_nullable
              as Formation?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailableDestinationsFormationsStateCopyWith<$Res>
    implements $AvailableDestinationsFormationsStateCopyWith<$Res> {
  factory _$$_AvailableDestinationsFormationsStateCopyWith(
          _$_AvailableDestinationsFormationsState value,
          $Res Function(_$_AvailableDestinationsFormationsState) then) =
      __$$_AvailableDestinationsFormationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<Locations> location,
      List<Locations> locationReferences,
      Formation? formation});
}

/// @nodoc
class __$$_AvailableDestinationsFormationsStateCopyWithImpl<$Res>
    extends _$AvailableDestinationsFormationsStateCopyWithImpl<$Res,
        _$_AvailableDestinationsFormationsState>
    implements _$$_AvailableDestinationsFormationsStateCopyWith<$Res> {
  __$$_AvailableDestinationsFormationsStateCopyWithImpl(
      _$_AvailableDestinationsFormationsState _value,
      $Res Function(_$_AvailableDestinationsFormationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? location = null,
    Object? locationReferences = null,
    Object? formation = freezed,
  }) {
    return _then(_$_AvailableDestinationsFormationsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
      locationReferences: null == locationReferences
          ? _value._locationReferences
          : locationReferences // ignore: cast_nullable_to_non_nullable
              as List<Locations>,
      formation: freezed == formation
          ? _value.formation
          : formation // ignore: cast_nullable_to_non_nullable
              as Formation?,
    ));
  }
}

/// @nodoc

class _$_AvailableDestinationsFormationsState
    extends _AvailableDestinationsFormationsState {
  const _$_AvailableDestinationsFormationsState(
      {this.loading = false,
      final List<Locations> location = const <Locations>[],
      final List<Locations> locationReferences = const <Locations>[],
      this.formation})
      : _location = location,
        _locationReferences = locationReferences,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<Locations> _location;
  @override
  @JsonKey()
  List<Locations> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  final List<Locations> _locationReferences;
  @override
  @JsonKey()
  List<Locations> get locationReferences {
    if (_locationReferences is EqualUnmodifiableListView)
      return _locationReferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationReferences);
  }

  @override
  final Formation? formation;

  @override
  String toString() {
    return 'AvailableDestinationsFormationsState(loading: $loading, location: $location, locationReferences: $locationReferences, formation: $formation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailableDestinationsFormationsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            const DeepCollectionEquality()
                .equals(other._locationReferences, _locationReferences) &&
            (identical(other.formation, formation) ||
                other.formation == formation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_location),
      const DeepCollectionEquality().hash(_locationReferences),
      formation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableDestinationsFormationsStateCopyWith<
          _$_AvailableDestinationsFormationsState>
      get copyWith => __$$_AvailableDestinationsFormationsStateCopyWithImpl<
          _$_AvailableDestinationsFormationsState>(this, _$identity);
}

abstract class _AvailableDestinationsFormationsState
    extends AvailableDestinationsFormationsState {
  const factory _AvailableDestinationsFormationsState(
      {final bool loading,
      final List<Locations> location,
      final List<Locations> locationReferences,
      final Formation? formation}) = _$_AvailableDestinationsFormationsState;
  const _AvailableDestinationsFormationsState._() : super._();

  @override
  bool get loading;
  @override
  List<Locations> get location;
  @override
  List<Locations> get locationReferences;
  @override
  Formation? get formation;
  @override
  @JsonKey(ignore: true)
  _$$_AvailableDestinationsFormationsStateCopyWith<
          _$_AvailableDestinationsFormationsState>
      get copyWith => throw _privateConstructorUsedError;
}
