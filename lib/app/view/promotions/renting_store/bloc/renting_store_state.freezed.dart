// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renting_store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RentingStoreState {
  FormStatus get status => throw _privateConstructorUsedError;
  bool get tarjeta => throw _privateConstructorUsedError;
  StoreArgs? get arg => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  PayResponse? get payResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RentingStoreStateCopyWith<RentingStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentingStoreStateCopyWith<$Res> {
  factory $RentingStoreStateCopyWith(
          RentingStoreState value, $Res Function(RentingStoreState) then) =
      _$RentingStoreStateCopyWithImpl<$Res, RentingStoreState>;
  @useResult
  $Res call(
      {FormStatus status,
      bool tarjeta,
      StoreArgs? arg,
      String? type,
      PayResponse? payResponse});
}

/// @nodoc
class _$RentingStoreStateCopyWithImpl<$Res, $Val extends RentingStoreState>
    implements $RentingStoreStateCopyWith<$Res> {
  _$RentingStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tarjeta = null,
    Object? arg = freezed,
    Object? type = freezed,
    Object? payResponse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      tarjeta: null == tarjeta
          ? _value.tarjeta
          : tarjeta // ignore: cast_nullable_to_non_nullable
              as bool,
      arg: freezed == arg
          ? _value.arg
          : arg // ignore: cast_nullable_to_non_nullable
              as StoreArgs?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      payResponse: freezed == payResponse
          ? _value.payResponse
          : payResponse // ignore: cast_nullable_to_non_nullable
              as PayResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RentingStoreStateCopyWith<$Res>
    implements $RentingStoreStateCopyWith<$Res> {
  factory _$$_RentingStoreStateCopyWith(_$_RentingStoreState value,
          $Res Function(_$_RentingStoreState) then) =
      __$$_RentingStoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      bool tarjeta,
      StoreArgs? arg,
      String? type,
      PayResponse? payResponse});
}

/// @nodoc
class __$$_RentingStoreStateCopyWithImpl<$Res>
    extends _$RentingStoreStateCopyWithImpl<$Res, _$_RentingStoreState>
    implements _$$_RentingStoreStateCopyWith<$Res> {
  __$$_RentingStoreStateCopyWithImpl(
      _$_RentingStoreState _value, $Res Function(_$_RentingStoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tarjeta = null,
    Object? arg = freezed,
    Object? type = freezed,
    Object? payResponse = freezed,
  }) {
    return _then(_$_RentingStoreState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      tarjeta: null == tarjeta
          ? _value.tarjeta
          : tarjeta // ignore: cast_nullable_to_non_nullable
              as bool,
      arg: freezed == arg
          ? _value.arg
          : arg // ignore: cast_nullable_to_non_nullable
              as StoreArgs?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      payResponse: freezed == payResponse
          ? _value.payResponse
          : payResponse // ignore: cast_nullable_to_non_nullable
              as PayResponse?,
    ));
  }
}

/// @nodoc

class _$_RentingStoreState extends _RentingStoreState {
  const _$_RentingStoreState(
      {this.status = FormStatus.editing,
      this.tarjeta = true,
      this.arg,
      this.type,
      this.payResponse})
      : super._();

  @override
  @JsonKey()
  final FormStatus status;
  @override
  @JsonKey()
  final bool tarjeta;
  @override
  final StoreArgs? arg;
  @override
  final String? type;
  @override
  final PayResponse? payResponse;

  @override
  String toString() {
    return 'RentingStoreState(status: $status, tarjeta: $tarjeta, arg: $arg, type: $type, payResponse: $payResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RentingStoreState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tarjeta, tarjeta) || other.tarjeta == tarjeta) &&
            (identical(other.arg, arg) || other.arg == arg) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.payResponse, payResponse) ||
                other.payResponse == payResponse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, tarjeta, arg, type, payResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RentingStoreStateCopyWith<_$_RentingStoreState> get copyWith =>
      __$$_RentingStoreStateCopyWithImpl<_$_RentingStoreState>(
          this, _$identity);
}

abstract class _RentingStoreState extends RentingStoreState {
  const factory _RentingStoreState(
      {final FormStatus status,
      final bool tarjeta,
      final StoreArgs? arg,
      final String? type,
      final PayResponse? payResponse}) = _$_RentingStoreState;
  const _RentingStoreState._() : super._();

  @override
  FormStatus get status;
  @override
  bool get tarjeta;
  @override
  StoreArgs? get arg;
  @override
  String? get type;
  @override
  PayResponse? get payResponse;
  @override
  @JsonKey(ignore: true)
  _$$_RentingStoreStateCopyWith<_$_RentingStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
