// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pills_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PillsState {
  List<Pills> get pills => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PillsStateCopyWith<PillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PillsStateCopyWith<$Res> {
  factory $PillsStateCopyWith(
          PillsState value, $Res Function(PillsState) then) =
      _$PillsStateCopyWithImpl<$Res, PillsState>;
  @useResult
  $Res call({List<Pills> pills});
}

/// @nodoc
class _$PillsStateCopyWithImpl<$Res, $Val extends PillsState>
    implements $PillsStateCopyWith<$Res> {
  _$PillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pills = null,
  }) {
    return _then(_value.copyWith(
      pills: null == pills
          ? _value.pills
          : pills // ignore: cast_nullable_to_non_nullable
              as List<Pills>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PillsStateCopyWith<$Res>
    implements $PillsStateCopyWith<$Res> {
  factory _$$_PillsStateCopyWith(
          _$_PillsState value, $Res Function(_$_PillsState) then) =
      __$$_PillsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pills> pills});
}

/// @nodoc
class __$$_PillsStateCopyWithImpl<$Res>
    extends _$PillsStateCopyWithImpl<$Res, _$_PillsState>
    implements _$$_PillsStateCopyWith<$Res> {
  __$$_PillsStateCopyWithImpl(
      _$_PillsState _value, $Res Function(_$_PillsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pills = null,
  }) {
    return _then(_$_PillsState(
      pills: null == pills
          ? _value._pills
          : pills // ignore: cast_nullable_to_non_nullable
              as List<Pills>,
    ));
  }
}

/// @nodoc

class _$_PillsState extends _PillsState {
  const _$_PillsState({final List<Pills> pills = const <Pills>[]})
      : _pills = pills,
        super._();

  final List<Pills> _pills;
  @override
  @JsonKey()
  List<Pills> get pills {
    if (_pills is EqualUnmodifiableListView) return _pills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pills);
  }

  @override
  String toString() {
    return 'PillsState(pills: $pills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PillsState &&
            const DeepCollectionEquality().equals(other._pills, _pills));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PillsStateCopyWith<_$_PillsState> get copyWith =>
      __$$_PillsStateCopyWithImpl<_$_PillsState>(this, _$identity);
}

abstract class _PillsState extends PillsState {
  const factory _PillsState({final List<Pills> pills}) = _$_PillsState;
  const _PillsState._() : super._();

  @override
  List<Pills> get pills;
  @override
  @JsonKey(ignore: true)
  _$$_PillsStateCopyWith<_$_PillsState> get copyWith =>
      throw _privateConstructorUsedError;
}
