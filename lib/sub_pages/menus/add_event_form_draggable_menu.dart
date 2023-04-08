import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/create/form/create_event_form.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class AddEventFormDraggableMenu extends StatelessWidget {
  const AddEventFormDraggableMenu({super.key});

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
              icon: Icons.import_contacts_rounded,
              title: "Katılım Formu Oluştur",
              page: const CreateFormPage(formType: FormType.join),
            ),
            _tile(
              context,
              icon: Icons.rate_review_outlined,
              title: "Değerlendirme Formu Oluştur",
              page: const CreateFormPage(formType: FormType.rate),
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
