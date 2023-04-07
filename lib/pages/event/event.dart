import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(title: "Etkinlik"),
      body: Center(),
    );
  }
}
