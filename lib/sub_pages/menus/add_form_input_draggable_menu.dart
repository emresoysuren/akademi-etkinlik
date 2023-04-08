import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/utils/form_code_generator.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFormInputDraggableMenu extends ConsumerWidget {
  const AddFormInputDraggableMenu({super.key});

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
              title: "Yazı Alanı Ekle",
              icon: Icons.text_fields_rounded,
              formInput: FormInput.text,
            ),
            _tile(
              context,
              title: "Onay Kutusu Ekle",
              icon: Icons.check_box_outlined,
              formInput: FormInput.checkBox,
            ),
            _tile(
              context,
              title: "Yıldızlı Puan Ekle",
              icon: Icons.star_border_rounded,
              formInput: FormInput.star,
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
    required FormInput formInput,
  }) {
    return ListTile(
      onTap: () => Navigator.pop<FormInput>(context, formInput),
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
