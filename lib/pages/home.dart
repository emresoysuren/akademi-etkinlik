import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(title: Config.title),
      body: Center(),
    );
  }
}
