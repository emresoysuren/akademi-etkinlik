import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/announcement.dart';
import 'package:akademi_etkinlik/pages/utils/timestamp_to_date_string.dart';
import 'package:akademi_etkinlik/sub_pages/menus/anc_mod_draggable_menu.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementPage({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: announcement.title,
        subTitle: announcement.date.toDateString(),
        popButton: true,
        children: [
          SingleButton(
            padding: const EdgeInsets.all(9),
            onPressed: () => DraggableMenu.open(
              context,
              AncModDraggableMenu(
                announcement: announcement,
              ),
              barrier: true,
            ),
            child: const Icon(
              Icons.more_horiz,
              size: 30,
            ),
          ),
        ],
      ),
      body: DisableScrollBehavior(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                announcement.content,
                style: const TextStyle(
                  color: ColorPalette.primaryText,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      bottom: SizedBox(
        width: double.infinity,
        child: BaseCore(
          backgroundColor: ColorPalette.primaryBackground,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              onPressed: () => Navigator.pop(context),
              label: "Tamam",
            ),
          ),
        ),
      ),
    );
  }
}
