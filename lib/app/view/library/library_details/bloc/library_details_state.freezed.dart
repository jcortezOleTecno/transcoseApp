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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LibraryDetailsState {
  String? get id => throw _privateConstructorUsedError;
  ArticleLibraryDetails? get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryDetailsStateCopyWith<LibraryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryDetailsStateCopyWith<$Res> {
  factory $LibraryDetailsStateCopyWith(
          LibraryDetailsState value, $Res Function(LibraryDetailsState) then) =
      _$LibraryDetailsStateCopyWithImpl<$Res, LibraryDetailsState>;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ArticleLibraryDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LibraryDetailsStateCopyWith<$Res>
    implements $LibraryDetailsStateCopyWith<$Res> {
  factory _$$_LibraryDetailsStateCopyWith(_$_LibraryDetailsState value,
          $Res Function(_$_LibraryDetailsState) then) =
      __$$_LibraryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, ArticleLibraryDetails? details});
}

/// @nodoc
class __$$_LibraryDetailsStateCopyWithImpl<$Res>
    extends _$LibraryDetailsStateCopyWithImpl<$Res, _$_LibraryDetailsState>
    implements _$$_LibraryDetailsStateCopyWith<$Res> {
  __$$_LibraryDetailsStateCopyWithImpl(_$_LibraryDetailsState _value,
      $Res Function(_$_LibraryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_LibraryDetailsState(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ArticleLibraryDetails?,
    ));
  }
}

/// @nodoc

class _$_LibraryDetailsState extends _LibraryDetailsState {
  const _$_LibraryDetailsState({this.id, this.details}) : super._();

  @override
  final String? id;
  @override
  final ArticleLibraryDetails? details;

  @override
  String toString() {
    return 'LibraryDetailsState(id: $id, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LibraryDetailsState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LibraryDetailsStateCopyWith<_$_LibraryDetailsState> get copyWith =>
      __$$_LibraryDetailsStateCopyWithImpl<_$_LibraryDetailsState>(
          this, _$identity);
}

abstract class _LibraryDetailsState extends LibraryDetailsState {
  const factory _LibraryDetailsState(
      {final String? id,
      final ArticleLibraryDetails? details}) = _$_LibraryDetailsState;
  const _LibraryDetailsState._() : super._();

  @override
  String? get id;
  @override
  ArticleLibraryDetails? get details;
  @override
  @JsonKey(ignore: true)
  _$$_LibraryDetailsStateCopyWith<_$_LibraryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
