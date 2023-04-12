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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetDetailState {
  bool get loading => throw _privateConstructorUsedError;
  BudgetDetail? get budgetDetails => throw _privateConstructorUsedError;
  Budget? get budget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetDetailStateCopyWith<BudgetDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetDetailStateCopyWith<$Res> {
  factory $BudgetDetailStateCopyWith(
          BudgetDetailState value, $Res Function(BudgetDetailState) then) =
      _$BudgetDetailStateCopyWithImpl<$Res, BudgetDetailState>;
  @useResult
  $Res call({bool loading, BudgetDetail? budgetDetails, Budget? budget});
}

/// @nodoc
class _$BudgetDetailStateCopyWithImpl<$Res, $Val extends BudgetDetailState>
    implements $BudgetDetailStateCopyWith<$Res> {
  _$BudgetDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budgetDetails = freezed,
    Object? budget = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      budgetDetails: freezed == budgetDetails
          ? _value.budgetDetails
          : budgetDetails // ignore: cast_nullable_to_non_nullable
              as BudgetDetail?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BudgetDetailStateCopyWith<$Res>
    implements $BudgetDetailStateCopyWith<$Res> {
  factory _$$_BudgetDetailStateCopyWith(_$_BudgetDetailState value,
          $Res Function(_$_BudgetDetailState) then) =
      __$$_BudgetDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, BudgetDetail? budgetDetails, Budget? budget});
}

/// @nodoc
class __$$_BudgetDetailStateCopyWithImpl<$Res>
    extends _$BudgetDetailStateCopyWithImpl<$Res, _$_BudgetDetailState>
    implements _$$_BudgetDetailStateCopyWith<$Res> {
  __$$_BudgetDetailStateCopyWithImpl(
      _$_BudgetDetailState _value, $Res Function(_$_BudgetDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budgetDetails = freezed,
    Object? budget = freezed,
  }) {
    return _then(_$_BudgetDetailState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      budgetDetails: freezed == budgetDetails
          ? _value.budgetDetails
          : budgetDetails // ignore: cast_nullable_to_non_nullable
              as BudgetDetail?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget?,
    ));
  }
}

/// @nodoc

class _$_BudgetDetailState extends _BudgetDetailState {
  const _$_BudgetDetailState(
      {this.loading = false, this.budgetDetails, this.budget})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final BudgetDetail? budgetDetails;
  @override
  final Budget? budget;

  @override
  String toString() {
    return 'BudgetDetailState(loading: $loading, budgetDetails: $budgetDetails, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetDetailState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.budgetDetails, budgetDetails) ||
                other.budgetDetails == budgetDetails) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, budgetDetails, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetDetailStateCopyWith<_$_BudgetDetailState> get copyWith =>
      __$$_BudgetDetailStateCopyWithImpl<_$_BudgetDetailState>(
          this, _$identity);
}

abstract class _BudgetDetailState extends BudgetDetailState {
  const factory _BudgetDetailState(
      {final bool loading,
      final BudgetDetail? budgetDetails,
      final Budget? budget}) = _$_BudgetDetailState;
  const _BudgetDetailState._() : super._();

  @override
  bool get loading;
  @override
  BudgetDetail? get budgetDetails;
  @override
  Budget? get budget;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetDetailStateCopyWith<_$_BudgetDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
