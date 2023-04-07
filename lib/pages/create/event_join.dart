import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class CreateEventJoinPage extends StatelessWidget {
  const CreateEventJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: "Katılım Formu Oluştur",
        popButton: true,
      ),
      body: Center(),
    );
  }
}
