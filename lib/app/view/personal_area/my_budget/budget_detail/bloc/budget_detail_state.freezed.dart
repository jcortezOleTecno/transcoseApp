// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BudgetDetailState {
  bool get loading => throw _privateConstructorUsedError;
  BudgetDetail? get budgetDetails => throw _privateConstructorUsedError;
  Budget? get budget => throw _privateConstructorUsedError;
  DataTableSource? get dataBudgetDetail => throw _privateConstructorUsedError;

  /// Create a copy of BudgetDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetDetailStateCopyWith<BudgetDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetDetailStateCopyWith<$Res> {
  factory $BudgetDetailStateCopyWith(
    BudgetDetailState value,
    $Res Function(BudgetDetailState) then,
  ) = _$BudgetDetailStateCopyWithImpl<$Res, BudgetDetailState>;
  @useResult
  $Res call({
    bool loading,
    BudgetDetail? budgetDetails,
    Budget? budget,
    DataTableSource? dataBudgetDetail,
  });
}

/// @nodoc
class _$BudgetDetailStateCopyWithImpl<$Res, $Val extends BudgetDetailState>
    implements $BudgetDetailStateCopyWith<$Res> {
  _$BudgetDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budgetDetails = freezed,
    Object? budget = freezed,
    Object? dataBudgetDetail = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            budgetDetails:
                freezed == budgetDetails
                    ? _value.budgetDetails
                    : budgetDetails // ignore: cast_nullable_to_non_nullable
                        as BudgetDetail?,
            budget:
                freezed == budget
                    ? _value.budget
                    : budget // ignore: cast_nullable_to_non_nullable
                        as Budget?,
            dataBudgetDetail:
                freezed == dataBudgetDetail
                    ? _value.dataBudgetDetail
                    : dataBudgetDetail // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BudgetDetailStateImplCopyWith<$Res>
    implements $BudgetDetailStateCopyWith<$Res> {
  factory _$$BudgetDetailStateImplCopyWith(
    _$BudgetDetailStateImpl value,
    $Res Function(_$BudgetDetailStateImpl) then,
  ) = __$$BudgetDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    BudgetDetail? budgetDetails,
    Budget? budget,
    DataTableSource? dataBudgetDetail,
  });
}

/// @nodoc
class __$$BudgetDetailStateImplCopyWithImpl<$Res>
    extends _$BudgetDetailStateCopyWithImpl<$Res, _$BudgetDetailStateImpl>
    implements _$$BudgetDetailStateImplCopyWith<$Res> {
  __$$BudgetDetailStateImplCopyWithImpl(
    _$BudgetDetailStateImpl _value,
    $Res Function(_$BudgetDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budgetDetails = freezed,
    Object? budget = freezed,
    Object? dataBudgetDetail = freezed,
  }) {
    return _then(
      _$BudgetDetailStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        budgetDetails:
            freezed == budgetDetails
                ? _value.budgetDetails
                : budgetDetails // ignore: cast_nullable_to_non_nullable
                    as BudgetDetail?,
        budget:
            freezed == budget
                ? _value.budget
                : budget // ignore: cast_nullable_to_non_nullable
                    as Budget?,
        dataBudgetDetail:
            freezed == dataBudgetDetail
                ? _value.dataBudgetDetail
                : dataBudgetDetail // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
      ),
    );
  }
}

/// @nodoc

class _$BudgetDetailStateImpl extends _BudgetDetailState {
  const _$BudgetDetailStateImpl({
    this.loading = false,
    this.budgetDetails,
    this.budget,
    this.dataBudgetDetail,
  }) : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final BudgetDetail? budgetDetails;
  @override
  final Budget? budget;
  @override
  final DataTableSource? dataBudgetDetail;

  @override
  String toString() {
    return 'BudgetDetailState(loading: $loading, budgetDetails: $budgetDetails, budget: $budget, dataBudgetDetail: $dataBudgetDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetDetailStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.budgetDetails, budgetDetails) ||
                other.budgetDetails == budgetDetails) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.dataBudgetDetail, dataBudgetDetail) ||
                other.dataBudgetDetail == dataBudgetDetail));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    budgetDetails,
    budget,
    dataBudgetDetail,
  );

  /// Create a copy of BudgetDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetDetailStateImplCopyWith<_$BudgetDetailStateImpl> get copyWith =>
      __$$BudgetDetailStateImplCopyWithImpl<_$BudgetDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BudgetDetailState extends BudgetDetailState {
  const factory _BudgetDetailState({
    final bool loading,
    final BudgetDetail? budgetDetails,
    final Budget? budget,
    final DataTableSource? dataBudgetDetail,
  }) = _$BudgetDetailStateImpl;
  const _BudgetDetailState._() : super._();

  @override
  bool get loading;
  @override
  BudgetDetail? get budgetDetails;
  @override
  Budget? get budget;
  @override
  DataTableSource? get dataBudgetDetail;

  /// Create a copy of BudgetDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetDetailStateImplCopyWith<_$BudgetDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
