import 'dart:async';

import 'package:countdown_timer/ticker.dart';
import 'package:countdown_timer/timer/timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  return TimerNotifier();
});

class TimerNotifier extends StateNotifier<TimerState> {
  TimerNotifier() : super(TimerState(duration: _duration));

  static const int _duration = 60;
  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  void start() {
    if (state.status == TimerStatus.paused) {
      _restart();
    } else {
      _start();
    }
  }

  void _start() {
    print('Start');
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: _duration).listen((duration) {
      state = state.copyWith(duration: duration, status: TimerStatus.started);
    });

    _tickerSubscription?.onDone(() {
      print('Done');
      state = state.copyWith(
          duration: state.duration, status: TimerStatus.finished);
    });

    state = state.copyWith(duration: _duration, status: TimerStatus.started);
  }

  void _restart() {
    print('Restart');
    _tickerSubscription?.resume();
    state =
        state.copyWith(duration: state.duration, status: TimerStatus.started);
  }

  void pause() {
    print('Pause');
    _tickerSubscription?.pause();
    state =
        state.copyWith(duration: state.duration, status: TimerStatus.paused);
  }

  void reset() {
    print('Reset');
    _tickerSubscription?.cancel();
    state = state.copyWith(duration: _duration, status: TimerStatus.initial);
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }
}
