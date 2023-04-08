import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/create/form/add_form_input_draggable_menu.dart';
import 'package:akademi_etkinlik/pages/create/form/models/form_return.dart';
import 'package:akademi_etkinlik/pages/create/form/utils/form_code_generator.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/secondary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:akademi_etkinlik/widgets/fields/info_field.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateFormPage extends ConsumerStatefulWidget {
  final FormType formType;
  final EventForm? eventForm;

  const CreateFormPage({this.eventForm, required this.formType, super.key});

  @override
  ConsumerState<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends ConsumerState<CreateFormPage> {
  late final EventForm eventForm = widget.eventForm ?? EventForm();

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: widget.formType == FormType.join
            ? "Katılım Formu Oluştur"
            : widget.formType == FormType.rate
                ? "Değerlendirme Formu Oluşturun"
                : null,
        popButton: true,
      ),
      body: DisableScrollBehavior(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          padding: const EdgeInsets.all(16),
          itemCount: eventForm.formData.length,
          itemBuilder: (context, index) {
            if (eventForm.elementTypeAt(index) == FormInput.question) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Soru:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorPalette.primaryText,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (eventForm.elementTypeAt(index + 1) == null ||
                          eventForm.elementTypeAt(index + 1) ==
                              FormInput.question)
                        PlainTextButton(
                          text: "Yanıt Ekle",
                          fontSize: 14,
                          iconSize: 18,
                          elevation: 2,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          backgroundColor: ColorPalette.primaryButton,
                          onPressed: () async {
                            final FormInput? formInput =
                                await DraggableMenu.open<FormInput>(
                              context,
                              const AddFormInputDraggableMenu(),
                              barrier: true,
                            );
                            if (formInput == null) return;
                            setState(() {
                              eventForm.addItemTo(index + 1, formInput, "");
                            });
                          },
                        )
                      else
                        PlainTextButton(
                          text: eventForm.elementTypeAt(index + 1).toString(),
                          fontSize: 14,
                          iconSize: 18,
                          elevation: 2,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          backgroundColor: ColorPalette.primaryItem,
                          onPressed: () async {
                            final FormInput? formInput =
                                await DraggableMenu.open<FormInput>(
                              context,
                              const AddFormInputDraggableMenu(),
                              barrier: true,
                            );
                            if (formInput == null) return;
                            setState(() {
                              eventForm.changeItemAt(
                                index + 1,
                                formInput,
                                "",
                              );
                            });
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ParagraphField(
                    initialValue: eventForm.elementConentAt(index),
                    onChanged: (value) {
                      eventForm.editItemAt(index, value ?? "");
                    },
                  ),
                ],
              );
            }
            if (eventForm.elementTypeAt(index) == FormInput.checkBox) {
              return InfoField(
                initialValue: eventForm.elementConentAt(index),
                isSecondary: true,
                label: "Check Box",
              );
            }
            return const SizedBox();
          },
        ),
      ),
      bottom: BaseCore(
        backgroundColor: ColorPalette.primaryBackground,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  onPressed: _addQuestion,
                  label: "Soru Ekle",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  onPressed: _create,
                  label: "Oluştur",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addQuestion() {
    setState(() {
      eventForm.addItem(FormInput.question, "");
    });
  }

  void _create() {
    Navigator.pop<FormReturn>(context, FormReturn(widget.formType, eventForm));
  }
}

enum FormType {
  join,
  rate,
}
