import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(title: "Duyurular"),
      body: Center(),
    );
  }
}
