// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PromotionState {
  List<Promotion> get promotions => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Category? get categoryTemp => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionStateCopyWith<PromotionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionStateCopyWith<$Res> {
  factory $PromotionStateCopyWith(
    PromotionState value,
    $Res Function(PromotionState) then,
  ) = _$PromotionStateCopyWithImpl<$Res, PromotionState>;
  @useResult
  $Res call({
    List<Promotion> promotions,
    List<Category> categories,
    bool loading,
    Category? category,
    Category? categoryTemp,
    String? query,
  });
}

/// @nodoc
class _$PromotionStateCopyWithImpl<$Res, $Val extends PromotionState>
    implements $PromotionStateCopyWith<$Res> {
  _$PromotionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? categories = null,
    Object? loading = null,
    Object? category = freezed,
    Object? categoryTemp = freezed,
    Object? query = freezed,
  }) {
    return _then(
      _value.copyWith(
            promotions:
                null == promotions
                    ? _value.promotions
                    : promotions // ignore: cast_nullable_to_non_nullable
                        as List<Promotion>,
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<Category>,
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category?,
            categoryTemp:
                freezed == categoryTemp
                    ? _value.categoryTemp
                    : categoryTemp // ignore: cast_nullable_to_non_nullable
                        as Category?,
            query:
                freezed == query
                    ? _value.query
                    : query // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromotionStateImplCopyWith<$Res>
    implements $PromotionStateCopyWith<$Res> {
  factory _$$PromotionStateImplCopyWith(
    _$PromotionStateImpl value,
    $Res Function(_$PromotionStateImpl) then,
  ) = __$$PromotionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Promotion> promotions,
    List<Category> categories,
    bool loading,
    Category? category,
    Category? categoryTemp,
    String? query,
  });
}

/// @nodoc
class __$$PromotionStateImplCopyWithImpl<$Res>
    extends _$PromotionStateCopyWithImpl<$Res, _$PromotionStateImpl>
    implements _$$PromotionStateImplCopyWith<$Res> {
  __$$PromotionStateImplCopyWithImpl(
    _$PromotionStateImpl _value,
    $Res Function(_$PromotionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? categories = null,
    Object? loading = null,
    Object? category = freezed,
    Object? categoryTemp = freezed,
    Object? query = freezed,
  }) {
    return _then(
      _$PromotionStateImpl(
        promotions:
            null == promotions
                ? _value._promotions
                : promotions // ignore: cast_nullable_to_non_nullable
                    as List<Promotion>,
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<Category>,
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category?,
        categoryTemp:
            freezed == categoryTemp
                ? _value.categoryTemp
                : categoryTemp // ignore: cast_nullable_to_non_nullable
                    as Category?,
        query:
            freezed == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$PromotionStateImpl extends _PromotionState {
  const _$PromotionStateImpl({
    final List<Promotion> promotions = const <Promotion>[],
    final List<Category> categories = const <Category>[],
    this.loading = false,
    this.category,
    this.categoryTemp,
    this.query,
  }) : _promotions = promotions,
       _categories = categories,
       super._();

  final List<Promotion> _promotions;
  @override
  @JsonKey()
  List<Promotion> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

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
  final Category? categoryTemp;
  @override
  final String? query;

  @override
  String toString() {
    return 'PromotionState(promotions: $promotions, categories: $categories, loading: $loading, category: $category, categoryTemp: $categoryTemp, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionStateImpl &&
            const DeepCollectionEquality().equals(
              other._promotions,
              _promotions,
            ) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.categoryTemp, categoryTemp) ||
                other.categoryTemp == categoryTemp) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_promotions),
    const DeepCollectionEquality().hash(_categories),
    loading,
    category,
    categoryTemp,
    query,
  );

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionStateImplCopyWith<_$PromotionStateImpl> get copyWith =>
      __$$PromotionStateImplCopyWithImpl<_$PromotionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PromotionState extends PromotionState {
  const factory _PromotionState({
    final List<Promotion> promotions,
    final List<Category> categories,
    final bool loading,
    final Category? category,
    final Category? categoryTemp,
    final String? query,
  }) = _$PromotionStateImpl;
  const _PromotionState._() : super._();

  @override
  List<Promotion> get promotions;
  @override
  List<Category> get categories;
  @override
  bool get loading;
  @override
  Category? get category;
  @override
  Category? get categoryTemp;
  @override
  String? get query;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionStateImplCopyWith<_$PromotionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
