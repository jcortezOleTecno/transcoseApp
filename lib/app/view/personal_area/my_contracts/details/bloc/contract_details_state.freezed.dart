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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ContratDetailState {
  bool get loading => throw _privateConstructorUsedError;
  bool get loadingPDF => throw _privateConstructorUsedError;
  ContratDetail? get detail => throw _privateConstructorUsedError;
  Contrats? get contract => throw _privateConstructorUsedError;

  /// Create a copy of ContratDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContratDetailStateCopyWith<ContratDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContratDetailStateCopyWith<$Res> {
  factory $ContratDetailStateCopyWith(
    ContratDetailState value,
    $Res Function(ContratDetailState) then,
  ) = _$ContratDetailStateCopyWithImpl<$Res, ContratDetailState>;
  @useResult
  $Res call({
    bool loading,
    bool loadingPDF,
    ContratDetail? detail,
    Contrats? contract,
  });
}

/// @nodoc
class _$ContratDetailStateCopyWithImpl<$Res, $Val extends ContratDetailState>
    implements $ContratDetailStateCopyWith<$Res> {
  _$ContratDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContratDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? loadingPDF = null,
    Object? detail = freezed,
    Object? contract = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            loadingPDF:
                null == loadingPDF
                    ? _value.loadingPDF
                    : loadingPDF // ignore: cast_nullable_to_non_nullable
                        as bool,
            detail:
                freezed == detail
                    ? _value.detail
                    : detail // ignore: cast_nullable_to_non_nullable
                        as ContratDetail?,
            contract:
                freezed == contract
                    ? _value.contract
                    : contract // ignore: cast_nullable_to_non_nullable
                        as Contrats?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContratDetailStateImplCopyWith<$Res>
    implements $ContratDetailStateCopyWith<$Res> {
  factory _$$ContratDetailStateImplCopyWith(
    _$ContratDetailStateImpl value,
    $Res Function(_$ContratDetailStateImpl) then,
  ) = __$$ContratDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    bool loadingPDF,
    ContratDetail? detail,
    Contrats? contract,
  });
}

/// @nodoc
class __$$ContratDetailStateImplCopyWithImpl<$Res>
    extends _$ContratDetailStateCopyWithImpl<$Res, _$ContratDetailStateImpl>
    implements _$$ContratDetailStateImplCopyWith<$Res> {
  __$$ContratDetailStateImplCopyWithImpl(
    _$ContratDetailStateImpl _value,
    $Res Function(_$ContratDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContratDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? loadingPDF = null,
    Object? detail = freezed,
    Object? contract = freezed,
  }) {
    return _then(
      _$ContratDetailStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        loadingPDF:
            null == loadingPDF
                ? _value.loadingPDF
                : loadingPDF // ignore: cast_nullable_to_non_nullable
                    as bool,
        detail:
            freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                    as ContratDetail?,
        contract:
            freezed == contract
                ? _value.contract
                : contract // ignore: cast_nullable_to_non_nullable
                    as Contrats?,
      ),
    );
  }
}

/// @nodoc

class _$ContratDetailStateImpl implements _ContratDetailState {
  const _$ContratDetailStateImpl({
    this.loading = false,
    this.loadingPDF = false,
    this.detail,
    this.contract,
  });

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContratDetailStateImpl &&
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

  /// Create a copy of ContratDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContratDetailStateImplCopyWith<_$ContratDetailStateImpl> get copyWith =>
      __$$ContratDetailStateImplCopyWithImpl<_$ContratDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ContratDetailState implements ContratDetailState {
  const factory _ContratDetailState({
    final bool loading,
    final bool loadingPDF,
    final ContratDetail? detail,
    final Contrats? contract,
  }) = _$ContratDetailStateImpl;

  @override
  bool get loading;
  @override
  bool get loadingPDF;
  @override
  ContratDetail? get detail;
  @override
  Contrats? get contract;

  /// Create a copy of ContratDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContratDetailStateImplCopyWith<_$ContratDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
