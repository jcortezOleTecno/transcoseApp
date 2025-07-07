// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_budget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BudgetState {
  bool get loading => throw _privateConstructorUsedError;
  List<Budget> get budget => throw _privateConstructorUsedError;
  String? get filters => throw _privateConstructorUsedError;
  DataTableSource? get dataBudget => throw _privateConstructorUsedError;

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetStateCopyWith<BudgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetStateCopyWith<$Res> {
  factory $BudgetStateCopyWith(
    BudgetState value,
    $Res Function(BudgetState) then,
  ) = _$BudgetStateCopyWithImpl<$Res, BudgetState>;
  @useResult
  $Res call({
    bool loading,
    List<Budget> budget,
    String? filters,
    DataTableSource? dataBudget,
  });
}

/// @nodoc
class _$BudgetStateCopyWithImpl<$Res, $Val extends BudgetState>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budget = null,
    Object? filters = freezed,
    Object? dataBudget = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            budget:
                null == budget
                    ? _value.budget
                    : budget // ignore: cast_nullable_to_non_nullable
                        as List<Budget>,
            filters:
                freezed == filters
                    ? _value.filters
                    : filters // ignore: cast_nullable_to_non_nullable
                        as String?,
            dataBudget:
                freezed == dataBudget
                    ? _value.dataBudget
                    : dataBudget // ignore: cast_nullable_to_non_nullable
                        as DataTableSource?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BudgetStateImplCopyWith<$Res>
    implements $BudgetStateCopyWith<$Res> {
  factory _$$BudgetStateImplCopyWith(
    _$BudgetStateImpl value,
    $Res Function(_$BudgetStateImpl) then,
  ) = __$$BudgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    List<Budget> budget,
    String? filters,
    DataTableSource? dataBudget,
  });
}

/// @nodoc
class __$$BudgetStateImplCopyWithImpl<$Res>
    extends _$BudgetStateCopyWithImpl<$Res, _$BudgetStateImpl>
    implements _$$BudgetStateImplCopyWith<$Res> {
  __$$BudgetStateImplCopyWithImpl(
    _$BudgetStateImpl _value,
    $Res Function(_$BudgetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budget = null,
    Object? filters = freezed,
    Object? dataBudget = freezed,
  }) {
    return _then(
      _$BudgetStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        budget:
            null == budget
                ? _value._budget
                : budget // ignore: cast_nullable_to_non_nullable
                    as List<Budget>,
        filters:
            freezed == filters
                ? _value.filters
                : filters // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataBudget:
            freezed == dataBudget
                ? _value.dataBudget
                : dataBudget // ignore: cast_nullable_to_non_nullable
                    as DataTableSource?,
      ),
    );
  }
}

/// @nodoc

class _$BudgetStateImpl extends _BudgetState {
  const _$BudgetStateImpl({
    this.loading = false,
    final List<Budget> budget = const <Budget>[],
    this.filters,
    this.dataBudget,
  }) : _budget = budget,
       super._();

  @override
  @JsonKey()
  final bool loading;
  final List<Budget> _budget;
  @override
  @JsonKey()
  List<Budget> get budget {
    if (_budget is EqualUnmodifiableListView) return _budget;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budget);
  }

  @override
  final String? filters;
  @override
  final DataTableSource? dataBudget;

  @override
  String toString() {
    return 'BudgetState(loading: $loading, budget: $budget, filters: $filters, dataBudget: $dataBudget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._budget, _budget) &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.dataBudget, dataBudget) ||
                other.dataBudget == dataBudget));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_budget),
    filters,
    dataBudget,
  );

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetStateImplCopyWith<_$BudgetStateImpl> get copyWith =>
      __$$BudgetStateImplCopyWithImpl<_$BudgetStateImpl>(this, _$identity);
}

abstract class _BudgetState extends BudgetState {
  const factory _BudgetState({
    final bool loading,
    final List<Budget> budget,
    final String? filters,
    final DataTableSource? dataBudget,
  }) = _$BudgetStateImpl;
  const _BudgetState._() : super._();

  @override
  bool get loading;
  @override
  List<Budget> get budget;
  @override
  String? get filters;
  @override
  DataTableSource? get dataBudget;

  /// Create a copy of BudgetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetStateImplCopyWith<_$BudgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
