// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LibraryState {
  List<Library> get library => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryStateCopyWith<LibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryStateCopyWith<$Res> {
  factory $LibraryStateCopyWith(
          LibraryState value, $Res Function(LibraryState) then) =
      _$LibraryStateCopyWithImpl<$Res, LibraryState>;
  @useResult
  $Res call({List<Library> library});
}

/// @nodoc
class _$LibraryStateCopyWithImpl<$Res, $Val extends LibraryState>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? library = null,
  }) {
    return _then(_value.copyWith(
      library: null == library
          ? _value.library
          : library // ignore: cast_nullable_to_non_nullable
              as List<Library>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LibraryStateCopyWith<$Res>
    implements $LibraryStateCopyWith<$Res> {
  factory _$$_LibraryStateCopyWith(
          _$_LibraryState value, $Res Function(_$_LibraryState) then) =
      __$$_LibraryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Library> library});
}

/// @nodoc
class __$$_LibraryStateCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$_LibraryState>
    implements _$$_LibraryStateCopyWith<$Res> {
  __$$_LibraryStateCopyWithImpl(
      _$_LibraryState _value, $Res Function(_$_LibraryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? library = null,
  }) {
    return _then(_$_LibraryState(
      library: null == library
          ? _value._library
          : library // ignore: cast_nullable_to_non_nullable
              as List<Library>,
    ));
  }
}

/// @nodoc

class _$_LibraryState extends _LibraryState {
  const _$_LibraryState({final List<Library> library = const <Library>[]})
      : _library = library,
        super._();

  final List<Library> _library;
  @override
  @JsonKey()
  List<Library> get library {
    if (_library is EqualUnmodifiableListView) return _library;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_library);
  }

  @override
  String toString() {
    return 'LibraryState(library: $library)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LibraryState &&
            const DeepCollectionEquality().equals(other._library, _library));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_library));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LibraryStateCopyWith<_$_LibraryState> get copyWith =>
      __$$_LibraryStateCopyWithImpl<_$_LibraryState>(this, _$identity);
}

abstract class _LibraryState extends LibraryState {
  const factory _LibraryState({final List<Library> library}) = _$_LibraryState;
  const _LibraryState._() : super._();

  @override
  List<Library> get library;
  @override
  @JsonKey(ignore: true)
  _$$_LibraryStateCopyWith<_$_LibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}
