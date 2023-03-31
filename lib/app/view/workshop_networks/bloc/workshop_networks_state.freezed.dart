// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workshop_networks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkshopNetworksState {
  WorkShop? get workShop => throw _privateConstructorUsedError;
  FormStatus get status => throw _privateConstructorUsedError;
  List<WorkShop> get workShops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkshopNetworksStateCopyWith<WorkshopNetworksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkshopNetworksStateCopyWith<$Res> {
  factory $WorkshopNetworksStateCopyWith(WorkshopNetworksState value,
          $Res Function(WorkshopNetworksState) then) =
      _$WorkshopNetworksStateCopyWithImpl<$Res, WorkshopNetworksState>;
  @useResult
  $Res call({WorkShop? workShop, FormStatus status, List<WorkShop> workShops});
}

/// @nodoc
class _$WorkshopNetworksStateCopyWithImpl<$Res,
        $Val extends WorkshopNetworksState>
    implements $WorkshopNetworksStateCopyWith<$Res> {
  _$WorkshopNetworksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workShop = freezed,
    Object? status = null,
    Object? workShops = null,
  }) {
    return _then(_value.copyWith(
      workShop: freezed == workShop
          ? _value.workShop
          : workShop // ignore: cast_nullable_to_non_nullable
              as WorkShop?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      workShops: null == workShops
          ? _value.workShops
          : workShops // ignore: cast_nullable_to_non_nullable
              as List<WorkShop>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkshopNetworksStateCopyWith<$Res>
    implements $WorkshopNetworksStateCopyWith<$Res> {
  factory _$$_WorkshopNetworksStateCopyWith(_$_WorkshopNetworksState value,
          $Res Function(_$_WorkshopNetworksState) then) =
      __$$_WorkshopNetworksStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkShop? workShop, FormStatus status, List<WorkShop> workShops});
}

/// @nodoc
class __$$_WorkshopNetworksStateCopyWithImpl<$Res>
    extends _$WorkshopNetworksStateCopyWithImpl<$Res, _$_WorkshopNetworksState>
    implements _$$_WorkshopNetworksStateCopyWith<$Res> {
  __$$_WorkshopNetworksStateCopyWithImpl(_$_WorkshopNetworksState _value,
      $Res Function(_$_WorkshopNetworksState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workShop = freezed,
    Object? status = null,
    Object? workShops = null,
  }) {
    return _then(_$_WorkshopNetworksState(
      workShop: freezed == workShop
          ? _value.workShop
          : workShop // ignore: cast_nullable_to_non_nullable
              as WorkShop?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      workShops: null == workShops
          ? _value._workShops
          : workShops // ignore: cast_nullable_to_non_nullable
              as List<WorkShop>,
    ));
  }
}

/// @nodoc

class _$_WorkshopNetworksState extends _WorkshopNetworksState {
  const _$_WorkshopNetworksState(
      {this.workShop,
      this.status = FormStatus.editing,
      final List<WorkShop> workShops = const <WorkShop>[]})
      : _workShops = workShops,
        super._();

  @override
  final WorkShop? workShop;
  @override
  @JsonKey()
  final FormStatus status;
  final List<WorkShop> _workShops;
  @override
  @JsonKey()
  List<WorkShop> get workShops {
    if (_workShops is EqualUnmodifiableListView) return _workShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workShops);
  }

  @override
  String toString() {
    return 'WorkshopNetworksState(workShop: $workShop, status: $status, workShops: $workShops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkshopNetworksState &&
            (identical(other.workShop, workShop) ||
                other.workShop == workShop) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._workShops, _workShops));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workShop, status,
      const DeepCollectionEquality().hash(_workShops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkshopNetworksStateCopyWith<_$_WorkshopNetworksState> get copyWith =>
      __$$_WorkshopNetworksStateCopyWithImpl<_$_WorkshopNetworksState>(
          this, _$identity);
}

abstract class _WorkshopNetworksState extends WorkshopNetworksState {
  const factory _WorkshopNetworksState(
      {final WorkShop? workShop,
      final FormStatus status,
      final List<WorkShop> workShops}) = _$_WorkshopNetworksState;
  const _WorkshopNetworksState._() : super._();

  @override
  WorkShop? get workShop;
  @override
  FormStatus get status;
  @override
  List<WorkShop> get workShops;
  @override
  @JsonKey(ignore: true)
  _$$_WorkshopNetworksStateCopyWith<_$_WorkshopNetworksState> get copyWith =>
      throw _privateConstructorUsedError;
}
