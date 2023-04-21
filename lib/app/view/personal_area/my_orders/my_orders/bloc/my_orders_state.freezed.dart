// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyOrdersState {
  bool get loading => throw _privateConstructorUsedError;
  List<Warranty> get guarantee => throw _privateConstructorUsedError;
  List<Albaran> get orders => throw _privateConstructorUsedError;
  List<Albaran> get bills => throw _privateConstructorUsedError;
  StatusWarranty? get statusWarranty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyOrdersStateCopyWith<MyOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrdersStateCopyWith<$Res> {
  factory $MyOrdersStateCopyWith(
          MyOrdersState value, $Res Function(MyOrdersState) then) =
      _$MyOrdersStateCopyWithImpl<$Res, MyOrdersState>;
  @useResult
  $Res call(
      {bool loading,
      List<Warranty> guarantee,
      List<Albaran> orders,
      List<Albaran> bills,
      StatusWarranty? statusWarranty});
}

/// @nodoc
class _$MyOrdersStateCopyWithImpl<$Res, $Val extends MyOrdersState>
    implements $MyOrdersStateCopyWith<$Res> {
  _$MyOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? guarantee = null,
    Object? orders = null,
    Object? bills = null,
    Object? statusWarranty = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      guarantee: null == guarantee
          ? _value.guarantee
          : guarantee // ignore: cast_nullable_to_non_nullable
              as List<Warranty>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Albaran>,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<Albaran>,
      statusWarranty: freezed == statusWarranty
          ? _value.statusWarranty
          : statusWarranty // ignore: cast_nullable_to_non_nullable
              as StatusWarranty?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyOrdersStateCopyWith<$Res>
    implements $MyOrdersStateCopyWith<$Res> {
  factory _$$_MyOrdersStateCopyWith(
          _$_MyOrdersState value, $Res Function(_$_MyOrdersState) then) =
      __$$_MyOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<Warranty> guarantee,
      List<Albaran> orders,
      List<Albaran> bills,
      StatusWarranty? statusWarranty});
}

/// @nodoc
class __$$_MyOrdersStateCopyWithImpl<$Res>
    extends _$MyOrdersStateCopyWithImpl<$Res, _$_MyOrdersState>
    implements _$$_MyOrdersStateCopyWith<$Res> {
  __$$_MyOrdersStateCopyWithImpl(
      _$_MyOrdersState _value, $Res Function(_$_MyOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? guarantee = null,
    Object? orders = null,
    Object? bills = null,
    Object? statusWarranty = freezed,
  }) {
    return _then(_$_MyOrdersState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      guarantee: null == guarantee
          ? _value._guarantee
          : guarantee // ignore: cast_nullable_to_non_nullable
              as List<Warranty>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Albaran>,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<Albaran>,
      statusWarranty: freezed == statusWarranty
          ? _value.statusWarranty
          : statusWarranty // ignore: cast_nullable_to_non_nullable
              as StatusWarranty?,
    ));
  }
}

/// @nodoc

class _$_MyOrdersState extends _MyOrdersState {
  const _$_MyOrdersState(
      {this.loading = false,
      final List<Warranty> guarantee = const <Warranty>[],
      final List<Albaran> orders = const <Albaran>[],
      final List<Albaran> bills = const <Albaran>[],
      this.statusWarranty})
      : _guarantee = guarantee,
        _orders = orders,
        _bills = bills,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<Warranty> _guarantee;
  @override
  @JsonKey()
  List<Warranty> get guarantee {
    if (_guarantee is EqualUnmodifiableListView) return _guarantee;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guarantee);
  }

  final List<Albaran> _orders;
  @override
  @JsonKey()
  List<Albaran> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<Albaran> _bills;
  @override
  @JsonKey()
  List<Albaran> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  @override
  final StatusWarranty? statusWarranty;

  @override
  String toString() {
    return 'MyOrdersState(loading: $loading, guarantee: $guarantee, orders: $orders, bills: $bills, statusWarranty: $statusWarranty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyOrdersState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._guarantee, _guarantee) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(other._bills, _bills) &&
            (identical(other.statusWarranty, statusWarranty) ||
                other.statusWarranty == statusWarranty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_guarantee),
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_bills),
      statusWarranty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyOrdersStateCopyWith<_$_MyOrdersState> get copyWith =>
      __$$_MyOrdersStateCopyWithImpl<_$_MyOrdersState>(this, _$identity);
}

abstract class _MyOrdersState extends MyOrdersState {
  const factory _MyOrdersState(
      {final bool loading,
      final List<Warranty> guarantee,
      final List<Albaran> orders,
      final List<Albaran> bills,
      final StatusWarranty? statusWarranty}) = _$_MyOrdersState;
  const _MyOrdersState._() : super._();

  @override
  bool get loading;
  @override
  List<Warranty> get guarantee;
  @override
  List<Albaran> get orders;
  @override
  List<Albaran> get bills;
  @override
  StatusWarranty? get statusWarranty;
  @override
  @JsonKey(ignore: true)
  _$$_MyOrdersStateCopyWith<_$_MyOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
