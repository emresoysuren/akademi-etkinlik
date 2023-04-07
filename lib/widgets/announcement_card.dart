import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/announcement/announcement_page.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/slide.dart';
import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  final String text;
  final String title;

  const AnnouncementCard({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        SlidePageRoute(child: AnnouncementPage(title: title, text: text)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: ColorPalette.secondaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: BaseCore(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: ColorPalette.primaryText,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "4/7/23 21:00",
                    style: TextStyle(
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
                  text: text.length > 120
                      ? '${text.substring(0, 110)}... '
                      : text,
                  style: const TextStyle(
                    color: ColorPalette.primaryText,
                    fontSize: 16,
                  ),
                  children: [
                    if (text.length > 120)
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
    );
  }
}
