import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/settings.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class AncModDraggableMenu extends StatelessWidget {
  const AncModDraggableMenu({super.key});

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
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.edit,
                color: ColorPalette.primaryItem,
              ),
              horizontalTitleGap: 0,
              title: const Text(
                "Duyuruyu Düzenle",
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
                Icons.delete,
                color: ColorPalette.primaryItem,
              ),
              horizontalTitleGap: 0,
              title: const Text(
                "Duyuruyu  Sil",
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
                "Bu Etkinliği Bildir",
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
