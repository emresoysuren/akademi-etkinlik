import 'package:akademi_etkinlik/config/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  final Timestamp date;

  const CountDown(this.date, {super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  final DateTime to = DateTime(2023, 4, 9, 12);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime nowDate = DateTime(now.year, now.month, now.day);
    final int countdown = widget.date.toDate().difference(nowDate).inDays;
    return Text(
      countdown == 0
          ? "Bugün"
          : countdown > 0
              ? "$countdown Gün\nSonra"
              : "Sonlandı",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorPalette.primaryText,
      ),
    );
  }
}
