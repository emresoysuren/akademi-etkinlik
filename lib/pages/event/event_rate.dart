import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/utils/form_code_generator.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EventRatePage extends StatelessWidget {
  final Event event;

  const EventRatePage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: const Bar(
        title: "Etkinlik",
        subTitle: "Değerlendir",
        popButton: true,
      ),
      body: event.rateForm == null
          ? null
          : DisableScrollBehavior(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                padding: const EdgeInsets.all(16),
                itemCount: event.rateForm!.formData.length,
                itemBuilder: (context, index) {
                  final uuid = event.rateForm!.formIds[index];
                  if (event.rateForm!.uuidTypeAt(uuid) == FormInput.question) {
                    return Text(
                      event.rateForm!.uuidConentAt(uuid) ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.primaryText,
                      ),
                    );
                  }
                  if (event.rateForm!.uuidTypeAt(uuid) == FormInput.text) {
                    return const ParagraphField();
                  }
                  if (event.rateForm!.uuidTypeAt(uuid) == FormInput.star) {
                    return Center(
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        glow: false,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    );
                  }
                  if (event.rateForm!.uuidTypeAt(uuid) == FormInput.checkBox) {
                    return const ParagraphField();
                  }
                  return const SizedBox();
                },
              ),
            ),
      bottom: BaseCore(
        backgroundColor: ColorPalette.primaryBackground,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              onPressed: () => _okay(context),
              label: "Değerlendir",
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _okay(BuildContext context) async {
    final form = event.rateForm;
    if (form == null) return;
    final EventForm answer = EventForm(ids: form.formIds, data: form.formData);
    Navigator.pop(context);
  }
}
