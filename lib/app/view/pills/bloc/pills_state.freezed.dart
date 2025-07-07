// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pills_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PillsState {
  List<Pills> get mostRead => throw _privateConstructorUsedError;
  List<Pills> get pills => throw _privateConstructorUsedError;

  /// Create a copy of PillsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PillsStateCopyWith<PillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PillsStateCopyWith<$Res> {
  factory $PillsStateCopyWith(
    PillsState value,
    $Res Function(PillsState) then,
  ) = _$PillsStateCopyWithImpl<$Res, PillsState>;
  @useResult
  $Res call({List<Pills> mostRead, List<Pills> pills});
}

/// @nodoc
class _$PillsStateCopyWithImpl<$Res, $Val extends PillsState>
    implements $PillsStateCopyWith<$Res> {
  _$PillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PillsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mostRead = null, Object? pills = null}) {
    return _then(
      _value.copyWith(
            mostRead:
                null == mostRead
                    ? _value.mostRead
                    : mostRead // ignore: cast_nullable_to_non_nullable
                        as List<Pills>,
            pills:
                null == pills
                    ? _value.pills
                    : pills // ignore: cast_nullable_to_non_nullable
                        as List<Pills>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PillsStateImplCopyWith<$Res>
    implements $PillsStateCopyWith<$Res> {
  factory _$$PillsStateImplCopyWith(
    _$PillsStateImpl value,
    $Res Function(_$PillsStateImpl) then,
  ) = __$$PillsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pills> mostRead, List<Pills> pills});
}

/// @nodoc
class __$$PillsStateImplCopyWithImpl<$Res>
    extends _$PillsStateCopyWithImpl<$Res, _$PillsStateImpl>
    implements _$$PillsStateImplCopyWith<$Res> {
  __$$PillsStateImplCopyWithImpl(
    _$PillsStateImpl _value,
    $Res Function(_$PillsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PillsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mostRead = null, Object? pills = null}) {
    return _then(
      _$PillsStateImpl(
        mostRead:
            null == mostRead
                ? _value._mostRead
                : mostRead // ignore: cast_nullable_to_non_nullable
                    as List<Pills>,
        pills:
            null == pills
                ? _value._pills
                : pills // ignore: cast_nullable_to_non_nullable
                    as List<Pills>,
      ),
    );
  }
}

/// @nodoc

class _$PillsStateImpl extends _PillsState {
  const _$PillsStateImpl({
    final List<Pills> mostRead = const <Pills>[],
    final List<Pills> pills = const <Pills>[],
  }) : _mostRead = mostRead,
       _pills = pills,
       super._();

  final List<Pills> _mostRead;
  @override
  @JsonKey()
  List<Pills> get mostRead {
    if (_mostRead is EqualUnmodifiableListView) return _mostRead;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mostRead);
  }

  final List<Pills> _pills;
  @override
  @JsonKey()
  List<Pills> get pills {
    if (_pills is EqualUnmodifiableListView) return _pills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pills);
  }

  @override
  String toString() {
    return 'PillsState(mostRead: $mostRead, pills: $pills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PillsStateImpl &&
            const DeepCollectionEquality().equals(other._mostRead, _mostRead) &&
            const DeepCollectionEquality().equals(other._pills, _pills));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_mostRead),
    const DeepCollectionEquality().hash(_pills),
  );

  /// Create a copy of PillsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PillsStateImplCopyWith<_$PillsStateImpl> get copyWith =>
      __$$PillsStateImplCopyWithImpl<_$PillsStateImpl>(this, _$identity);
}

abstract class _PillsState extends PillsState {
  const factory _PillsState({
    final List<Pills> mostRead,
    final List<Pills> pills,
  }) = _$PillsStateImpl;
  const _PillsState._() : super._();

  @override
  List<Pills> get mostRead;
  @override
  List<Pills> get pills;

  /// Create a copy of PillsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PillsStateImplCopyWith<_$PillsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
