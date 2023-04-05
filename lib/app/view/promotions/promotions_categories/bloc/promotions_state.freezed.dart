// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PromotionsState {
  List<Category> get categories => throw _privateConstructorUsedError;
  Category? get categorySelected => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  List<Promotion> get promotions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PromotionsStateCopyWith<PromotionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionsStateCopyWith<$Res> {
  factory $PromotionsStateCopyWith(
          PromotionsState value, $Res Function(PromotionsState) then) =
      _$PromotionsStateCopyWithImpl<$Res, PromotionsState>;
  @useResult
  $Res call(
      {List<Category> categories,
      Category? categorySelected,
      String? query,
      List<Promotion> promotions});
}

/// @nodoc
class _$PromotionsStateCopyWithImpl<$Res, $Val extends PromotionsState>
    implements $PromotionsStateCopyWith<$Res> {
  _$PromotionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categorySelected = freezed,
    Object? query = freezed,
    Object? promotions = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      categorySelected: freezed == categorySelected
          ? _value.categorySelected
          : categorySelected // ignore: cast_nullable_to_non_nullable
              as Category?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<Promotion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromotionsStateCopyWith<$Res>
    implements $PromotionsStateCopyWith<$Res> {
  factory _$$_PromotionsStateCopyWith(
          _$_PromotionsState value, $Res Function(_$_PromotionsState) then) =
      __$$_PromotionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categories,
      Category? categorySelected,
      String? query,
      List<Promotion> promotions});
}

/// @nodoc
class __$$_PromotionsStateCopyWithImpl<$Res>
    extends _$PromotionsStateCopyWithImpl<$Res, _$_PromotionsState>
    implements _$$_PromotionsStateCopyWith<$Res> {
  __$$_PromotionsStateCopyWithImpl(
      _$_PromotionsState _value, $Res Function(_$_PromotionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categorySelected = freezed,
    Object? query = freezed,
    Object? promotions = null,
  }) {
    return _then(_$_PromotionsState(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      categorySelected: freezed == categorySelected
          ? _value.categorySelected
          : categorySelected // ignore: cast_nullable_to_non_nullable
              as Category?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      promotions: null == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<Promotion>,
    ));
  }
}

/// @nodoc

class _$_PromotionsState extends _PromotionsState {
  const _$_PromotionsState(
      {final List<Category> categories = const <Category>[],
      this.categorySelected,
      this.query,
      final List<Promotion> promotions = const <Promotion>[]})
      : _categories = categories,
        _promotions = promotions,
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
  final Category? categorySelected;
  @override
  final String? query;
  final List<Promotion> _promotions;
  @override
  @JsonKey()
  List<Promotion> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  @override
  String toString() {
    return 'PromotionsState(categories: $categories, categorySelected: $categorySelected, query: $query, promotions: $promotions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromotionsState &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.categorySelected, categorySelected) ||
                other.categorySelected == categorySelected) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      categorySelected,
      query,
      const DeepCollectionEquality().hash(_promotions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromotionsStateCopyWith<_$_PromotionsState> get copyWith =>
      __$$_PromotionsStateCopyWithImpl<_$_PromotionsState>(this, _$identity);
}

abstract class _PromotionsState extends PromotionsState {
  const factory _PromotionsState(
      {final List<Category> categories,
      final Category? categorySelected,
      final String? query,
      final List<Promotion> promotions}) = _$_PromotionsState;
  const _PromotionsState._() : super._();

  @override
  List<Category> get categories;
  @override
  Category? get categorySelected;
  @override
  String? get query;
  @override
  List<Promotion> get promotions;
  @override
  @JsonKey(ignore: true)
  _$$_PromotionsStateCopyWith<_$_PromotionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
