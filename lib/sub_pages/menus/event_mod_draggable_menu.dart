import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/config/user.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/create/event.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:akademi_etkinlik/pages/settings.dart';
import 'package:akademi_etkinlik/repository/events_repo.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/sub_pages/cards/dialog.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventModDraggableMenu extends ConsumerWidget {
  final Event event;

  const EventModDraggableMenu({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableMenu(
      minHeight: 0,
      color: ColorPalette.secondaryBackground,
      child: BaseCore(
        child: Column(
          children: [
            _tile(
              context,
              icon: Icons.settings,
              title: "Ayarlar",
              page: const SettingsPage(),
            ),
            if (UserConfig.admin)
              _tile(
                context,
                title: "Etkinliği Düzenle",
                icon: Icons.edit,
                page: CreateEventPage(
                  event: event,
                ),
              ),
            if (UserConfig.admin)
              ListTile(
                onTap: () => Navigator.push(
                  context,
                  DialogRoute(
                    context: context,
                    builder: (context) => DialogCard(
                      title: "Etkinliği Sil",
                      text:
                          "Bu etkinliği silmek istediğinize emin misiniz? Silme işlemi geri alınamaz.",
                      buttonText: "Etkinliği Sil",
                      buttonPress: () async {
                        await DataService.deleteEvent(event);
                        await ref.read(events).getEvents();
                        if (context.mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            NonAnimatedPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ),
                ),
                leading: const Icon(
                  Icons.delete,
                  color: ColorPalette.primaryItem,
                ),
                horizontalTitleGap: 0,
                title: const Text(
                  "Etkinliği Sil",
                  style: TextStyle(
                    color: ColorPalette.primaryItem,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.report_gmailerrorred_outlined,
                color: Colors.red,
              ),
              horizontalTitleGap: 0,
              title: const Text(
                "Hata Bildir",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _tile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget page,
  }) {
    return ListTile(
      onTap: () => Navigator.pushReplacement(
        context,
        SlidePageRoute(
          child: page,
        ),
      ),
      leading: Icon(icon, color: ColorPalette.primaryItem),
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: ColorPalette.primaryItem,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
