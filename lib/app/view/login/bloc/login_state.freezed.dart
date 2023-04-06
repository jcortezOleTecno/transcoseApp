// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  FormStatus get status => throw _privateConstructorUsedError;
  bool get rememberData => throw _privateConstructorUsedError;
  String? get msgError => throw _privateConstructorUsedError;
  String? get msgGoBack => throw _privateConstructorUsedError;
  String? get initialEmail => throw _privateConstructorUsedError;
  String? get initialPassword => throw _privateConstructorUsedError;
  Email? get email => throw _privateConstructorUsedError;
  Password? get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {FormStatus status,
      bool rememberData,
      String? msgError,
      String? msgGoBack,
      String? initialEmail,
      String? initialPassword,
      Email? email,
      Password? password});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? rememberData = null,
    Object? msgError = freezed,
    Object? msgGoBack = freezed,
    Object? initialEmail = freezed,
    Object? initialPassword = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      rememberData: null == rememberData
          ? _value.rememberData
          : rememberData // ignore: cast_nullable_to_non_nullable
              as bool,
      msgError: freezed == msgError
          ? _value.msgError
          : msgError // ignore: cast_nullable_to_non_nullable
              as String?,
      msgGoBack: freezed == msgGoBack
          ? _value.msgGoBack
          : msgGoBack // ignore: cast_nullable_to_non_nullable
              as String?,
      initialEmail: freezed == initialEmail
          ? _value.initialEmail
          : initialEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPassword: freezed == initialPassword
          ? _value.initialPassword
          : initialPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      bool rememberData,
      String? msgError,
      String? msgGoBack,
      String? initialEmail,
      String? initialPassword,
      Email? email,
      Password? password});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? rememberData = null,
    Object? msgError = freezed,
    Object? msgGoBack = freezed,
    Object? initialEmail = freezed,
    Object? initialPassword = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_LoginState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      rememberData: null == rememberData
          ? _value.rememberData
          : rememberData // ignore: cast_nullable_to_non_nullable
              as bool,
      msgError: freezed == msgError
          ? _value.msgError
          : msgError // ignore: cast_nullable_to_non_nullable
              as String?,
      msgGoBack: freezed == msgGoBack
          ? _value.msgGoBack
          : msgGoBack // ignore: cast_nullable_to_non_nullable
              as String?,
      initialEmail: freezed == initialEmail
          ? _value.initialEmail
          : initialEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPassword: freezed == initialPassword
          ? _value.initialPassword
          : initialPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password?,
    ));
  }
}

/// @nodoc

class _$_LoginState extends _LoginState {
  const _$_LoginState(
      {this.status = FormStatus.editing,
      this.rememberData = false,
      this.msgError,
      this.msgGoBack,
      this.initialEmail,
      this.initialPassword,
      this.email,
      this.password})
      : super._();

  @override
  @JsonKey()
  final FormStatus status;
  @override
  @JsonKey()
  final bool rememberData;
  @override
  final String? msgError;
  @override
  final String? msgGoBack;
  @override
  final String? initialEmail;
  @override
  final String? initialPassword;
  @override
  final Email? email;
  @override
  final Password? password;

  @override
  String toString() {
    return 'LoginState(status: $status, rememberData: $rememberData, msgError: $msgError, msgGoBack: $msgGoBack, initialEmail: $initialEmail, initialPassword: $initialPassword, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rememberData, rememberData) ||
                other.rememberData == rememberData) &&
            (identical(other.msgError, msgError) ||
                other.msgError == msgError) &&
            (identical(other.msgGoBack, msgGoBack) ||
                other.msgGoBack == msgGoBack) &&
            (identical(other.initialEmail, initialEmail) ||
                other.initialEmail == initialEmail) &&
            (identical(other.initialPassword, initialPassword) ||
                other.initialPassword == initialPassword) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, rememberData, msgError,
      msgGoBack, initialEmail, initialPassword, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const factory _LoginState(
      {final FormStatus status,
      final bool rememberData,
      final String? msgError,
      final String? msgGoBack,
      final String? initialEmail,
      final String? initialPassword,
      final Email? email,
      final Password? password}) = _$_LoginState;
  const _LoginState._() : super._();

  @override
  FormStatus get status;
  @override
  bool get rememberData;
  @override
  String? get msgError;
  @override
  String? get msgGoBack;
  @override
  String? get initialEmail;
  @override
  String? get initialPassword;
  @override
  Email? get email;
  @override
  Password? get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
