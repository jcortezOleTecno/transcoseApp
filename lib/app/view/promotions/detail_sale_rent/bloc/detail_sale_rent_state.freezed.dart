// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_sale_rent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailSaleRentState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isTienda => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get adds => throw _privateConstructorUsedError;
  Promotion? get promotion => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailSaleRentStateCopyWith<DetailSaleRentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailSaleRentStateCopyWith<$Res> {
  factory $DetailSaleRentStateCopyWith(
          DetailSaleRentState value, $Res Function(DetailSaleRentState) then) =
      _$DetailSaleRentStateCopyWithImpl<$Res, DetailSaleRentState>;
  @useResult
  $Res call(
      {bool loading,
      bool isTienda,
      int quantity,
      int adds,
      Promotion? promotion,
      String? message});
}

/// @nodoc
class _$DetailSaleRentStateCopyWithImpl<$Res, $Val extends DetailSaleRentState>
    implements $DetailSaleRentStateCopyWith<$Res> {
  _$DetailSaleRentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isTienda = null,
    Object? quantity = null,
    Object? adds = null,
    Object? promotion = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTienda: null == isTienda
          ? _value.isTienda
          : isTienda // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      adds: null == adds
          ? _value.adds
          : adds // ignore: cast_nullable_to_non_nullable
              as int,
      promotion: freezed == promotion
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as Promotion?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailSaleRentStateCopyWith<$Res>
    implements $DetailSaleRentStateCopyWith<$Res> {
  factory _$$_DetailSaleRentStateCopyWith(_$_DetailSaleRentState value,
          $Res Function(_$_DetailSaleRentState) then) =
      __$$_DetailSaleRentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isTienda,
      int quantity,
      int adds,
      Promotion? promotion,
      String? message});
}

/// @nodoc
class __$$_DetailSaleRentStateCopyWithImpl<$Res>
    extends _$DetailSaleRentStateCopyWithImpl<$Res, _$_DetailSaleRentState>
    implements _$$_DetailSaleRentStateCopyWith<$Res> {
  __$$_DetailSaleRentStateCopyWithImpl(_$_DetailSaleRentState _value,
      $Res Function(_$_DetailSaleRentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isTienda = null,
    Object? quantity = null,
    Object? adds = null,
    Object? promotion = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_DetailSaleRentState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTienda: null == isTienda
          ? _value.isTienda
          : isTienda // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      adds: null == adds
          ? _value.adds
          : adds // ignore: cast_nullable_to_non_nullable
              as int,
      promotion: freezed == promotion
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as Promotion?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DetailSaleRentState extends _DetailSaleRentState {
  const _$_DetailSaleRentState(
      {this.loading = false,
      this.isTienda = true,
      this.quantity = 1,
      this.adds = 1,
      this.promotion,
      this.message})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isTienda;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int adds;
  @override
  final Promotion? promotion;
  @override
  final String? message;

  @override
  String toString() {
    return 'DetailSaleRentState(loading: $loading, isTienda: $isTienda, quantity: $quantity, adds: $adds, promotion: $promotion, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailSaleRentState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isTienda, isTienda) ||
                other.isTienda == isTienda) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.adds, adds) || other.adds == adds) &&
            (identical(other.promotion, promotion) ||
                other.promotion == promotion) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, isTienda, quantity, adds, promotion, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailSaleRentStateCopyWith<_$_DetailSaleRentState> get copyWith =>
      __$$_DetailSaleRentStateCopyWithImpl<_$_DetailSaleRentState>(
          this, _$identity);
}

abstract class _DetailSaleRentState extends DetailSaleRentState {
  const factory _DetailSaleRentState(
      {final bool loading,
      final bool isTienda,
      final int quantity,
      final int adds,
      final Promotion? promotion,
      final String? message}) = _$_DetailSaleRentState;
  const _DetailSaleRentState._() : super._();

  @override
  bool get loading;
  @override
  bool get isTienda;
  @override
  int get quantity;
  @override
  int get adds;
  @override
  Promotion? get promotion;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_DetailSaleRentStateCopyWith<_$_DetailSaleRentState> get copyWith =>
      throw _privateConstructorUsedError;
}
