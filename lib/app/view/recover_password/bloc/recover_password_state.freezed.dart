// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recover_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecoverPasswordState {
  FormStatus get status => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecoverPasswordStateCopyWith<RecoverPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoverPasswordStateCopyWith<$Res> {
  factory $RecoverPasswordStateCopyWith(RecoverPasswordState value,
          $Res Function(RecoverPasswordState) then) =
      _$RecoverPasswordStateCopyWithImpl<$Res, RecoverPasswordState>;
  @useResult
  $Res call(
      {FormStatus status,
      String? email,
      String? successMessage,
      String? errorMessage});
}

/// @nodoc
class _$RecoverPasswordStateCopyWithImpl<$Res,
        $Val extends RecoverPasswordState>
    implements $RecoverPasswordStateCopyWith<$Res> {
  _$RecoverPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecoverPasswordStateCopyWith<$Res>
    implements $RecoverPasswordStateCopyWith<$Res> {
  factory _$$_RecoverPasswordStateCopyWith(_$_RecoverPasswordState value,
          $Res Function(_$_RecoverPasswordState) then) =
      __$$_RecoverPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      String? email,
      String? successMessage,
      String? errorMessage});
}

/// @nodoc
class __$$_RecoverPasswordStateCopyWithImpl<$Res>
    extends _$RecoverPasswordStateCopyWithImpl<$Res, _$_RecoverPasswordState>
    implements _$$_RecoverPasswordStateCopyWith<$Res> {
  __$$_RecoverPasswordStateCopyWithImpl(_$_RecoverPasswordState _value,
      $Res Function(_$_RecoverPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_RecoverPasswordState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RecoverPasswordState extends _RecoverPasswordState {
  const _$_RecoverPasswordState(
      {this.status = FormStatus.editing,
      this.email,
      this.successMessage,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final FormStatus status;
  @override
  final String? email;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'RecoverPasswordState(status: $status, email: $email, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecoverPasswordState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, email, successMessage, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecoverPasswordStateCopyWith<_$_RecoverPasswordState> get copyWith =>
      __$$_RecoverPasswordStateCopyWithImpl<_$_RecoverPasswordState>(
          this, _$identity);
}

abstract class _RecoverPasswordState extends RecoverPasswordState {
  const factory _RecoverPasswordState(
      {final FormStatus status,
      final String? email,
      final String? successMessage,
      final String? errorMessage}) = _$_RecoverPasswordState;
  const _RecoverPasswordState._() : super._();

  @override
  FormStatus get status;
  @override
  String? get email;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_RecoverPasswordStateCopyWith<_$_RecoverPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
