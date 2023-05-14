import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerSetItem extends StatelessWidget {
  const TimerSetItem({
    Key? key,
    required this.onTapStart,
    required this.onTimerDurationChanged,
    required this.onStopped,
  }) : super(key: key);

  final VoidCallback onTapStart;
  final Function(Duration) onTimerDurationChanged;
  final VoidCallback onStopped;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hms,
              minuteInterval: 1,
              secondInterval: 1,
              initialTimerDuration: const Duration(),
              onTimerDurationChanged: onTimerDurationChanged,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                foregroundColor: const Color(0xFF0B84FF),
                backgroundColor: const Color(0xFF0B84FF),
              ),
              onPressed: onTapStart,
              child: const Text(
                'スタート',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: onStopped,
            child: const Text(
              'Stop Vibration',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
