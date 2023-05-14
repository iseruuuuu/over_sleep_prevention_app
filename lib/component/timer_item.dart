import 'package:flutter/material.dart';
import 'package:over_sleep_prevention_app/component/timer_button_item.dart';
import 'package:over_sleep_prevention_app/function_utils.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Countdown(
            controller: controller,
            seconds: second,
            build: (_, double time) => Text(
              FunctionUtils().getTimeStringFromDouble(time),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
              ),
            ),
            interval: const Duration(milliseconds: 100),
            onFinished: onFinished,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TimerButtonItem(
                title: 'START',
                onTap: onTapStart,
              ),
              TimerButtonItem(
                title: 'PAUSE',
                onTap: controller.pause,
              ),
            ],
          ),
          //TODO バイブレーションを止めるためのボタン（あとで調整する）
          ElevatedButton(
            onPressed: onStopped,
            child: const Text('STOP'),
          ),
          //TODO　タイマーの設定に戻るためのボタン（あとで調整をする）
          ElevatedButton(
            onPressed: onTapResetTimer,
            child: const Text('CANCEL'),
          ),
        ],
      ),
    );
  }
}
