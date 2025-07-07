// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'albaran_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AlbaranDetailState {
  bool get loading => throw _privateConstructorUsedError;
  List<AlbaranDetails> get details => throw _privateConstructorUsedError;
  Albaran? get albaran => throw _privateConstructorUsedError;

  /// Create a copy of AlbaranDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbaranDetailStateCopyWith<AlbaranDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbaranDetailStateCopyWith<$Res> {
  factory $AlbaranDetailStateCopyWith(
    AlbaranDetailState value,
    $Res Function(AlbaranDetailState) then,
  ) = _$AlbaranDetailStateCopyWithImpl<$Res, AlbaranDetailState>;
  @useResult
  $Res call({bool loading, List<AlbaranDetails> details, Albaran? albaran});
}

/// @nodoc
class _$AlbaranDetailStateCopyWithImpl<$Res, $Val extends AlbaranDetailState>
    implements $AlbaranDetailStateCopyWith<$Res> {
  _$AlbaranDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbaranDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? details = null,
    Object? albaran = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            details:
                null == details
                    ? _value.details
                    : details // ignore: cast_nullable_to_non_nullable
                        as List<AlbaranDetails>,
            albaran:
                freezed == albaran
                    ? _value.albaran
                    : albaran // ignore: cast_nullable_to_non_nullable
                        as Albaran?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlbaranDetailStateImplCopyWith<$Res>
    implements $AlbaranDetailStateCopyWith<$Res> {
  factory _$$AlbaranDetailStateImplCopyWith(
    _$AlbaranDetailStateImpl value,
    $Res Function(_$AlbaranDetailStateImpl) then,
  ) = __$$AlbaranDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<AlbaranDetails> details, Albaran? albaran});
}

/// @nodoc
class __$$AlbaranDetailStateImplCopyWithImpl<$Res>
    extends _$AlbaranDetailStateCopyWithImpl<$Res, _$AlbaranDetailStateImpl>
    implements _$$AlbaranDetailStateImplCopyWith<$Res> {
  __$$AlbaranDetailStateImplCopyWithImpl(
    _$AlbaranDetailStateImpl _value,
    $Res Function(_$AlbaranDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlbaranDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? details = null,
    Object? albaran = freezed,
  }) {
    return _then(
      _$AlbaranDetailStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        details:
            null == details
                ? _value._details
                : details // ignore: cast_nullable_to_non_nullable
                    as List<AlbaranDetails>,
        albaran:
            freezed == albaran
                ? _value.albaran
                : albaran // ignore: cast_nullable_to_non_nullable
                    as Albaran?,
      ),
    );
  }
}

/// @nodoc

class _$AlbaranDetailStateImpl extends _AlbaranDetailState {
  const _$AlbaranDetailStateImpl({
    this.loading = false,
    final List<AlbaranDetails> details = const <AlbaranDetails>[],
    this.albaran,
  }) : _details = details,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<AlbaranDetails> _details;
  @override
  @JsonKey()
  List<AlbaranDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final Albaran? albaran;

  @override
  String toString() {
    return 'AlbaranDetailState(loading: $loading, details: $details, albaran: $albaran)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbaranDetailStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.albaran, albaran) || other.albaran == albaran));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_details),
    albaran,
  );

  /// Create a copy of AlbaranDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbaranDetailStateImplCopyWith<_$AlbaranDetailStateImpl> get copyWith =>
      __$$AlbaranDetailStateImplCopyWithImpl<_$AlbaranDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AlbaranDetailState extends AlbaranDetailState {
  const factory _AlbaranDetailState({
    final bool loading,
    final List<AlbaranDetails> details,
    final Albaran? albaran,
  }) = _$AlbaranDetailStateImpl;
  const _AlbaranDetailState._() : super._();

  @override
  bool get loading;
  @override
  List<AlbaranDetails> get details;
  @override
  Albaran? get albaran;

  /// Create a copy of AlbaranDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbaranDetailStateImplCopyWith<_$AlbaranDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
