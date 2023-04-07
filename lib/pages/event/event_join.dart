import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class EventJoinPage extends StatelessWidget {
  const EventJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: "Katıl",
        popButton: true,
      ),
      body: Center(),
    );
  }
}
