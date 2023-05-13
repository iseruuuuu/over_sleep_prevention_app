import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  final CountdownController _controller = CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイマー'),
      ),
      body: Center(
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
                    child: const Text('Start'),
                    onPressed: () {
                      _controller.start();
                    },
                  ),
                  // Pause
                  ElevatedButton(
                    child: const Text('Pause'),
                    onPressed: () {
                      _controller.pause();
                    },
                  ),
                  // Resume
                  ElevatedButton(
                    child: const Text('Resume'),
                    onPressed: () {
                      _controller.resume();
                    },
                  ),
                  // Stop
                  ElevatedButton(
                    child: const Text('Restart'),
                    onPressed: () {
                      _controller.restart();
                    },
                  ),
                ],
              ),
            ),
            Countdown(
              controller: _controller,
              seconds: 5,
              build: (_, double time) => Text(
                time.toString(),
                style: const TextStyle(
                  fontSize: 100,
                ),
              ),
              interval: const Duration(milliseconds: 100),
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Timer is done!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
