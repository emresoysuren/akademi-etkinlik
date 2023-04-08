import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/config/user.dart';
import 'package:akademi_etkinlik/models/announcement.dart';
import 'package:akademi_etkinlik/pages/create/announcement.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:akademi_etkinlik/pages/settings.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/sub_pages/cards/dialog.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class AncModDraggableMenu extends StatelessWidget {
  final Announcement announcement;

  const AncModDraggableMenu({super.key, required this.announcement});

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
            if (UserConfig.admin)
              _tile(
                context,
                title: "Duyuruyu Düzenle",
                icon: Icons.edit,
                page: CreateAnnouncementPage(
                  announcement: announcement,
                ),
              ),
            if (UserConfig.admin)
              ListTile(
                onTap: () => Navigator.push(
                  context,
                  DialogRoute(
                    context: context,
                    builder: (context) => DialogCard(
                      title: "Duyuruyu Sil",
                      text:
                          "Bu duyuruyu silmek istediğinize emin misiniz? Silme işlemi geri alınamaz.",
                      buttonText: "Duyuruyu Sil",
                      buttonPress: () async {
                        await DataService.deleteAnnouncement(announcement);
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
                  "Duyuruyu Sil",
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
