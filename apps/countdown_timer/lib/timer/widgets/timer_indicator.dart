import 'package:countdown_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerIndicator extends StatelessWidget {
  const TimerIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        HSLColor.fromColor(Color(0XFFf0c977)).withLightness(0.4).toColor();
    final double radius = 200.0;
    final double circleRadius = ((0.1 * radius) / 2) + radius;

    return Column(
      children: [
        Text(
          '1 minute',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Color(0XFF9E2A2B).withOpacity(.6)),
        ),
        SizedBox(height: 10.0),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: circleRadius,
              width: circleRadius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            _TimerLeftIndicator(radius: radius, bgColor: bgColor)
          ],
        ),
      ],
    );
  }
}

final _durationLeftProvider = Provider<int>((ref) {
  return ref.watch(timerProvider).duration;
});

final durationLeftProvider = Provider<int>((ref) {
  return ref.watch(_durationLeftProvider);
});

class _TimerLeftIndicator extends ConsumerWidget {
  const _TimerLeftIndicator({
    Key? key,
    required this.radius,
    required this.bgColor,
  }) : super(key: key);

  final double radius;
  final Color bgColor;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final timeLeft = watch(durationLeftProvider);
    final double percent = timeLeft / 60;
    final durationFormat = _formatDuration(timeLeft);
    print('building _TimerLeftIndicator $durationFormat');

    return CircularPercentIndicator(
      radius: radius,
      lineWidth: 8.0,
      percent: percent,
      reverse: true,
      progressColor: bgColor,
      backgroundColor: Colors.white,
      center: Text(
        durationFormat,
        style: TextStyle(fontSize: 30, color: bgColor),
      ),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  String _formatDuration(int duration) {
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}
