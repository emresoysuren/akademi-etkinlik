import 'package:akademi_etkinlik/widgets/announcement_card.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: const Bar(
        title: "Duyurular",
        subTitle: "24 Adet Duyuru Var",
        popButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 24,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: AnnouncementCard(
                title: "Duyuru",
                text:
                    "Voluptate eu laborum fugiat aliqua exercitation culpa quis nostrud et ex quis enim ullamco. Commodo cupidatat id deserunt sunt pariatur duis cillum sint proident laboris. Nulla nisi culpa cillum eu occaecat mollit.",
              ),
            );
          },
        ),
      ),
    );
  }
}
