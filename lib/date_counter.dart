import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final String targetDateString;

  const CountdownWidget({Key? key, required this.targetDateString})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late DateTime targetDate;
  late int days;
  late int years;
  late int weeks;
  late int months;
  late int targetHours;
  late int targetMinutes;
  late int displayedHours;
  late int diffHours;

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

      targetHours = targetDate.hour;
      targetMinutes = targetDate.minute;
      diffHours = difference.inHours;
      // Calculate remaining hours and minutes
      int remainingHours = difference.inHours % 24;
      minutes = difference.inMinutes % 60;

      // Add target hours and remaining hours to the current displayed hours
      displayedHours = remainingHours + targetHours;

      // Handle overflow (if minutes exceed 60)
      displayedHours += minutes ~/ 60;
      minutes %= 60;

      // Ensure hours are in the 24-hour format
      displayedHours %= 24;
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
                    color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                'Months: $months',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white),
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
                    color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                'Days: $days',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hours: $displayedHours',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                'Minutes: $minutes',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 12),
              Text(
                'Total Hours: $diffHours',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
