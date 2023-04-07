import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/create/event.dart';
import 'package:akademi_etkinlik/pages/settings.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class EventModDraggableMenu extends StatelessWidget {
  final Event event;

  const EventModDraggableMenu({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
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
            _tile(
              context,
              title: "Etkinliği Düzenle",
              icon: Icons.edit,
              page: CreateEventPage(
                event: event,
              ),
            ),
            ListTile(
              onTap: () {},
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
