// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LibraryDetailsState {
  String? get id => throw _privateConstructorUsedError;
  ArticleLibraryDetails? get details => throw _privateConstructorUsedError;

  /// Create a copy of LibraryDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryDetailsStateCopyWith<LibraryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryDetailsStateCopyWith<$Res> {
  factory $LibraryDetailsStateCopyWith(
    LibraryDetailsState value,
    $Res Function(LibraryDetailsState) then,
  ) = _$LibraryDetailsStateCopyWithImpl<$Res, LibraryDetailsState>;
  @useResult
  $Res call({String? id, ArticleLibraryDetails? details});
}

/// @nodoc
class _$LibraryDetailsStateCopyWithImpl<$Res, $Val extends LibraryDetailsState>
    implements $LibraryDetailsStateCopyWith<$Res> {
  _$LibraryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? details = freezed}) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            details:
                freezed == details
                    ? _value.details
                    : details // ignore: cast_nullable_to_non_nullable
                        as ArticleLibraryDetails?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LibraryDetailsStateImplCopyWith<$Res>
    implements $LibraryDetailsStateCopyWith<$Res> {
  factory _$$LibraryDetailsStateImplCopyWith(
    _$LibraryDetailsStateImpl value,
    $Res Function(_$LibraryDetailsStateImpl) then,
  ) = __$$LibraryDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, ArticleLibraryDetails? details});
}

/// @nodoc
class __$$LibraryDetailsStateImplCopyWithImpl<$Res>
    extends _$LibraryDetailsStateCopyWithImpl<$Res, _$LibraryDetailsStateImpl>
    implements _$$LibraryDetailsStateImplCopyWith<$Res> {
  __$$LibraryDetailsStateImplCopyWithImpl(
    _$LibraryDetailsStateImpl _value,
    $Res Function(_$LibraryDetailsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? details = freezed}) {
    return _then(
      _$LibraryDetailsStateImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        details:
            freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                    as ArticleLibraryDetails?,
      ),
    );
  }
}

/// @nodoc

class _$LibraryDetailsStateImpl extends _LibraryDetailsState {
  const _$LibraryDetailsStateImpl({this.id, this.details}) : super._();

  @override
  final String? id;
  @override
  final ArticleLibraryDetails? details;

  @override
  String toString() {
    return 'LibraryDetailsState(id: $id, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryDetailsStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, details);

  /// Create a copy of LibraryDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryDetailsStateImplCopyWith<_$LibraryDetailsStateImpl> get copyWith =>
      __$$LibraryDetailsStateImplCopyWithImpl<_$LibraryDetailsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LibraryDetailsState extends LibraryDetailsState {
  const factory _LibraryDetailsState({
    final String? id,
    final ArticleLibraryDetails? details,
  }) = _$LibraryDetailsStateImpl;
  const _LibraryDetailsState._() : super._();

  @override
  String? get id;
  @override
  ArticleLibraryDetails? get details;

  /// Create a copy of LibraryDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryDetailsStateImplCopyWith<_$LibraryDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
