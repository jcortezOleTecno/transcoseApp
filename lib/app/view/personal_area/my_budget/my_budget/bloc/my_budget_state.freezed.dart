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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetState {
  bool get loading => throw _privateConstructorUsedError;
  List<Budget> get budget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetStateCopyWith<BudgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetStateCopyWith<$Res> {
  factory $BudgetStateCopyWith(
          BudgetState value, $Res Function(BudgetState) then) =
      _$BudgetStateCopyWithImpl<$Res, BudgetState>;
  @useResult
  $Res call({bool loading, List<Budget> budget});
}

/// @nodoc
class _$BudgetStateCopyWithImpl<$Res, $Val extends BudgetState>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budget = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BudgetStateCopyWith<$Res>
    implements $BudgetStateCopyWith<$Res> {
  factory _$$_BudgetStateCopyWith(
          _$_BudgetState value, $Res Function(_$_BudgetState) then) =
      __$$_BudgetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Budget> budget});
}

/// @nodoc
class __$$_BudgetStateCopyWithImpl<$Res>
    extends _$BudgetStateCopyWithImpl<$Res, _$_BudgetState>
    implements _$$_BudgetStateCopyWith<$Res> {
  __$$_BudgetStateCopyWithImpl(
      _$_BudgetState _value, $Res Function(_$_BudgetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? budget = null,
  }) {
    return _then(_$_BudgetState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      budget: null == budget
          ? _value._budget
          : budget // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
    ));
  }
}

/// @nodoc

class _$_BudgetState extends _BudgetState {
  const _$_BudgetState(
      {this.loading = false, final List<Budget> budget = const <Budget>[]})
      : _budget = budget,
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
  String toString() {
    return 'BudgetState(loading: $loading, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._budget, _budget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_budget));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetStateCopyWith<_$_BudgetState> get copyWith =>
      __$$_BudgetStateCopyWithImpl<_$_BudgetState>(this, _$identity);
}

abstract class _BudgetState extends BudgetState {
  const factory _BudgetState({final bool loading, final List<Budget> budget}) =
      _$_BudgetState;
  const _BudgetState._() : super._();

  @override
  bool get loading;
  @override
  List<Budget> get budget;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetStateCopyWith<_$_BudgetState> get copyWith =>
      throw _privateConstructorUsedError;
}
