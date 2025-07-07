// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_of_vehicle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TypeOfVehicleState {
  bool get loading => throw _privateConstructorUsedError;
  List<TypeOfVehicle> get types => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Header? get header => throw _privateConstructorUsedError;

  /// Create a copy of TypeOfVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeOfVehicleStateCopyWith<TypeOfVehicleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeOfVehicleStateCopyWith<$Res> {
  factory $TypeOfVehicleStateCopyWith(
    TypeOfVehicleState value,
    $Res Function(TypeOfVehicleState) then,
  ) = _$TypeOfVehicleStateCopyWithImpl<$Res, TypeOfVehicleState>;
  @useResult
  $Res call({
    bool loading,
    List<TypeOfVehicle> types,
    Category? category,
    Header? header,
  });
}

/// @nodoc
class _$TypeOfVehicleStateCopyWithImpl<$Res, $Val extends TypeOfVehicleState>
    implements $TypeOfVehicleStateCopyWith<$Res> {
  _$TypeOfVehicleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeOfVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? types = null,
    Object? category = freezed,
    Object? header = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            types:
                null == types
                    ? _value.types
                    : types // ignore: cast_nullable_to_non_nullable
                        as List<TypeOfVehicle>,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category?,
            header:
                freezed == header
                    ? _value.header
                    : header // ignore: cast_nullable_to_non_nullable
                        as Header?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypeOfVehicleStateImplCopyWith<$Res>
    implements $TypeOfVehicleStateCopyWith<$Res> {
  factory _$$TypeOfVehicleStateImplCopyWith(
    _$TypeOfVehicleStateImpl value,
    $Res Function(_$TypeOfVehicleStateImpl) then,
  ) = __$$TypeOfVehicleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    List<TypeOfVehicle> types,
    Category? category,
    Header? header,
  });
}

/// @nodoc
class __$$TypeOfVehicleStateImplCopyWithImpl<$Res>
    extends _$TypeOfVehicleStateCopyWithImpl<$Res, _$TypeOfVehicleStateImpl>
    implements _$$TypeOfVehicleStateImplCopyWith<$Res> {
  __$$TypeOfVehicleStateImplCopyWithImpl(
    _$TypeOfVehicleStateImpl _value,
    $Res Function(_$TypeOfVehicleStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeOfVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? types = null,
    Object? category = freezed,
    Object? header = freezed,
  }) {
    return _then(
      _$TypeOfVehicleStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        types:
            null == types
                ? _value._types
                : types // ignore: cast_nullable_to_non_nullable
                    as List<TypeOfVehicle>,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category?,
        header:
            freezed == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                    as Header?,
      ),
    );
  }
}

/// @nodoc

class _$TypeOfVehicleStateImpl extends _TypeOfVehicleState {
  const _$TypeOfVehicleStateImpl({
    this.loading = false,
    final List<TypeOfVehicle> types = const <TypeOfVehicle>[],
    this.category,
    this.header,
  }) : _types = types,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<TypeOfVehicle> _types;
  @override
  @JsonKey()
  List<TypeOfVehicle> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final Category? category;
  @override
  final Header? header;

  @override
  String toString() {
    return 'TypeOfVehicleState(loading: $loading, types: $types, category: $category, header: $header)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeOfVehicleStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.header, header) || other.header == header));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_types),
    category,
    header,
  );

  /// Create a copy of TypeOfVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeOfVehicleStateImplCopyWith<_$TypeOfVehicleStateImpl> get copyWith =>
      __$$TypeOfVehicleStateImplCopyWithImpl<_$TypeOfVehicleStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TypeOfVehicleState extends TypeOfVehicleState {
  const factory _TypeOfVehicleState({
    final bool loading,
    final List<TypeOfVehicle> types,
    final Category? category,
    final Header? header,
  }) = _$TypeOfVehicleStateImpl;
  const _TypeOfVehicleState._() : super._();

  @override
  bool get loading;
  @override
  List<TypeOfVehicle> get types;
  @override
  Category? get category;
  @override
  Header? get header;

  /// Create a copy of TypeOfVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeOfVehicleStateImplCopyWith<_$TypeOfVehicleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
