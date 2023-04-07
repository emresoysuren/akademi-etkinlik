import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/announcement.dart';
import 'package:akademi_etkinlik/pages/home.dart';
import 'package:akademi_etkinlik/repository/events_repo.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/disable_scroll_behavior.dart';
import 'package:akademi_etkinlik/widgets/fields/info_field.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAnnouncementPage extends ConsumerStatefulWidget {
  final Announcement? announcement;

  const CreateAnnouncementPage({super.key, this.announcement});

  @override
  ConsumerState<CreateAnnouncementPage> createState() =>
      _CreateAnnouncementPageState();
}

class _CreateAnnouncementPageState
    extends ConsumerState<CreateAnnouncementPage> {
  String? _title;
  String? _content;

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: "Duyuru",
        subTitle: widget.announcement == null ? "Oluştur" : "Düzenle",
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
              initialValue: widget.announcement?.title,
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
              initialValue: widget.announcement?.content,
              onChanged: (value) {
                _content = value;
              },
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
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () async {
                    if (_content != null || _title != null) {
                      if (widget.announcement == null) {
                        if (_content != null && _title != null) {
                          await DataService.createAnnouncement(
                            Announcement(
                              content: _content!,
                              title: _title!,
                              date: Timestamp.now(),
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
                        await DataService.editAnnouncement(
                          Announcement(
                            content: _content ?? widget.announcement!.content,
                            title: _title ?? widget.announcement!.title,
                            date: Timestamp.now(),
                            id: widget.announcement!.id,
                          ),
                        );
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
                  label: widget.announcement == null ? "Oluştur" : "Düzenle",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
