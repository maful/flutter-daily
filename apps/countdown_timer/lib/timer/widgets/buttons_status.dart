import 'package:countdown_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsStatus extends StatelessWidget {
  const ButtonsStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roundButtonStyle = ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(25),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: _ButtonsContainer(roundButtonStyle: roundButtonStyle),
    );
  }
}

final _buttonStatusProvider = Provider<TimerStatus>((ref) {
  return ref.watch(timerProvider).status;
});

final buttonStatusProvider = Provider<TimerStatus>((ref) {
  return ref.watch(_buttonStatusProvider);
});

class _ButtonsContainer extends ConsumerWidget {
  const _ButtonsContainer({
    Key? key,
    required this.roundButtonStyle,
  }) : super(key: key);

  final ButtonStyle roundButtonStyle;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    print('building _ButtonsContainer');
    final status = watch(buttonStatusProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (status == TimerStatus.initial) ...[
          _StartButton(roundButtonStyle: roundButtonStyle),
        ],
        if (status == TimerStatus.started) ...[
          _PauseButton(roundButtonStyle: roundButtonStyle),
          _ResetButton(roundButtonStyle: roundButtonStyle),
        ],
        if (status == TimerStatus.paused) ...[
          _StartButton(roundButtonStyle: roundButtonStyle),
          _ResetButton(roundButtonStyle: roundButtonStyle),
        ],
        if (status == TimerStatus.finished) ...[
          _ResetButton(roundButtonStyle: roundButtonStyle),
        ],
      ],
    );
  }
}

class _PauseButton extends StatelessWidget {
  const _PauseButton({
    Key? key,
    required this.roundButtonStyle,
  }) : super(key: key);

  final ButtonStyle roundButtonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read(timerProvider.notifier).pause(),
      child: const Text('Pause'),
      style: roundButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Color(0XFF9E2A2B)),
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    Key? key,
    required this.roundButtonStyle,
  }) : super(key: key);

  final ButtonStyle roundButtonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read(timerProvider.notifier).start(),
      child: const Text('Start'),
      style: roundButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(Color(0XFF9E2A2B)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({
    Key? key,
    required this.roundButtonStyle,
  }) : super(key: key);

  final ButtonStyle roundButtonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read(timerProvider.notifier).reset(),
      child: const Text('Reset'),
      style: roundButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(Color(0XFF9E2A2B)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }
}
