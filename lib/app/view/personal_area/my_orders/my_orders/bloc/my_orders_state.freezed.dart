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
  $Res call({bool loading, List<Warranty> guarantee});
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
  $Res call({bool loading, List<Warranty> guarantee});
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
    ));
  }
}

/// @nodoc

class _$_MyOrdersState extends _MyOrdersState {
  const _$_MyOrdersState(
      {this.loading = false,
      final List<Warranty> guarantee = const <Warranty>[]})
      : _guarantee = guarantee,
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

  @override
  String toString() {
    return 'MyOrdersState(loading: $loading, guarantee: $guarantee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyOrdersState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._guarantee, _guarantee));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_guarantee));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyOrdersStateCopyWith<_$_MyOrdersState> get copyWith =>
      __$$_MyOrdersStateCopyWithImpl<_$_MyOrdersState>(this, _$identity);
}

abstract class _MyOrdersState extends MyOrdersState {
  const factory _MyOrdersState(
      {final bool loading, final List<Warranty> guarantee}) = _$_MyOrdersState;
  const _MyOrdersState._() : super._();

  @override
  bool get loading;
  @override
  List<Warranty> get guarantee;
  @override
  @JsonKey(ignore: true)
  _$$_MyOrdersStateCopyWith<_$_MyOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
