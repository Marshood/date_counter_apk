import 'package:flutter/material.dart';

class CountdownWidget extends StatelessWidget {
  final String targetDateString;

  const CountdownWidget({super.key, required this.targetDateString});

  @override
  Widget build(BuildContext context) {
    DateTime targetDate = DateTime.parse(targetDateString);
    Duration difference = DateTime.now().difference(targetDate);

    int days = difference.inDays;
    int years = (days / 365).floor();
    int weeks = (days / 7).floor();
    int months = (days / 30).floor();
    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;

    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the rows vertically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Center items horizontally within the row
            children: [
              Text(
                'Years: $years',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(width: 12),
              Text(
                'Months: $months',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Center items horizontally within the row
            children: [
              Text(
                'Weeks: $weeks',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(width: 12),
              Text(
                'Days: $days',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // Center items horizontally within the row
            children: [
              Text(
                'Hours: $hours',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(width: 12),
              Text(
                'Minutes: $minutes',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
