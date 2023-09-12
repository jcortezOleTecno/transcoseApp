// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enroll_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EnrollEventState {
  bool get loading => throw _privateConstructorUsedError;
  bool get showCalendar => throw _privateConstructorUsedError;
  int get peopleCounter => throw _privateConstructorUsedError;
  List<Horario> get horarios => throw _privateConstructorUsedError;
  Locations? get locations => throw _privateConstructorUsedError;
  Events? get event => throw _privateConstructorUsedError;
  Horario? get horarioSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnrollEventStateCopyWith<EnrollEventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollEventStateCopyWith<$Res> {
  factory $EnrollEventStateCopyWith(
          EnrollEventState value, $Res Function(EnrollEventState) then) =
      _$EnrollEventStateCopyWithImpl<$Res, EnrollEventState>;
  @useResult
  $Res call(
      {bool loading,
      bool showCalendar,
      int peopleCounter,
      List<Horario> horarios,
      Locations? locations,
      Events? event,
      Horario? horarioSelected});
}

/// @nodoc
class _$EnrollEventStateCopyWithImpl<$Res, $Val extends EnrollEventState>
    implements $EnrollEventStateCopyWith<$Res> {
  _$EnrollEventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? showCalendar = null,
    Object? peopleCounter = null,
    Object? horarios = null,
    Object? locations = freezed,
    Object? event = freezed,
    Object? horarioSelected = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showCalendar: null == showCalendar
          ? _value.showCalendar
          : showCalendar // ignore: cast_nullable_to_non_nullable
              as bool,
      peopleCounter: null == peopleCounter
          ? _value.peopleCounter
          : peopleCounter // ignore: cast_nullable_to_non_nullable
              as int,
      horarios: null == horarios
          ? _value.horarios
          : horarios // ignore: cast_nullable_to_non_nullable
              as List<Horario>,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as Locations?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Events?,
      horarioSelected: freezed == horarioSelected
          ? _value.horarioSelected
          : horarioSelected // ignore: cast_nullable_to_non_nullable
              as Horario?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnrollTrainingStateCopyWith<$Res>
    implements $EnrollEventStateCopyWith<$Res> {
  factory _$$_EnrollTrainingStateCopyWith(_$_EnrollTrainingState value,
          $Res Function(_$_EnrollTrainingState) then) =
      __$$_EnrollTrainingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool showCalendar,
      int peopleCounter,
      List<Horario> horarios,
      Locations? locations,
      Events? event,
      Horario? horarioSelected});
}

/// @nodoc
class __$$_EnrollTrainingStateCopyWithImpl<$Res>
    extends _$EnrollEventStateCopyWithImpl<$Res, _$_EnrollTrainingState>
    implements _$$_EnrollTrainingStateCopyWith<$Res> {
  __$$_EnrollTrainingStateCopyWithImpl(_$_EnrollTrainingState _value,
      $Res Function(_$_EnrollTrainingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? showCalendar = null,
    Object? peopleCounter = null,
    Object? horarios = null,
    Object? locations = freezed,
    Object? event = freezed,
    Object? horarioSelected = freezed,
  }) {
    return _then(_$_EnrollTrainingState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showCalendar: null == showCalendar
          ? _value.showCalendar
          : showCalendar // ignore: cast_nullable_to_non_nullable
              as bool,
      peopleCounter: null == peopleCounter
          ? _value.peopleCounter
          : peopleCounter // ignore: cast_nullable_to_non_nullable
              as int,
      horarios: null == horarios
          ? _value._horarios
          : horarios // ignore: cast_nullable_to_non_nullable
              as List<Horario>,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as Locations?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Events?,
      horarioSelected: freezed == horarioSelected
          ? _value.horarioSelected
          : horarioSelected // ignore: cast_nullable_to_non_nullable
              as Horario?,
    ));
  }
}

/// @nodoc

class _$_EnrollTrainingState extends _EnrollTrainingState {
  const _$_EnrollTrainingState(
      {this.loading = false,
      this.showCalendar = false,
      this.peopleCounter = 0,
      final List<Horario> horarios = const <Horario>[],
      this.locations,
      this.event,
      this.horarioSelected})
      : _horarios = horarios,
        super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool showCalendar;
  @override
  @JsonKey()
  final int peopleCounter;
  final List<Horario> _horarios;
  @override
  @JsonKey()
  List<Horario> get horarios {
    if (_horarios is EqualUnmodifiableListView) return _horarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_horarios);
  }

  @override
  final Locations? locations;
  @override
  final Events? event;
  @override
  final Horario? horarioSelected;

  @override
  String toString() {
    return 'EnrollEventState(loading: $loading, showCalendar: $showCalendar, peopleCounter: $peopleCounter, horarios: $horarios, locations: $locations, event: $event, horarioSelected: $horarioSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnrollTrainingState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.showCalendar, showCalendar) ||
                other.showCalendar == showCalendar) &&
            (identical(other.peopleCounter, peopleCounter) ||
                other.peopleCounter == peopleCounter) &&
            const DeepCollectionEquality().equals(other._horarios, _horarios) &&
            (identical(other.locations, locations) ||
                other.locations == locations) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.horarioSelected, horarioSelected) ||
                other.horarioSelected == horarioSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      showCalendar,
      peopleCounter,
      const DeepCollectionEquality().hash(_horarios),
      locations,
      event,
      horarioSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnrollTrainingStateCopyWith<_$_EnrollTrainingState> get copyWith =>
      __$$_EnrollTrainingStateCopyWithImpl<_$_EnrollTrainingState>(
          this, _$identity);
}

abstract class _EnrollTrainingState extends EnrollEventState {
  const factory _EnrollTrainingState(
      {final bool loading,
      final bool showCalendar,
      final int peopleCounter,
      final List<Horario> horarios,
      final Locations? locations,
      final Events? event,
      final Horario? horarioSelected}) = _$_EnrollTrainingState;
  const _EnrollTrainingState._() : super._();

  @override
  bool get loading;
  @override
  bool get showCalendar;
  @override
  int get peopleCounter;
  @override
  List<Horario> get horarios;
  @override
  Locations? get locations;
  @override
  Events? get event;
  @override
  Horario? get horarioSelected;
  @override
  @JsonKey(ignore: true)
  _$$_EnrollTrainingStateCopyWith<_$_EnrollTrainingState> get copyWith =>
      throw _privateConstructorUsedError;
}
