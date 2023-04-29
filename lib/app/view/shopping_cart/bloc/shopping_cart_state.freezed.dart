// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShoppingCardState {
  bool get loading => throw _privateConstructorUsedError;
  bool get deleting => throw _privateConstructorUsedError;
  bool get buying => throw _privateConstructorUsedError;
  bool get isCard => throw _privateConstructorUsedError;
  bool get typePaySelected => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  List<ShoppingCardProduct> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingCardStateCopyWith<ShoppingCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCardStateCopyWith<$Res> {
  factory $ShoppingCardStateCopyWith(
          ShoppingCardState value, $Res Function(ShoppingCardState) then) =
      _$ShoppingCardStateCopyWithImpl<$Res, ShoppingCardState>;
  @useResult
  $Res call(
      {bool loading,
      bool deleting,
      bool buying,
      bool isCard,
      bool typePaySelected,
      double total,
      List<ShoppingCardProduct> products});
}

/// @nodoc
class _$ShoppingCardStateCopyWithImpl<$Res, $Val extends ShoppingCardState>
    implements $ShoppingCardStateCopyWith<$Res> {
  _$ShoppingCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? deleting = null,
    Object? buying = null,
    Object? isCard = null,
    Object? typePaySelected = null,
    Object? total = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      buying: null == buying
          ? _value.buying
          : buying // ignore: cast_nullable_to_non_nullable
              as bool,
      isCard: null == isCard
          ? _value.isCard
          : isCard // ignore: cast_nullable_to_non_nullable
              as bool,
      typePaySelected: null == typePaySelected
          ? _value.typePaySelected
          : typePaySelected // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ShoppingCardProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShoppingCardStateCopyWith<$Res>
    implements $ShoppingCardStateCopyWith<$Res> {
  factory _$$_ShoppingCardStateCopyWith(_$_ShoppingCardState value,
          $Res Function(_$_ShoppingCardState) then) =
      __$$_ShoppingCardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool deleting,
      bool buying,
      bool isCard,
      bool typePaySelected,
      double total,
      List<ShoppingCardProduct> products});
}

/// @nodoc
class __$$_ShoppingCardStateCopyWithImpl<$Res>
    extends _$ShoppingCardStateCopyWithImpl<$Res, _$_ShoppingCardState>
    implements _$$_ShoppingCardStateCopyWith<$Res> {
  __$$_ShoppingCardStateCopyWithImpl(
      _$_ShoppingCardState _value, $Res Function(_$_ShoppingCardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? deleting = null,
    Object? buying = null,
    Object? isCard = null,
    Object? typePaySelected = null,
    Object? total = null,
    Object? products = null,
  }) {
    return _then(_$_ShoppingCardState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      buying: null == buying
          ? _value.buying
          : buying // ignore: cast_nullable_to_non_nullable
              as bool,
      isCard: null == isCard
          ? _value.isCard
          : isCard // ignore: cast_nullable_to_non_nullable
              as bool,
      typePaySelected: null == typePaySelected
          ? _value.typePaySelected
          : typePaySelected // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ShoppingCardProduct>,
    ));
  }
}

/// @nodoc

class _$_ShoppingCardState extends _ShoppingCardState {
  const _$_ShoppingCardState(
      {this.loading = false,
      this.deleting = false,
      this.buying = false,
      this.isCard = false,
      this.typePaySelected = false,
      this.total = 0.0,
      final List<ShoppingCardProduct> products = const <ShoppingCardProduct>[]})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool deleting;
  @override
  @JsonKey()
  final bool buying;
  @override
  @JsonKey()
  final bool isCard;
  @override
  @JsonKey()
  final bool typePaySelected;
  @override
  @JsonKey()
  final double total;
  final List<ShoppingCardProduct> _products;
  @override
  @JsonKey()
  List<ShoppingCardProduct> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ShoppingCardState(loading: $loading, deleting: $deleting, buying: $buying, isCard: $isCard, typePaySelected: $typePaySelected, total: $total, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShoppingCardState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.deleting, deleting) ||
                other.deleting == deleting) &&
            (identical(other.buying, buying) || other.buying == buying) &&
            (identical(other.isCard, isCard) || other.isCard == isCard) &&
            (identical(other.typePaySelected, typePaySelected) ||
                other.typePaySelected == typePaySelected) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      deleting,
      buying,
      isCard,
      typePaySelected,
      total,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShoppingCardStateCopyWith<_$_ShoppingCardState> get copyWith =>
      __$$_ShoppingCardStateCopyWithImpl<_$_ShoppingCardState>(
          this, _$identity);
}

abstract class _ShoppingCardState extends ShoppingCardState {
  const factory _ShoppingCardState(
      {final bool loading,
      final bool deleting,
      final bool buying,
      final bool isCard,
      final bool typePaySelected,
      final double total,
      final List<ShoppingCardProduct> products}) = _$_ShoppingCardState;
  const _ShoppingCardState._() : super._();

  @override
  bool get loading;
  @override
  bool get deleting;
  @override
  bool get buying;
  @override
  bool get isCard;
  @override
  bool get typePaySelected;
  @override
  double get total;
  @override
  List<ShoppingCardProduct> get products;
  @override
  @JsonKey(ignore: true)
  _$$_ShoppingCardStateCopyWith<_$_ShoppingCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
