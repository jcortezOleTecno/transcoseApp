// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsDetailsState {
  String? get id => throw _privateConstructorUsedError;
  ArticleNewsDetails? get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsDetailsStateCopyWith<NewsDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDetailsStateCopyWith<$Res> {
  factory $NewsDetailsStateCopyWith(
          NewsDetailsState value, $Res Function(NewsDetailsState) then) =
      _$NewsDetailsStateCopyWithImpl<$Res, NewsDetailsState>;
  @useResult
  $Res call({String? id, ArticleNewsDetails? details});
}

/// @nodoc
class _$NewsDetailsStateCopyWithImpl<$Res, $Val extends NewsDetailsState>
    implements $NewsDetailsStateCopyWith<$Res> {
  _$NewsDetailsStateCopyWithImpl(this._value, this._then);

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
              as ArticleNewsDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsDetailsStateCopyWith<$Res>
    implements $NewsDetailsStateCopyWith<$Res> {
  factory _$$_NewsDetailsStateCopyWith(
          _$_NewsDetailsState value, $Res Function(_$_NewsDetailsState) then) =
      __$$_NewsDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, ArticleNewsDetails? details});
}

/// @nodoc
class __$$_NewsDetailsStateCopyWithImpl<$Res>
    extends _$NewsDetailsStateCopyWithImpl<$Res, _$_NewsDetailsState>
    implements _$$_NewsDetailsStateCopyWith<$Res> {
  __$$_NewsDetailsStateCopyWithImpl(
      _$_NewsDetailsState _value, $Res Function(_$_NewsDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_NewsDetailsState(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ArticleNewsDetails?,
    ));
  }
}

/// @nodoc

class _$_NewsDetailsState extends _NewsDetailsState {
  const _$_NewsDetailsState({this.id, this.details}) : super._();

  @override
  final String? id;
  @override
  final ArticleNewsDetails? details;

  @override
  String toString() {
    return 'NewsDetailsState(id: $id, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsDetailsState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsDetailsStateCopyWith<_$_NewsDetailsState> get copyWith =>
      __$$_NewsDetailsStateCopyWithImpl<_$_NewsDetailsState>(this, _$identity);
}

abstract class _NewsDetailsState extends NewsDetailsState {
  const factory _NewsDetailsState(
      {final String? id,
      final ArticleNewsDetails? details}) = _$_NewsDetailsState;
  const _NewsDetailsState._() : super._();

  @override
  String? get id;
  @override
  ArticleNewsDetails? get details;
  @override
  @JsonKey(ignore: true)
  _$$_NewsDetailsStateCopyWith<_$_NewsDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
