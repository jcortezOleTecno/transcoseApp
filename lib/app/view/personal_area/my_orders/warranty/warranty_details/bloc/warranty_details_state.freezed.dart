// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warranty_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WarrantyDetailsState {
  bool get loading => throw _privateConstructorUsedError;
  WarrantyDetailModel? get details => throw _privateConstructorUsedError;
  Warranty? get warranty => throw _privateConstructorUsedError;

  /// Create a copy of WarrantyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WarrantyDetailsStateCopyWith<WarrantyDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarrantyDetailsStateCopyWith<$Res> {
  factory $WarrantyDetailsStateCopyWith(
    WarrantyDetailsState value,
    $Res Function(WarrantyDetailsState) then,
  ) = _$WarrantyDetailsStateCopyWithImpl<$Res, WarrantyDetailsState>;
  @useResult
  $Res call({bool loading, WarrantyDetailModel? details, Warranty? warranty});
}

/// @nodoc
class _$WarrantyDetailsStateCopyWithImpl<
  $Res,
  $Val extends WarrantyDetailsState
>
    implements $WarrantyDetailsStateCopyWith<$Res> {
  _$WarrantyDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WarrantyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? details = freezed,
    Object? warranty = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            details:
                freezed == details
                    ? _value.details
                    : details // ignore: cast_nullable_to_non_nullable
                        as WarrantyDetailModel?,
            warranty:
                freezed == warranty
                    ? _value.warranty
                    : warranty // ignore: cast_nullable_to_non_nullable
                        as Warranty?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WarrantyDetailsStateImplCopyWith<$Res>
    implements $WarrantyDetailsStateCopyWith<$Res> {
  factory _$$WarrantyDetailsStateImplCopyWith(
    _$WarrantyDetailsStateImpl value,
    $Res Function(_$WarrantyDetailsStateImpl) then,
  ) = __$$WarrantyDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, WarrantyDetailModel? details, Warranty? warranty});
}

/// @nodoc
class __$$WarrantyDetailsStateImplCopyWithImpl<$Res>
    extends _$WarrantyDetailsStateCopyWithImpl<$Res, _$WarrantyDetailsStateImpl>
    implements _$$WarrantyDetailsStateImplCopyWith<$Res> {
  __$$WarrantyDetailsStateImplCopyWithImpl(
    _$WarrantyDetailsStateImpl _value,
    $Res Function(_$WarrantyDetailsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WarrantyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? details = freezed,
    Object? warranty = freezed,
  }) {
    return _then(
      _$WarrantyDetailsStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        details:
            freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                    as WarrantyDetailModel?,
        warranty:
            freezed == warranty
                ? _value.warranty
                : warranty // ignore: cast_nullable_to_non_nullable
                    as Warranty?,
      ),
    );
  }
}

/// @nodoc

class _$WarrantyDetailsStateImpl extends _WarrantyDetailsState {
  const _$WarrantyDetailsStateImpl({
    this.loading = false,
    this.details,
    this.warranty,
  }) : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final WarrantyDetailModel? details;
  @override
  final Warranty? warranty;

  @override
  String toString() {
    return 'WarrantyDetailsState(loading: $loading, details: $details, warranty: $warranty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarrantyDetailsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.warranty, warranty) ||
                other.warranty == warranty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, details, warranty);

  /// Create a copy of WarrantyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WarrantyDetailsStateImplCopyWith<_$WarrantyDetailsStateImpl>
  get copyWith =>
      __$$WarrantyDetailsStateImplCopyWithImpl<_$WarrantyDetailsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WarrantyDetailsState extends WarrantyDetailsState {
  const factory _WarrantyDetailsState({
    final bool loading,
    final WarrantyDetailModel? details,
    final Warranty? warranty,
  }) = _$WarrantyDetailsStateImpl;
  const _WarrantyDetailsState._() : super._();

  @override
  bool get loading;
  @override
  WarrantyDetailModel? get details;
  @override
  Warranty? get warranty;

  /// Create a copy of WarrantyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WarrantyDetailsStateImplCopyWith<_$WarrantyDetailsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
