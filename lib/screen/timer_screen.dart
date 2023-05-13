import 'dart:async';

import 'package:flutter/material.dart';
import 'package:over_sleep_prevention_app/component/timer_item.dart';
import 'package:over_sleep_prevention_app/component/timer_set_item.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:vibration/vibration.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> with WidgetsBindingObserver {
  final CountdownController controller = CountdownController(autoStart: false);
  Timer? timer;
  bool isFinish = false;
  bool isTimerStart = false;
  int second = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      timer.cancel();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //TODO アプリのタスクを切るとバイブレーションは終わる
    //TODO アプリを閉じると、30秒後にバーブレーションが終わる
    //TODO 電源を消すと、30秒後にバーブレーションが終わる

    if (state == AppLifecycleState.paused) {
      vibration();
    }
  }

  void vibration() {
    if (isFinish) {
      timer?.cancel();
      timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
        Vibration.vibrate(duration: 1000);
      });
    }
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F4F4),
        elevation: 2,
        title: Text(
          isFinish ? '' : '時間を設定する',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: !isTimerStart
          ? TimerSetItem(
              onTapStart: () {
                if (second != 0) {
                  controller.start();
                  setState(() {
                    isTimerStart = true;
                    isFinish = false;
                  });
                }
              },
              onTimerDurationChanged: (Duration changeTimer) {
                second = changeTimer.inSeconds +
                    changeTimer.inMinutes * 60 % 2 +
                    changeTimer.inHours * 3600 % 2;
              },
            )
          : TimerItem(
              isFinish: isFinish,
              controller: controller,
              onFinished: () {
                isFinish = true;
                vibration();
              },
              onStopped: () {
                stopTimer();
              },
              onTapStart: () {
                controller.start();
                isFinish = false;
              },
              onTapResetTimer: () {
                timer?.cancel();
                setState(() {
                  second = 0;
                  isFinish = true;
                  isTimerStart = false;
                });
              },
              second: second,
            ),
    );
  }
}
