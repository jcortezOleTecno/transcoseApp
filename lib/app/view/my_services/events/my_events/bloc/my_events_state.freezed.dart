// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_events_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyEventsState {
  bool get loading => throw _privateConstructorUsedError;
  List<MyEvents> get eventsVemare => throw _privateConstructorUsedError;

  /// Create a copy of MyEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyEventsStateCopyWith<MyEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyEventsStateCopyWith<$Res> {
  factory $MyEventsStateCopyWith(
    MyEventsState value,
    $Res Function(MyEventsState) then,
  ) = _$MyEventsStateCopyWithImpl<$Res, MyEventsState>;
  @useResult
  $Res call({bool loading, List<MyEvents> eventsVemare});
}

/// @nodoc
class _$MyEventsStateCopyWithImpl<$Res, $Val extends MyEventsState>
    implements $MyEventsStateCopyWith<$Res> {
  _$MyEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loading = null, Object? eventsVemare = null}) {
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
                        as List<MyEvents>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyEventsStateImplCopyWith<$Res>
    implements $MyEventsStateCopyWith<$Res> {
  factory _$$MyEventsStateImplCopyWith(
    _$MyEventsStateImpl value,
    $Res Function(_$MyEventsStateImpl) then,
  ) = __$$MyEventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<MyEvents> eventsVemare});
}

/// @nodoc
class __$$MyEventsStateImplCopyWithImpl<$Res>
    extends _$MyEventsStateCopyWithImpl<$Res, _$MyEventsStateImpl>
    implements _$$MyEventsStateImplCopyWith<$Res> {
  __$$MyEventsStateImplCopyWithImpl(
    _$MyEventsStateImpl _value,
    $Res Function(_$MyEventsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loading = null, Object? eventsVemare = null}) {
    return _then(
      _$MyEventsStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        eventsVemare:
            null == eventsVemare
                ? _value._eventsVemare
                : eventsVemare // ignore: cast_nullable_to_non_nullable
                    as List<MyEvents>,
      ),
    );
  }
}

/// @nodoc

class _$MyEventsStateImpl extends _MyEventsState {
  const _$MyEventsStateImpl({
    this.loading = false,
    final List<MyEvents> eventsVemare = const <MyEvents>[],
  }) : _eventsVemare = eventsVemare,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<MyEvents> _eventsVemare;
  @override
  @JsonKey()
  List<MyEvents> get eventsVemare {
    if (_eventsVemare is EqualUnmodifiableListView) return _eventsVemare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventsVemare);
  }

  @override
  String toString() {
    return 'MyEventsState(loading: $loading, eventsVemare: $eventsVemare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyEventsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
              other._eventsVemare,
              _eventsVemare,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_eventsVemare),
  );

  /// Create a copy of MyEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyEventsStateImplCopyWith<_$MyEventsStateImpl> get copyWith =>
      __$$MyEventsStateImplCopyWithImpl<_$MyEventsStateImpl>(this, _$identity);
}

abstract class _MyEventsState extends MyEventsState {
  const factory _MyEventsState({
    final bool loading,
    final List<MyEvents> eventsVemare,
  }) = _$MyEventsStateImpl;
  const _MyEventsState._() : super._();

  @override
  bool get loading;
  @override
  List<MyEvents> get eventsVemare;

  /// Create a copy of MyEventsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyEventsStateImplCopyWith<_$MyEventsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
