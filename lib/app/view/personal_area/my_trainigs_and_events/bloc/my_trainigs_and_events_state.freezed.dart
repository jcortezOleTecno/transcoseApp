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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyTrainigsAndEventsState {
  bool get loading => throw _privateConstructorUsedError;
  List<TrainingsEvents> get data => throw _privateConstructorUsedError;

  /// Create a copy of MyTrainigsAndEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyTrainigsAndEventsStateCopyWith<MyTrainigsAndEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTrainigsAndEventsStateCopyWith<$Res> {
  factory $MyTrainigsAndEventsStateCopyWith(
    MyTrainigsAndEventsState value,
    $Res Function(MyTrainigsAndEventsState) then,
  ) = _$MyTrainigsAndEventsStateCopyWithImpl<$Res, MyTrainigsAndEventsState>;
  @useResult
  $Res call({bool loading, List<TrainingsEvents> data});
}

/// @nodoc
class _$MyTrainigsAndEventsStateCopyWithImpl<
  $Res,
  $Val extends MyTrainigsAndEventsState
>
    implements $MyTrainigsAndEventsStateCopyWith<$Res> {
  _$MyTrainigsAndEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTrainigsAndEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loading = null, Object? data = null}) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as List<TrainingsEvents>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyTrainigsAndEventsStateImplCopyWith<$Res>
    implements $MyTrainigsAndEventsStateCopyWith<$Res> {
  factory _$$MyTrainigsAndEventsStateImplCopyWith(
    _$MyTrainigsAndEventsStateImpl value,
    $Res Function(_$MyTrainigsAndEventsStateImpl) then,
  ) = __$$MyTrainigsAndEventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<TrainingsEvents> data});
}

/// @nodoc
class __$$MyTrainigsAndEventsStateImplCopyWithImpl<$Res>
    extends
        _$MyTrainigsAndEventsStateCopyWithImpl<
          $Res,
          _$MyTrainigsAndEventsStateImpl
        >
    implements _$$MyTrainigsAndEventsStateImplCopyWith<$Res> {
  __$$MyTrainigsAndEventsStateImplCopyWithImpl(
    _$MyTrainigsAndEventsStateImpl _value,
    $Res Function(_$MyTrainigsAndEventsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyTrainigsAndEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loading = null, Object? data = null}) {
    return _then(
      _$MyTrainigsAndEventsStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            null == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<TrainingsEvents>,
      ),
    );
  }
}

/// @nodoc

class _$MyTrainigsAndEventsStateImpl implements _MyTrainigsAndEventsState {
  const _$MyTrainigsAndEventsStateImpl({
    this.loading = false,
    final List<TrainingsEvents> data = const <TrainingsEvents>[],
  }) : _data = data;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTrainigsAndEventsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of MyTrainigsAndEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTrainigsAndEventsStateImplCopyWith<_$MyTrainigsAndEventsStateImpl>
  get copyWith => __$$MyTrainigsAndEventsStateImplCopyWithImpl<
    _$MyTrainigsAndEventsStateImpl
  >(this, _$identity);
}

abstract class _MyTrainigsAndEventsState implements MyTrainigsAndEventsState {
  const factory _MyTrainigsAndEventsState({
    final bool loading,
    final List<TrainingsEvents> data,
  }) = _$MyTrainigsAndEventsStateImpl;

  @override
  bool get loading;
  @override
  List<TrainingsEvents> get data;

  /// Create a copy of MyTrainigsAndEventsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTrainigsAndEventsStateImplCopyWith<_$MyTrainigsAndEventsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
