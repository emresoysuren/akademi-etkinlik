import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/create/announcement.dart';
import 'package:akademi_etkinlik/pages/create/event.dart';
import 'package:akademi_etkinlik/pages/settings.dart';
import 'package:akademi_etkinlik/pages/utils/sign_out.dart';
import 'package:akademi_etkinlik/sub_pages/cards/dialog.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class MainDraggableMenu extends StatelessWidget {
  const MainDraggableMenu({super.key});

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
              icon: Icons.event_note_outlined,
              title: "Etkinlik Oluştur",
              page: const CreateEventPage(),
            ),
            _tile(
              context,
              icon: Icons.campaign_outlined,
              title: "Duyuru Oluştur",
              page: const CreateAnnouncementPage(),
            ),
            _tile(
              context,
              icon: Icons.settings,
              title: "Ayarlar",
              page: const SettingsPage(),
            ),
            ListTile(
              onTap: () => Navigator.push(
                context,
                DialogRoute(
                  context: context,
                  builder: (context) => DialogCard(
                    title: "Çıkış Yap",
                    text:
                        "Proident et ullamco minim eiusmod cupidatat ea consectetur in mollit ut excepteur duis ad velit.",
                    buttonText: "Çıkış Yap",
                    buttonColor: Colors.red,
                    buttonTextColor: Colors.red,
                    buttonPress: () => signOut(context),
                  ),
                ),
              ),
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
              horizontalTitleGap: 0,
              title: const Text(
                "Çıkış Yap",
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
