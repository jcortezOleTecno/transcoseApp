// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserState {
  List<Employee> get employees => throw _privateConstructorUsedError;
  List<Enterprise> get enterprises => throw _privateConstructorUsedError;
  VemareContacts? get contacts => throw _privateConstructorUsedError;
  UserData? get user => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({
    List<Employee> employees,
    List<Enterprise> enterprises,
    VemareContacts? contacts,
    UserData? user,
  });
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
    Object? enterprises = null,
    Object? contacts = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            employees:
                null == employees
                    ? _value.employees
                    : employees // ignore: cast_nullable_to_non_nullable
                        as List<Employee>,
            enterprises:
                null == enterprises
                    ? _value.enterprises
                    : enterprises // ignore: cast_nullable_to_non_nullable
                        as List<Enterprise>,
            contacts:
                freezed == contacts
                    ? _value.contacts
                    : contacts // ignore: cast_nullable_to_non_nullable
                        as VemareContacts?,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserData?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
    _$UserStateImpl value,
    $Res Function(_$UserStateImpl) then,
  ) = __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Employee> employees,
    List<Enterprise> enterprises,
    VemareContacts? contacts,
    UserData? user,
  });
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
    _$UserStateImpl _value,
    $Res Function(_$UserStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
    Object? enterprises = null,
    Object? contacts = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _$UserStateImpl(
        employees:
            null == employees
                ? _value._employees
                : employees // ignore: cast_nullable_to_non_nullable
                    as List<Employee>,
        enterprises:
            null == enterprises
                ? _value._enterprises
                : enterprises // ignore: cast_nullable_to_non_nullable
                    as List<Enterprise>,
        contacts:
            freezed == contacts
                ? _value.contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                    as VemareContacts?,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserData?,
      ),
    );
  }
}

/// @nodoc

class _$UserStateImpl extends _UserState {
  const _$UserStateImpl({
    final List<Employee> employees = const <Employee>[],
    final List<Enterprise> enterprises = const <Enterprise>[],
    this.contacts,
    this.user,
  }) : _employees = employees,
       _enterprises = enterprises,
       super._();

  final List<Employee> _employees;
  @override
  @JsonKey()
  List<Employee> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  final List<Enterprise> _enterprises;
  @override
  @JsonKey()
  List<Enterprise> get enterprises {
    if (_enterprises is EqualUnmodifiableListView) return _enterprises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enterprises);
  }

  @override
  final VemareContacts? contacts;
  @override
  final UserData? user;

  @override
  String toString() {
    return 'UserState(employees: $employees, enterprises: $enterprises, contacts: $contacts, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            const DeepCollectionEquality().equals(
              other._employees,
              _employees,
            ) &&
            const DeepCollectionEquality().equals(
              other._enterprises,
              _enterprises,
            ) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_employees),
    const DeepCollectionEquality().hash(_enterprises),
    contacts,
    user,
  );

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState extends UserState {
  const factory _UserState({
    final List<Employee> employees,
    final List<Enterprise> enterprises,
    final VemareContacts? contacts,
    final UserData? user,
  }) = _$UserStateImpl;
  const _UserState._() : super._();

  @override
  List<Employee> get employees;
  @override
  List<Enterprise> get enterprises;
  @override
  VemareContacts? get contacts;
  @override
  UserData? get user;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
