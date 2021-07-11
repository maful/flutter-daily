import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

enum TimerStatus { initial, started, paused, finished }

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    required int duration,
    @Default(TimerStatus.initial) TimerStatus status,
  }) = _TimerState;

  const TimerState._();
}
