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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PromotionsState {
  List<Category> get categories => throw _privateConstructorUsedError;
  Category? get categorySelected => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  List<Promotion> get promotions => throw _privateConstructorUsedError;
  Header? get header => throw _privateConstructorUsedError;

  /// Create a copy of PromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionsStateCopyWith<PromotionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionsStateCopyWith<$Res> {
  factory $PromotionsStateCopyWith(
    PromotionsState value,
    $Res Function(PromotionsState) then,
  ) = _$PromotionsStateCopyWithImpl<$Res, PromotionsState>;
  @useResult
  $Res call({
    List<Category> categories,
    Category? categorySelected,
    String? query,
    List<Promotion> promotions,
    Header? header,
  });
}

/// @nodoc
class _$PromotionsStateCopyWithImpl<$Res, $Val extends PromotionsState>
    implements $PromotionsStateCopyWith<$Res> {
  _$PromotionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categorySelected = freezed,
    Object? query = freezed,
    Object? promotions = null,
    Object? header = freezed,
  }) {
    return _then(
      _value.copyWith(
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<Category>,
            categorySelected:
                freezed == categorySelected
                    ? _value.categorySelected
                    : categorySelected // ignore: cast_nullable_to_non_nullable
                        as Category?,
            query:
                freezed == query
                    ? _value.query
                    : query // ignore: cast_nullable_to_non_nullable
                        as String?,
            promotions:
                null == promotions
                    ? _value.promotions
                    : promotions // ignore: cast_nullable_to_non_nullable
                        as List<Promotion>,
            header:
                freezed == header
                    ? _value.header
                    : header // ignore: cast_nullable_to_non_nullable
                        as Header?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromotionsStateImplCopyWith<$Res>
    implements $PromotionsStateCopyWith<$Res> {
  factory _$$PromotionsStateImplCopyWith(
    _$PromotionsStateImpl value,
    $Res Function(_$PromotionsStateImpl) then,
  ) = __$$PromotionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Category> categories,
    Category? categorySelected,
    String? query,
    List<Promotion> promotions,
    Header? header,
  });
}

/// @nodoc
class __$$PromotionsStateImplCopyWithImpl<$Res>
    extends _$PromotionsStateCopyWithImpl<$Res, _$PromotionsStateImpl>
    implements _$$PromotionsStateImplCopyWith<$Res> {
  __$$PromotionsStateImplCopyWithImpl(
    _$PromotionsStateImpl _value,
    $Res Function(_$PromotionsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categorySelected = freezed,
    Object? query = freezed,
    Object? promotions = null,
    Object? header = freezed,
  }) {
    return _then(
      _$PromotionsStateImpl(
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<Category>,
        categorySelected:
            freezed == categorySelected
                ? _value.categorySelected
                : categorySelected // ignore: cast_nullable_to_non_nullable
                    as Category?,
        query:
            freezed == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String?,
        promotions:
            null == promotions
                ? _value._promotions
                : promotions // ignore: cast_nullable_to_non_nullable
                    as List<Promotion>,
        header:
            freezed == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                    as Header?,
      ),
    );
  }
}

/// @nodoc

class _$PromotionsStateImpl extends _PromotionsState {
  const _$PromotionsStateImpl({
    final List<Category> categories = const <Category>[],
    this.categorySelected,
    this.query,
    final List<Promotion> promotions = const <Promotion>[],
    this.header,
  }) : _categories = categories,
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
  final Header? header;

  @override
  String toString() {
    return 'PromotionsState(categories: $categories, categorySelected: $categorySelected, query: $query, promotions: $promotions, header: $header)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionsStateImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.categorySelected, categorySelected) ||
                other.categorySelected == categorySelected) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(
              other._promotions,
              _promotions,
            ) &&
            (identical(other.header, header) || other.header == header));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    categorySelected,
    query,
    const DeepCollectionEquality().hash(_promotions),
    header,
  );

  /// Create a copy of PromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionsStateImplCopyWith<_$PromotionsStateImpl> get copyWith =>
      __$$PromotionsStateImplCopyWithImpl<_$PromotionsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PromotionsState extends PromotionsState {
  const factory _PromotionsState({
    final List<Category> categories,
    final Category? categorySelected,
    final String? query,
    final List<Promotion> promotions,
    final Header? header,
  }) = _$PromotionsStateImpl;
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
  Header? get header;

  /// Create a copy of PromotionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionsStateImplCopyWith<_$PromotionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
