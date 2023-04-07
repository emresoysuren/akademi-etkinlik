import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class CreateEventRatePage extends StatelessWidget {
  const CreateEventRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: "Değerlendirme Formu Oluştur",
        popButton: true,
      ),
      body: Center(),
    );
  }
}
