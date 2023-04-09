import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/utils/to_now.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  final Timestamp date;

  const CountDown(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    final int countdown = date.toNow().inDays;
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
