import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/sub_pages/menus/anc_mod_draggable_menu.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  final String text;
  final String title;

  const AnnouncementPage({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: title,
        subTitle: "GG/AA/YY",
        popButton: true,
        children: [
          SingleButton(
            padding: const EdgeInsets.all(9),
            onPressed: () => DraggableMenu.open(
              context,
              barrier: true,
              const AncModDraggableMenu(),
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
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: const TextStyle(
                color: ColorPalette.primaryText,
                fontSize: 16,
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
