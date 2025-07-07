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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LibraryState {
  List<Library> get library => throw _privateConstructorUsedError;
  List<Library> get mostRead => throw _privateConstructorUsedError;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryStateCopyWith<LibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryStateCopyWith<$Res> {
  factory $LibraryStateCopyWith(
    LibraryState value,
    $Res Function(LibraryState) then,
  ) = _$LibraryStateCopyWithImpl<$Res, LibraryState>;
  @useResult
  $Res call({List<Library> library, List<Library> mostRead});
}

/// @nodoc
class _$LibraryStateCopyWithImpl<$Res, $Val extends LibraryState>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? library = null, Object? mostRead = null}) {
    return _then(
      _value.copyWith(
            library:
                null == library
                    ? _value.library
                    : library // ignore: cast_nullable_to_non_nullable
                        as List<Library>,
            mostRead:
                null == mostRead
                    ? _value.mostRead
                    : mostRead // ignore: cast_nullable_to_non_nullable
                        as List<Library>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LibraryStateImplCopyWith<$Res>
    implements $LibraryStateCopyWith<$Res> {
  factory _$$LibraryStateImplCopyWith(
    _$LibraryStateImpl value,
    $Res Function(_$LibraryStateImpl) then,
  ) = __$$LibraryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Library> library, List<Library> mostRead});
}

/// @nodoc
class __$$LibraryStateImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryStateImpl>
    implements _$$LibraryStateImplCopyWith<$Res> {
  __$$LibraryStateImplCopyWithImpl(
    _$LibraryStateImpl _value,
    $Res Function(_$LibraryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? library = null, Object? mostRead = null}) {
    return _then(
      _$LibraryStateImpl(
        library:
            null == library
                ? _value._library
                : library // ignore: cast_nullable_to_non_nullable
                    as List<Library>,
        mostRead:
            null == mostRead
                ? _value._mostRead
                : mostRead // ignore: cast_nullable_to_non_nullable
                    as List<Library>,
      ),
    );
  }
}

/// @nodoc

class _$LibraryStateImpl extends _LibraryState {
  const _$LibraryStateImpl({
    final List<Library> library = const <Library>[],
    final List<Library> mostRead = const <Library>[],
  }) : _library = library,
       _mostRead = mostRead,
       super._();

  final List<Library> _library;
  @override
  @JsonKey()
  List<Library> get library {
    if (_library is EqualUnmodifiableListView) return _library;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_library);
  }

  final List<Library> _mostRead;
  @override
  @JsonKey()
  List<Library> get mostRead {
    if (_mostRead is EqualUnmodifiableListView) return _mostRead;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mostRead);
  }

  @override
  String toString() {
    return 'LibraryState(library: $library, mostRead: $mostRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryStateImpl &&
            const DeepCollectionEquality().equals(other._library, _library) &&
            const DeepCollectionEquality().equals(other._mostRead, _mostRead));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_library),
    const DeepCollectionEquality().hash(_mostRead),
  );

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      __$$LibraryStateImplCopyWithImpl<_$LibraryStateImpl>(this, _$identity);
}

abstract class _LibraryState extends LibraryState {
  const factory _LibraryState({
    final List<Library> library,
    final List<Library> mostRead,
  }) = _$LibraryStateImpl;
  const _LibraryState._() : super._();

  @override
  List<Library> get library;
  @override
  List<Library> get mostRead;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
