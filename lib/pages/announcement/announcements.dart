import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/widgets/announcement_card.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataService.getAnnouncements(),
      builder: (context, snapshot) {
        return Base(
          appBar: Bar(
            title: "Duyurular",
            subTitle: snapshot.data != null
                ? "${snapshot.data?.length} Adet Duyuru Var"
                : "",
            popButton: true,
          ),
          body: DisableScrollBehavior(
            child: snapshot.data != null
                ? ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 24),
                    padding: const EdgeInsets.all(16),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return AnnouncementCard(
                        announcement: snapshot.data![index],
                      );
                    },
                  )
                : const Center(),
          ),
        );
      },
    );
  }
}
