// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_with_us_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkWithUsState {
  FormStatus get status => throw _privateConstructorUsedError;
  Name? get name => throw _privateConstructorUsedError;
  Phone? get phone => throw _privateConstructorUsedError;
  Email? get email => throw _privateConstructorUsedError;
  File? get doc => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkWithUsStateCopyWith<WorkWithUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkWithUsStateCopyWith<$Res> {
  factory $WorkWithUsStateCopyWith(
          WorkWithUsState value, $Res Function(WorkWithUsState) then) =
      _$WorkWithUsStateCopyWithImpl<$Res, WorkWithUsState>;
  @useResult
  $Res call(
      {FormStatus status,
      Name? name,
      Phone? phone,
      Email? email,
      File? doc,
      String? message});
}

/// @nodoc
class _$WorkWithUsStateCopyWithImpl<$Res, $Val extends WorkWithUsState>
    implements $WorkWithUsStateCopyWith<$Res> {
  _$WorkWithUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? doc = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as File?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkWithUsStateCopyWith<$Res>
    implements $WorkWithUsStateCopyWith<$Res> {
  factory _$$_WorkWithUsStateCopyWith(
          _$_WorkWithUsState value, $Res Function(_$_WorkWithUsState) then) =
      __$$_WorkWithUsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Name? name,
      Phone? phone,
      Email? email,
      File? doc,
      String? message});
}

/// @nodoc
class __$$_WorkWithUsStateCopyWithImpl<$Res>
    extends _$WorkWithUsStateCopyWithImpl<$Res, _$_WorkWithUsState>
    implements _$$_WorkWithUsStateCopyWith<$Res> {
  __$$_WorkWithUsStateCopyWithImpl(
      _$_WorkWithUsState _value, $Res Function(_$_WorkWithUsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? doc = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_WorkWithUsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as File?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_WorkWithUsState extends _WorkWithUsState {
  const _$_WorkWithUsState(
      {this.status = FormStatus.editing,
      this.name,
      this.phone,
      this.email,
      this.doc,
      this.message})
      : super._();

  @override
  @JsonKey()
  final FormStatus status;
  @override
  final Name? name;
  @override
  final Phone? phone;
  @override
  final Email? email;
  @override
  final File? doc;
  @override
  final String? message;

  @override
  String toString() {
    return 'WorkWithUsState(status: $status, name: $name, phone: $phone, email: $email, doc: $doc, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkWithUsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.doc, doc) || other.doc == doc) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, name, phone, email, doc, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkWithUsStateCopyWith<_$_WorkWithUsState> get copyWith =>
      __$$_WorkWithUsStateCopyWithImpl<_$_WorkWithUsState>(this, _$identity);
}

abstract class _WorkWithUsState extends WorkWithUsState {
  const factory _WorkWithUsState(
      {final FormStatus status,
      final Name? name,
      final Phone? phone,
      final Email? email,
      final File? doc,
      final String? message}) = _$_WorkWithUsState;
  const _WorkWithUsState._() : super._();

  @override
  FormStatus get status;
  @override
  Name? get name;
  @override
  Phone? get phone;
  @override
  Email? get email;
  @override
  File? get doc;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_WorkWithUsStateCopyWith<_$_WorkWithUsState> get copyWith =>
      throw _privateConstructorUsedError;
}
