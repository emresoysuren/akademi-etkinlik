import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/create/create_event_form.dart';
import 'package:akademi_etkinlik/models/form_return.dart';
import 'package:akademi_etkinlik/pages/utils/form_code_generator.dart';
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
import 'package:akademi_etkinlik/widgets/flush_configured.dart';
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
  EventForm? _joinEventForm;
  EventForm? _rateEventForm;

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
                            _joinEventForm != null ||
                            _rateEventForm != null ||
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
                                  joinForm: _joinEventForm,
                                  rateForm: _rateEventForm,
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
                              String msg = "Gerekli alanlar boş bırakılamaz.";
                              if (_dateTime == null) {
                                msg = "Tarih ve Saat kısmı boş bırakılamaz.";
                              }
                              if (_content == null) {
                                msg = "Açıklama kısmı boş bırakılamaz.";
                              }
                              if (_title == null) {
                                msg = "Başlık kısmı boş bırakılamaz.";
                              }
                              flushBarShow(
                                context,
                                title: "Etkinlik Yaratılamadı",
                                message: msg,
                              );
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
                                joinForm:
                                    _joinEventForm ?? widget.event?.joinForm,
                                rateForm:
                                    _rateEventForm ?? widget.event?.rateForm,
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
                          if (widget.event != null) {
                            Navigator.pop(context);
                          } else {
                            flushBarShow(
                              context,
                              title: "Etkinlik Yaratılamadı",
                              message:
                                  "Etkinlik yaratabilmek için formu doldurunuz.",
                            );
                          }
                        }
                      },
                      label: widget.event == null ? "Oluştur" : "Kaydet",
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: SecondaryButton(
                      label: "Form Ayarları",
                      onPressed: _addForm,
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
    FormReturn? formReturn = await DraggableMenu.open<FormReturn>(
      context,
      AddEventFormDraggableMenu(
        joinEventForm: _joinEventForm ??
            (widget.event?.joinForm != null ? widget.event!.joinForm! : null),
        rateEventForm: _rateEventForm ??
            (widget.event?.rateForm != null ? widget.event!.rateForm! : null),
      ),
      barrier: true,
    );
    if (formReturn == null) return;
    if (formReturn.formType == FormType.join) {
      if (mounted) {
        setState(() {
          _joinEventForm = formReturn.eventForm;
        });
      }
    }
    if (formReturn.formType == FormType.rate) {
      if (mounted) {
        setState(() {
          _rateEventForm = formReturn.eventForm;
        });
      }
    }
  }
}
