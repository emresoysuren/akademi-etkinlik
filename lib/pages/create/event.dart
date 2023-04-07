import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: "Oluştur",
      ),
      body: Center(),
    );
  }
}
