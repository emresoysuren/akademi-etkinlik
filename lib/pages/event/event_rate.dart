import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class EventRatePage extends StatelessWidget {
  const EventRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: "Değerlendir",
      ),
      body: Center(),
    );
  }
}
