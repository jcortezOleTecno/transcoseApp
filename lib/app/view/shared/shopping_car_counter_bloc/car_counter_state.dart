import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_counter_state.freezed.dart';

@freezed
class CarCounterState with _$CarCounterState {
  const factory CarCounterState({
    @Default(0) int products,
  }) = _UserState;
  const CarCounterState._();
}
