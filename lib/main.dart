import 'package:flutter/material.dart';
import 'package:tky/AlarmPage.dart';
import 'package:tky/StopwatchPage.dart';

void main() {
  runApp(
    const MaterialApp(home: TimerAlarmApp(), debugShowCheckedModeBanner: false),
  );
}

class TimerAlarmApp extends StatefulWidget {
  const TimerAlarmApp({super.key});

  @override
  State<TimerAlarmApp> createState() => _TimerAlarmAppState();
}

class _TimerAlarmAppState extends State<TimerAlarmApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const StopwatchPage(), const AlarmPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Stopwatch'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
        ],
      ),
    );
  }
}
