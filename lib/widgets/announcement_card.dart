import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/announcement.dart';
import 'package:akademi_etkinlik/pages/announcement/announcement_page.dart';
import 'package:akademi_etkinlik/pages/utils/timestamp_to_date_string.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        SlidePageRoute(child: AnnouncementPage(announcement: announcement)),
      ),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        elevation: 2,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 320),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: ColorPalette.secondaryBackground,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: BaseCore(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      announcement.title.length > 16
                          ? '${announcement.title.substring(0, 13)}... '
                          : announcement.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: ColorPalette.primaryText,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      announcement.date.toDateString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.primaryText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: announcement.content.length > 120
                        ? '${announcement.content.substring(0, 110)}... '
                        : announcement.content,
                    style: const TextStyle(
                      color: ColorPalette.primaryText,
                      fontSize: 16,
                    ),
                    children: [
                      if (announcement.content.length > 120)
                        const TextSpan(
                          text: "Devamı",
                          style: TextStyle(
                            color: ColorPalette.primaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
