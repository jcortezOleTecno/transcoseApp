// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'our_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OurHistoryState {
  List<ArticleAboutUs> get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OurHistoryStateCopyWith<OurHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OurHistoryStateCopyWith<$Res> {
  factory $OurHistoryStateCopyWith(
          OurHistoryState value, $Res Function(OurHistoryState) then) =
      _$OurHistoryStateCopyWithImpl<$Res, OurHistoryState>;
  @useResult
  $Res call({List<ArticleAboutUs> articles});
}

/// @nodoc
class _$OurHistoryStateCopyWithImpl<$Res, $Val extends OurHistoryState>
    implements $OurHistoryStateCopyWith<$Res> {
  _$OurHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleAboutUs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OurHistoryStateCopyWith<$Res>
    implements $OurHistoryStateCopyWith<$Res> {
  factory _$$_OurHistoryStateCopyWith(
          _$_OurHistoryState value, $Res Function(_$_OurHistoryState) then) =
      __$$_OurHistoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArticleAboutUs> articles});
}

/// @nodoc
class __$$_OurHistoryStateCopyWithImpl<$Res>
    extends _$OurHistoryStateCopyWithImpl<$Res, _$_OurHistoryState>
    implements _$$_OurHistoryStateCopyWith<$Res> {
  __$$_OurHistoryStateCopyWithImpl(
      _$_OurHistoryState _value, $Res Function(_$_OurHistoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$_OurHistoryState(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleAboutUs>,
    ));
  }
}

/// @nodoc

class _$_OurHistoryState extends _OurHistoryState {
  const _$_OurHistoryState(
      {final List<ArticleAboutUs> articles = const <ArticleAboutUs>[]})
      : _articles = articles,
        super._();

  final List<ArticleAboutUs> _articles;
  @override
  @JsonKey()
  List<ArticleAboutUs> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'OurHistoryState(articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OurHistoryState &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OurHistoryStateCopyWith<_$_OurHistoryState> get copyWith =>
      __$$_OurHistoryStateCopyWithImpl<_$_OurHistoryState>(this, _$identity);
}

abstract class _OurHistoryState extends OurHistoryState {
  const factory _OurHistoryState({final List<ArticleAboutUs> articles}) =
      _$_OurHistoryState;
  const _OurHistoryState._() : super._();

  @override
  List<ArticleAboutUs> get articles;
  @override
  @JsonKey(ignore: true)
  _$$_OurHistoryStateCopyWith<_$_OurHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
