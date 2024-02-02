import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final String targetDateString;

  const CountdownWidget({Key? key, required this.targetDateString})
      : super(key: key);

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late DateTime targetDate;
  late int days;
  late int years;
  late int weeks;
  late int months;
  late int hours;
  late int minutes;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    updateCountdown();
    // Set up a periodic timer to update the countdown every 5 seconds
    timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => updateCountdown());
  }

  void updateCountdown() {
    setState(() {
      targetDate = DateTime.parse(widget.targetDateString);
      Duration difference = DateTime.now().difference(targetDate);

      days = difference.inDays;
      years = (days / 365).floor();
      weeks = (days / 7).floor();
      months = (days / 30).floor();
      hours = difference.inHours;
      minutes = difference.inMinutes % 60;
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Years: $years',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Months: $months',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weeks: $weeks',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Days: $days',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hours: $hours',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Minutes: $minutes',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
