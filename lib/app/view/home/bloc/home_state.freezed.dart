// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  bool get loading => throw _privateConstructorUsedError;
  List<HeroHome> get hero => throw _privateConstructorUsedError;
  List<Category> get promotions => throw _privateConstructorUsedError;
  List<Category> get products => throw _privateConstructorUsedError;
  List<Services> get services => throw _privateConstructorUsedError;
  List<WorkShop> get workshop => throw _privateConstructorUsedError;
  List<News> get notices => throw _privateConstructorUsedError;
  List<Brand> get brands => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool loading,
      List<HeroHome> hero,
      List<Category> promotions,
      List<Category> products,
      List<Services> services,
      List<WorkShop> workshop,
      List<News> notices,
      List<Brand> brands});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hero = null,
    Object? promotions = null,
    Object? products = null,
    Object? services = null,
    Object? workshop = null,
    Object? notices = null,
    Object? brands = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hero: null == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as List<HeroHome>,
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Services>,
      workshop: null == workshop
          ? _value.workshop
          : workshop // ignore: cast_nullable_to_non_nullable
              as List<WorkShop>,
      notices: null == notices
          ? _value.notices
          : notices // ignore: cast_nullable_to_non_nullable
              as List<News>,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<HeroHome> hero,
      List<Category> promotions,
      List<Category> products,
      List<Services> services,
      List<WorkShop> workshop,
      List<News> notices,
      List<Brand> brands});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hero = null,
    Object? promotions = null,
    Object? products = null,
    Object? services = null,
    Object? workshop = null,
    Object? notices = null,
    Object? brands = null,
  }) {
    return _then(_$_HomeState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hero: null == hero
          ? _value._hero
          : hero // ignore: cast_nullable_to_non_nullable
              as List<HeroHome>,
      promotions: null == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Services>,
      workshop: null == workshop
          ? _value._workshop
          : workshop // ignore: cast_nullable_to_non_nullable
              as List<WorkShop>,
      notices: null == notices
          ? _value._notices
          : notices // ignore: cast_nullable_to_non_nullable
              as List<News>,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState(
      {this.loading = false,
      final List<HeroHome> hero = const <HeroHome>[],
      final List<Category> promotions = const <Category>[],
      final List<Category> products = const <Category>[],
      final List<Services> services = const <Services>[],
      final List<WorkShop> workshop = const <WorkShop>[],
      final List<News> notices = const <News>[],
      final List<Brand> brands = const <Brand>[]})
      : _hero = hero,
        _promotions = promotions,
        _products = products,
        _services = services,
        _workshop = workshop,
        _notices = notices,
        _brands = brands,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<HeroHome> _hero;
  @override
  @JsonKey()
  List<HeroHome> get hero {
    if (_hero is EqualUnmodifiableListView) return _hero;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hero);
  }

  final List<Category> _promotions;
  @override
  @JsonKey()
  List<Category> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  final List<Category> _products;
  @override
  @JsonKey()
  List<Category> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<Services> _services;
  @override
  @JsonKey()
  List<Services> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<WorkShop> _workshop;
  @override
  @JsonKey()
  List<WorkShop> get workshop {
    if (_workshop is EqualUnmodifiableListView) return _workshop;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workshop);
  }

  final List<News> _notices;
  @override
  @JsonKey()
  List<News> get notices {
    if (_notices is EqualUnmodifiableListView) return _notices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notices);
  }

  final List<Brand> _brands;
  @override
  @JsonKey()
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, hero: $hero, promotions: $promotions, products: $products, services: $services, workshop: $workshop, notices: $notices, brands: $brands)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._hero, _hero) &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._workshop, _workshop) &&
            const DeepCollectionEquality().equals(other._notices, _notices) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_hero),
      const DeepCollectionEquality().hash(_promotions),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_workshop),
      const DeepCollectionEquality().hash(_notices),
      const DeepCollectionEquality().hash(_brands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final bool loading,
      final List<HeroHome> hero,
      final List<Category> promotions,
      final List<Category> products,
      final List<Services> services,
      final List<WorkShop> workshop,
      final List<News> notices,
      final List<Brand> brands}) = _$_HomeState;
  const _HomeState._() : super._();

  @override
  bool get loading;
  @override
  List<HeroHome> get hero;
  @override
  List<Category> get promotions;
  @override
  List<Category> get products;
  @override
  List<Services> get services;
  @override
  List<WorkShop> get workshop;
  @override
  List<News> get notices;
  @override
  List<Brand> get brands;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
