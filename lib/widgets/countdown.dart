import 'package:akademi_etkinlik/config/config.dart';
import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  final DateTime to = DateTime(2023, 4, 9, 12);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime date = DateTime(now.year, now.month, now.day);
    return Text(
      (date.difference(to).inHours.toString()),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorPalette.primaryText,
      ),
    );
  }
}
