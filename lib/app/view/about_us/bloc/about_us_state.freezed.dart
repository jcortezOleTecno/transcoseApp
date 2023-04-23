// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AboutUsState {
  List<Library> get libraries => throw _privateConstructorUsedError;
  List<Pills> get pills => throw _privateConstructorUsedError;
  List<News> get news => throw _privateConstructorUsedError;
  RedesSociales? get redes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutUsStateCopyWith<AboutUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsStateCopyWith<$Res> {
  factory $AboutUsStateCopyWith(
          AboutUsState value, $Res Function(AboutUsState) then) =
      _$AboutUsStateCopyWithImpl<$Res, AboutUsState>;
  @useResult
  $Res call(
      {List<Library> libraries,
      List<Pills> pills,
      List<News> news,
      RedesSociales? redes});
}

/// @nodoc
class _$AboutUsStateCopyWithImpl<$Res, $Val extends AboutUsState>
    implements $AboutUsStateCopyWith<$Res> {
  _$AboutUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraries = null,
    Object? pills = null,
    Object? news = null,
    Object? redes = freezed,
  }) {
    return _then(_value.copyWith(
      libraries: null == libraries
          ? _value.libraries
          : libraries // ignore: cast_nullable_to_non_nullable
              as List<Library>,
      pills: null == pills
          ? _value.pills
          : pills // ignore: cast_nullable_to_non_nullable
              as List<Pills>,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      redes: freezed == redes
          ? _value.redes
          : redes // ignore: cast_nullable_to_non_nullable
              as RedesSociales?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutUsStateCopyWith<$Res>
    implements $AboutUsStateCopyWith<$Res> {
  factory _$$_AboutUsStateCopyWith(
          _$_AboutUsState value, $Res Function(_$_AboutUsState) then) =
      __$$_AboutUsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Library> libraries,
      List<Pills> pills,
      List<News> news,
      RedesSociales? redes});
}

/// @nodoc
class __$$_AboutUsStateCopyWithImpl<$Res>
    extends _$AboutUsStateCopyWithImpl<$Res, _$_AboutUsState>
    implements _$$_AboutUsStateCopyWith<$Res> {
  __$$_AboutUsStateCopyWithImpl(
      _$_AboutUsState _value, $Res Function(_$_AboutUsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraries = null,
    Object? pills = null,
    Object? news = null,
    Object? redes = freezed,
  }) {
    return _then(_$_AboutUsState(
      libraries: null == libraries
          ? _value._libraries
          : libraries // ignore: cast_nullable_to_non_nullable
              as List<Library>,
      pills: null == pills
          ? _value._pills
          : pills // ignore: cast_nullable_to_non_nullable
              as List<Pills>,
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      redes: freezed == redes
          ? _value.redes
          : redes // ignore: cast_nullable_to_non_nullable
              as RedesSociales?,
    ));
  }
}

/// @nodoc

class _$_AboutUsState extends _AboutUsState {
  const _$_AboutUsState(
      {final List<Library> libraries = const <Library>[],
      final List<Pills> pills = const <Pills>[],
      final List<News> news = const <News>[],
      this.redes})
      : _libraries = libraries,
        _pills = pills,
        _news = news,
        super._();

  final List<Library> _libraries;
  @override
  @JsonKey()
  List<Library> get libraries {
    if (_libraries is EqualUnmodifiableListView) return _libraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_libraries);
  }

  final List<Pills> _pills;
  @override
  @JsonKey()
  List<Pills> get pills {
    if (_pills is EqualUnmodifiableListView) return _pills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pills);
  }

  final List<News> _news;
  @override
  @JsonKey()
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  final RedesSociales? redes;

  @override
  String toString() {
    return 'AboutUsState(libraries: $libraries, pills: $pills, news: $news, redes: $redes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutUsState &&
            const DeepCollectionEquality()
                .equals(other._libraries, _libraries) &&
            const DeepCollectionEquality().equals(other._pills, _pills) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.redes, redes) || other.redes == redes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_libraries),
      const DeepCollectionEquality().hash(_pills),
      const DeepCollectionEquality().hash(_news),
      redes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutUsStateCopyWith<_$_AboutUsState> get copyWith =>
      __$$_AboutUsStateCopyWithImpl<_$_AboutUsState>(this, _$identity);
}

abstract class _AboutUsState extends AboutUsState {
  const factory _AboutUsState(
      {final List<Library> libraries,
      final List<Pills> pills,
      final List<News> news,
      final RedesSociales? redes}) = _$_AboutUsState;
  const _AboutUsState._() : super._();

  @override
  List<Library> get libraries;
  @override
  List<Pills> get pills;
  @override
  List<News> get news;
  @override
  RedesSociales? get redes;
  @override
  @JsonKey(ignore: true)
  _$$_AboutUsStateCopyWith<_$_AboutUsState> get copyWith =>
      throw _privateConstructorUsedError;
}
