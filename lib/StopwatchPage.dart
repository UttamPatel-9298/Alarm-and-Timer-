import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void startStopwatch() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {});
    });
    stopwatch.start();
  }

  void stopStopwatch() {
    stopwatch.stop();
    timer?.cancel();
  }

  void resetStopwatch() {
    stopwatch.reset();
    setState(() {});
  }

  String formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr:$hundredsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(stopwatch.elapsedMilliseconds),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: stopwatch.isRunning ? null : startStopwatch,
                  child: const Text("Start"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: stopwatch.isRunning ? stopStopwatch : null,
                  child: const Text("Stop"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetStopwatch,
                  child: const Text("Reset"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
