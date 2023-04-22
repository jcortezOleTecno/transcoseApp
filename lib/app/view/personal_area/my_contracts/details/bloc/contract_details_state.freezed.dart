// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContratDetailState {
  bool get loading => throw _privateConstructorUsedError;
  bool get loadingPDF => throw _privateConstructorUsedError;
  ContratDetail? get detail => throw _privateConstructorUsedError;
  Contrats? get contract => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContratDetailStateCopyWith<ContratDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContratDetailStateCopyWith<$Res> {
  factory $ContratDetailStateCopyWith(
          ContratDetailState value, $Res Function(ContratDetailState) then) =
      _$ContratDetailStateCopyWithImpl<$Res, ContratDetailState>;
  @useResult
  $Res call(
      {bool loading,
      bool loadingPDF,
      ContratDetail? detail,
      Contrats? contract});
}

/// @nodoc
class _$ContratDetailStateCopyWithImpl<$Res, $Val extends ContratDetailState>
    implements $ContratDetailStateCopyWith<$Res> {
  _$ContratDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? loadingPDF = null,
    Object? detail = freezed,
    Object? contract = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingPDF: null == loadingPDF
          ? _value.loadingPDF
          : loadingPDF // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ContratDetail?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contrats?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContratDetailStateCopyWith<$Res>
    implements $ContratDetailStateCopyWith<$Res> {
  factory _$$_ContratDetailStateCopyWith(_$_ContratDetailState value,
          $Res Function(_$_ContratDetailState) then) =
      __$$_ContratDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool loadingPDF,
      ContratDetail? detail,
      Contrats? contract});
}

/// @nodoc
class __$$_ContratDetailStateCopyWithImpl<$Res>
    extends _$ContratDetailStateCopyWithImpl<$Res, _$_ContratDetailState>
    implements _$$_ContratDetailStateCopyWith<$Res> {
  __$$_ContratDetailStateCopyWithImpl(
      _$_ContratDetailState _value, $Res Function(_$_ContratDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? loadingPDF = null,
    Object? detail = freezed,
    Object? contract = freezed,
  }) {
    return _then(_$_ContratDetailState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingPDF: null == loadingPDF
          ? _value.loadingPDF
          : loadingPDF // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ContratDetail?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contrats?,
    ));
  }
}

/// @nodoc

class _$_ContratDetailState implements _ContratDetailState {
  const _$_ContratDetailState(
      {this.loading = false,
      this.loadingPDF = false,
      this.detail,
      this.contract});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool loadingPDF;
  @override
  final ContratDetail? detail;
  @override
  final Contrats? contract;

  @override
  String toString() {
    return 'ContratDetailState(loading: $loading, loadingPDF: $loadingPDF, detail: $detail, contract: $contract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContratDetailState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadingPDF, loadingPDF) ||
                other.loadingPDF == loadingPDF) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.contract, contract) ||
                other.contract == contract));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, loadingPDF, detail, contract);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContratDetailStateCopyWith<_$_ContratDetailState> get copyWith =>
      __$$_ContratDetailStateCopyWithImpl<_$_ContratDetailState>(
          this, _$identity);
}

abstract class _ContratDetailState implements ContratDetailState {
  const factory _ContratDetailState(
      {final bool loading,
      final bool loadingPDF,
      final ContratDetail? detail,
      final Contrats? contract}) = _$_ContratDetailState;

  @override
  bool get loading;
  @override
  bool get loadingPDF;
  @override
  ContratDetail? get detail;
  @override
  Contrats? get contract;
  @override
  @JsonKey(ignore: true)
  _$$_ContratDetailStateCopyWith<_$_ContratDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
