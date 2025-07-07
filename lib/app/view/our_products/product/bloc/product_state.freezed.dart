// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductState {
  bool get loading => throw _privateConstructorUsedError;
  List<Category> get categories =>
      throw _privateConstructorUsedError; // @Default(<Brand>[]) List<Brand> brands,
  Category? get category => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  CategoryDetail? get details => throw _privateConstructorUsedError;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
    ProductState value,
    $Res Function(ProductState) then,
  ) = _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call({
    bool loading,
    List<Category> categories,
    Category? category,
    String? query,
    CategoryDetail? details,
  });
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? categories = null,
    Object? category = freezed,
    Object? query = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<Category>,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category?,
            query:
                freezed == query
                    ? _value.query
                    : query // ignore: cast_nullable_to_non_nullable
                        as String?,
            details:
                freezed == details
                    ? _value.details
                    : details // ignore: cast_nullable_to_non_nullable
                        as CategoryDetail?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$ProductStateImplCopyWith(
    _$ProductStateImpl value,
    $Res Function(_$ProductStateImpl) then,
  ) = __$$ProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    List<Category> categories,
    Category? category,
    String? query,
    CategoryDetail? details,
  });
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateImpl>
    implements _$$ProductStateImplCopyWith<$Res> {
  __$$ProductStateImplCopyWithImpl(
    _$ProductStateImpl _value,
    $Res Function(_$ProductStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? categories = null,
    Object? category = freezed,
    Object? query = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _$ProductStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<Category>,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category?,
        query:
            freezed == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String?,
        details:
            freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                    as CategoryDetail?,
      ),
    );
  }
}

/// @nodoc

class _$ProductStateImpl extends _ProductState {
  const _$ProductStateImpl({
    this.loading = false,
    final List<Category> categories = const <Category>[],
    this.category,
    this.query,
    this.details,
  }) : _categories = categories,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  // @Default(<Brand>[]) List<Brand> brands,
  @override
  final Category? category;
  @override
  final String? query;
  @override
  final CategoryDetail? details;

  @override
  String toString() {
    return 'ProductState(loading: $loading, categories: $categories, category: $category, query: $query, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_categories),
    category,
    query,
    details,
  );

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      __$$ProductStateImplCopyWithImpl<_$ProductStateImpl>(this, _$identity);
}

abstract class _ProductState extends ProductState {
  const factory _ProductState({
    final bool loading,
    final List<Category> categories,
    final Category? category,
    final String? query,
    final CategoryDetail? details,
  }) = _$ProductStateImpl;
  const _ProductState._() : super._();

  @override
  bool get loading;
  @override
  List<Category> get categories; // @Default(<Brand>[]) List<Brand> brands,
  @override
  Category? get category;
  @override
  String? get query;
  @override
  CategoryDetail? get details;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
