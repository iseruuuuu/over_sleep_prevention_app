import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerSetItem extends StatelessWidget {
  const TimerSetItem({
    Key? key,
    required this.onTapStart,
    required this.onTimerDurationChanged,
  }) : super(key: key);

  final Function() onTapStart;
  final Function(Duration) onTimerDurationChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('時間を設定する'),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            minuteInterval: 1,
            secondInterval: 1,
            initialTimerDuration: const Duration(),
            onTimerDurationChanged: onTimerDurationChanged,
          ),
          ElevatedButton(
            onPressed: onTapStart,
            child: const Text('スタート'),
          ),
        ],
      ),
    );
  }
}
