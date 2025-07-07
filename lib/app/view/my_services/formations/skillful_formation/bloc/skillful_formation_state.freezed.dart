// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skillful_formation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SkillfulFormationState {
  List<Formation> get formations => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  TrainigGroup? get trainigGroup => throw _privateConstructorUsedError;

  /// Create a copy of SkillfulFormationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillfulFormationStateCopyWith<SkillfulFormationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillfulFormationStateCopyWith<$Res> {
  factory $SkillfulFormationStateCopyWith(
    SkillfulFormationState value,
    $Res Function(SkillfulFormationState) then,
  ) = _$SkillfulFormationStateCopyWithImpl<$Res, SkillfulFormationState>;
  @useResult
  $Res call({
    List<Formation> formations,
    bool loading,
    TrainigGroup? trainigGroup,
  });
}

/// @nodoc
class _$SkillfulFormationStateCopyWithImpl<
  $Res,
  $Val extends SkillfulFormationState
>
    implements $SkillfulFormationStateCopyWith<$Res> {
  _$SkillfulFormationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillfulFormationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formations = null,
    Object? loading = null,
    Object? trainigGroup = freezed,
  }) {
    return _then(
      _value.copyWith(
            formations:
                null == formations
                    ? _value.formations
                    : formations // ignore: cast_nullable_to_non_nullable
                        as List<Formation>,
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            trainigGroup:
                freezed == trainigGroup
                    ? _value.trainigGroup
                    : trainigGroup // ignore: cast_nullable_to_non_nullable
                        as TrainigGroup?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SkillfulFormationStateImplCopyWith<$Res>
    implements $SkillfulFormationStateCopyWith<$Res> {
  factory _$$SkillfulFormationStateImplCopyWith(
    _$SkillfulFormationStateImpl value,
    $Res Function(_$SkillfulFormationStateImpl) then,
  ) = __$$SkillfulFormationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Formation> formations,
    bool loading,
    TrainigGroup? trainigGroup,
  });
}

/// @nodoc
class __$$SkillfulFormationStateImplCopyWithImpl<$Res>
    extends
        _$SkillfulFormationStateCopyWithImpl<$Res, _$SkillfulFormationStateImpl>
    implements _$$SkillfulFormationStateImplCopyWith<$Res> {
  __$$SkillfulFormationStateImplCopyWithImpl(
    _$SkillfulFormationStateImpl _value,
    $Res Function(_$SkillfulFormationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SkillfulFormationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formations = null,
    Object? loading = null,
    Object? trainigGroup = freezed,
  }) {
    return _then(
      _$SkillfulFormationStateImpl(
        formations:
            null == formations
                ? _value._formations
                : formations // ignore: cast_nullable_to_non_nullable
                    as List<Formation>,
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        trainigGroup:
            freezed == trainigGroup
                ? _value.trainigGroup
                : trainigGroup // ignore: cast_nullable_to_non_nullable
                    as TrainigGroup?,
      ),
    );
  }
}

/// @nodoc

class _$SkillfulFormationStateImpl extends _SkillfulFormationState {
  const _$SkillfulFormationStateImpl({
    final List<Formation> formations = const <Formation>[],
    this.loading = false,
    this.trainigGroup,
  }) : _formations = formations,
       super._();

  final List<Formation> _formations;
  @override
  @JsonKey()
  List<Formation> get formations {
    if (_formations is EqualUnmodifiableListView) return _formations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formations);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final TrainigGroup? trainigGroup;

  @override
  String toString() {
    return 'SkillfulFormationState(formations: $formations, loading: $loading, trainigGroup: $trainigGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillfulFormationStateImpl &&
            const DeepCollectionEquality().equals(
              other._formations,
              _formations,
            ) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.trainigGroup, trainigGroup) ||
                other.trainigGroup == trainigGroup));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_formations),
    loading,
    trainigGroup,
  );

  /// Create a copy of SkillfulFormationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillfulFormationStateImplCopyWith<_$SkillfulFormationStateImpl>
  get copyWith =>
      __$$SkillfulFormationStateImplCopyWithImpl<_$SkillfulFormationStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SkillfulFormationState extends SkillfulFormationState {
  const factory _SkillfulFormationState({
    final List<Formation> formations,
    final bool loading,
    final TrainigGroup? trainigGroup,
  }) = _$SkillfulFormationStateImpl;
  const _SkillfulFormationState._() : super._();

  @override
  List<Formation> get formations;
  @override
  bool get loading;
  @override
  TrainigGroup? get trainigGroup;

  /// Create a copy of SkillfulFormationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillfulFormationStateImplCopyWith<_$SkillfulFormationStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
