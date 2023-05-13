import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerItem extends StatelessWidget {
  const TimerItem({
    Key? key,
    required this.isFinish,
    required this.controller,
    required this.onFinished,
    required this.onStopped,
    required this.onTapStart,
    required this.onTapResetTimer,
    required this.second,
  }) : super(key: key);

  final bool isFinish;
  final CountdownController controller;
  final VoidCallback onFinished;
  final VoidCallback onStopped;
  final VoidCallback onTapStart;
  final VoidCallback onTapResetTimer;
  final int second;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Start
                ElevatedButton(
                  onPressed: onTapStart,
                  child: const Text('Start'),
                ),
                // Pause
                ElevatedButton(
                  child: const Text('Pause'),
                  onPressed: () => controller.pause(),
                ),
                // Resume
                ElevatedButton(
                  child: const Text('Resume'),
                  onPressed: () => controller.resume(),
                ),
                // Stop
                ElevatedButton(
                  child: const Text('Restart'),
                  onPressed: () => controller.restart(),
                ),
              ],
            ),
          ),
          Countdown(
            controller: controller,
            seconds: second,
            build: (_, double time) => Text(
              time.toString(),
              style: const TextStyle(
                fontSize: 100,
              ),
            ),
            interval: const Duration(milliseconds: 100),
            onFinished: onFinished,
          ),
          ElevatedButton(
            onPressed: onStopped,
            child: const Text('stop'),
          ),
          ElevatedButton(
            onPressed: onTapResetTimer,
            child: Text('タイマー設定に戻る'),
          ),
        ],
      ),
    );
  }
}
