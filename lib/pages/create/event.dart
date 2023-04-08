import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:akademi_etkinlik/pages/utils/timestamp_to_date_string.dart';
import 'package:akademi_etkinlik/repository/events_repo.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/sub_pages/menus/add_event_form_draggable_menu.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/secondary_button.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:akademi_etkinlik/widgets/fields/info_field.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class CreateEventPage extends ConsumerStatefulWidget {
  final Event? event;

  const CreateEventPage({super.key, this.event});

  @override
  ConsumerState<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends ConsumerState<CreateEventPage> {
  String? _link;
  String? _title;
  String? _content;
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: "Etkinlik",
        subTitle: widget.event == null ? "Oluştur" : "Düzenle",
        popButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Başlık:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorPalette.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            InfoField(
              isSecondary: true,
              initialValue: widget.event?.title,
              onChanged: (value) {
                _title = value;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Açıklama:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorPalette.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            ParagraphField(
              initialValue: widget.event?.content,
              onChanged: (value) {
                _content = value;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Etkinlik Linki:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorPalette.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            InfoField(
              isSecondary: true,
              initialValue: widget.event?.link,
              onChanged: (value) {
                _link = value;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Tarih ve Saat:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorPalette.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                color: ColorPalette.primaryItem,
                textColor: _dateTime == null
                    ? widget.event != null
                        ? ColorPalette.primaryText
                        : null
                    : ColorPalette.primaryText,
                label: _dateTime != null
                    ? Timestamp.fromDate(_dateTime!).toDateString()
                    : widget.event != null
                        ? widget.event!.date.toDateString()
                        : "Etkinlik Zamanını Belirle",
                radius: 16,
                borderWidth: 1.6,
                onPressed: () async {
                  final dateTime = await showOmniDateTimePicker(
                    context: context,
                    borderRadius: BorderRadius.circular(32),
                    is24HourMode: true,
                    initialDate: widget.event != null
                        ? widget.event!.date.toDate()
                        : null,
                  );
                  if (dateTime == null) return;
                  _dateTime = dateTime;
                  if (mounted) setState(() {});
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottom: DisableScrollBehavior(
        child: SingleChildScrollView(
          child: BaseCore(
            backgroundColor: ColorPalette.primaryBackground,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      onPressed: () async {
                        if (_content != null ||
                            _title != null ||
                            _link != null ||
                            _dateTime != null) {
                          if (widget.event == null) {
                            if (_content != null &&
                                _title != null &&
                                _dateTime != null) {
                              await DataService.createEvent(
                                Event(
                                  content: _content!,
                                  title: _title!,
                                  date: Timestamp.fromDate(_dateTime!),
                                  link: _link,
                                ),
                              );
                              await ref.read(events).getEvents();
                              if (mounted) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  NonAnimatedPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                  (route) => false,
                                );
                              }
                            } else {
                              // TODO: Throw an error. Because some fields are empty
                            }
                          } else {
                            await DataService.editEvent(
                              Event(
                                content: _content ?? widget.event!.content,
                                title: _title ?? widget.event!.title,
                                date: _dateTime != null
                                    ? Timestamp.fromDate(_dateTime!)
                                    : widget.event!.date,
                                link: _link ?? widget.event?.link,
                                id: widget.event!.id,
                              ),
                            );
                            await ref.read(events).getEvents();
                            if (mounted) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                NonAnimatedPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false,
                              );
                            }
                          }
                        } else {
                          // TODO: Show an error because the user haven't changed anything yet
                        }
                      },
                      label: widget.event == null ? "Oluştur" : "Düzenle",
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: SecondaryButton(
                      label: "Form Ayarları",
                      onPressed: () => _addForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addForm() async {
    await DraggableMenu.open(
      context,
      const AddEventFormDraggableMenu(),
      barrier: true,
    );
  }
}
