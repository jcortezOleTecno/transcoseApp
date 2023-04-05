// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'our_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OurProductsState {
  List<Category> get categories => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OurProductsStateCopyWith<OurProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OurProductsStateCopyWith<$Res> {
  factory $OurProductsStateCopyWith(
          OurProductsState value, $Res Function(OurProductsState) then) =
      _$OurProductsStateCopyWithImpl<$Res, OurProductsState>;
  @useResult
  $Res call(
      {List<Category> categories,
      bool loading,
      Category? category,
      String? query});
}

/// @nodoc
class _$OurProductsStateCopyWithImpl<$Res, $Val extends OurProductsState>
    implements $OurProductsStateCopyWith<$Res> {
  _$OurProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? loading = null,
    Object? category = freezed,
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OurProductsStateCopyWith<$Res>
    implements $OurProductsStateCopyWith<$Res> {
  factory _$$_OurProductsStateCopyWith(
          _$_OurProductsState value, $Res Function(_$_OurProductsState) then) =
      __$$_OurProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categories,
      bool loading,
      Category? category,
      String? query});
}

/// @nodoc
class __$$_OurProductsStateCopyWithImpl<$Res>
    extends _$OurProductsStateCopyWithImpl<$Res, _$_OurProductsState>
    implements _$$_OurProductsStateCopyWith<$Res> {
  __$$_OurProductsStateCopyWithImpl(
      _$_OurProductsState _value, $Res Function(_$_OurProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? loading = null,
    Object? category = freezed,
    Object? query = freezed,
  }) {
    return _then(_$_OurProductsState(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_OurProductsState extends _OurProductsState {
  const _$_OurProductsState(
      {final List<Category> categories = const <Category>[],
      this.loading = false,
      this.category,
      this.query})
      : _categories = categories,
        super._();

  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final Category? category;
  @override
  final String? query;

  @override
  String toString() {
    return 'OurProductsState(categories: $categories, loading: $loading, category: $category, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OurProductsState &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      loading,
      category,
      query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OurProductsStateCopyWith<_$_OurProductsState> get copyWith =>
      __$$_OurProductsStateCopyWithImpl<_$_OurProductsState>(this, _$identity);
}

abstract class _OurProductsState extends OurProductsState {
  const factory _OurProductsState(
      {final List<Category> categories,
      final bool loading,
      final Category? category,
      final String? query}) = _$_OurProductsState;
  const _OurProductsState._() : super._();

  @override
  List<Category> get categories;
  @override
  bool get loading;
  @override
  Category? get category;
  @override
  String? get query;
  @override
  @JsonKey(ignore: true)
  _$$_OurProductsStateCopyWith<_$_OurProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
