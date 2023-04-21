// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_trainigs_and_events_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyTrainigsAndEventsState {
  bool get loading => throw _privateConstructorUsedError;
  List<TrainingsEvents> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyTrainigsAndEventsStateCopyWith<MyTrainigsAndEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTrainigsAndEventsStateCopyWith<$Res> {
  factory $MyTrainigsAndEventsStateCopyWith(MyTrainigsAndEventsState value,
          $Res Function(MyTrainigsAndEventsState) then) =
      _$MyTrainigsAndEventsStateCopyWithImpl<$Res, MyTrainigsAndEventsState>;
  @useResult
  $Res call({bool loading, List<TrainingsEvents> data});
}

/// @nodoc
class _$MyTrainigsAndEventsStateCopyWithImpl<$Res,
        $Val extends MyTrainigsAndEventsState>
    implements $MyTrainigsAndEventsStateCopyWith<$Res> {
  _$MyTrainigsAndEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrainingsEvents>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyTrainigsAndEventsStateCopyWith<$Res>
    implements $MyTrainigsAndEventsStateCopyWith<$Res> {
  factory _$$_MyTrainigsAndEventsStateCopyWith(
          _$_MyTrainigsAndEventsState value,
          $Res Function(_$_MyTrainigsAndEventsState) then) =
      __$$_MyTrainigsAndEventsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<TrainingsEvents> data});
}

/// @nodoc
class __$$_MyTrainigsAndEventsStateCopyWithImpl<$Res>
    extends _$MyTrainigsAndEventsStateCopyWithImpl<$Res,
        _$_MyTrainigsAndEventsState>
    implements _$$_MyTrainigsAndEventsStateCopyWith<$Res> {
  __$$_MyTrainigsAndEventsStateCopyWithImpl(_$_MyTrainigsAndEventsState _value,
      $Res Function(_$_MyTrainigsAndEventsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? data = null,
  }) {
    return _then(_$_MyTrainigsAndEventsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrainingsEvents>,
    ));
  }
}

/// @nodoc

class _$_MyTrainigsAndEventsState implements _MyTrainigsAndEventsState {
  const _$_MyTrainigsAndEventsState(
      {this.loading = false,
      final List<TrainingsEvents> data = const <TrainingsEvents>[]})
      : _data = data;

  @override
  @JsonKey()
  final bool loading;
  final List<TrainingsEvents> _data;
  @override
  @JsonKey()
  List<TrainingsEvents> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MyTrainigsAndEventsState(loading: $loading, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyTrainigsAndEventsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyTrainigsAndEventsStateCopyWith<_$_MyTrainigsAndEventsState>
      get copyWith => __$$_MyTrainigsAndEventsStateCopyWithImpl<
          _$_MyTrainigsAndEventsState>(this, _$identity);
}

abstract class _MyTrainigsAndEventsState implements MyTrainigsAndEventsState {
  const factory _MyTrainigsAndEventsState(
      {final bool loading,
      final List<TrainingsEvents> data}) = _$_MyTrainigsAndEventsState;

  @override
  bool get loading;
  @override
  List<TrainingsEvents> get data;
  @override
  @JsonKey(ignore: true)
  _$$_MyTrainigsAndEventsStateCopyWith<_$_MyTrainigsAndEventsState>
      get copyWith => throw _privateConstructorUsedError;
}
