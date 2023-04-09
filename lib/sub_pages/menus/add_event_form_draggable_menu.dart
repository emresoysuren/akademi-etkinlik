import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/create/create_event_form.dart';
import 'package:akademi_etkinlik/models/form_return.dart';
import 'package:akademi_etkinlik/pages/utils/form_code_generator.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class AddEventFormDraggableMenu extends StatelessWidget {
  final EventForm? joinEventForm;
  final EventForm? rateEventForm;

  const AddEventFormDraggableMenu(
      {super.key, this.joinEventForm, this.rateEventForm});

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
              title: joinEventForm == null
                  ? "Katılım Formu Oluştur"
                  : "Katılım Formunu Düzenle",
              page: CreateFormPage(
                formType: FormType.join,
                eventForm: joinEventForm,
              ),
            ),
            _tile(
              context,
              icon: Icons.rate_review_outlined,
              title: rateEventForm == null
                  ? "Değerlendirme Formu Oluştur"
                  : "Değerlendirme Formunu Düzenle",
              page: CreateFormPage(
                formType: FormType.rate,
                eventForm: rateEventForm,
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
      onTap: () async {
        final FormReturn? result = await Navigator.push<FormReturn>(
          context,
          SlidePageRoute(
            child: page,
          ),
        );
        if (context.mounted) Navigator.pop<FormReturn>(context, result);
      },
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
