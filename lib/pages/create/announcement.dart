import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class CreateAnnouncementPage extends StatelessWidget {
  const CreateAnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base(
      appBar: Bar(
        title: "Duyuru",
        subTitle: "Oluştur",
      ),
      body: Center(),
    );
  }
}
