import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String url;

  const LinkButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    String text = "Link";
    IconData icon = Icons.link;
    if (url.toLowerCase().contains("tiktok.com")) {
      text = "TikTok";
      icon = Icons.tiktok;
    }
    if (url.toLowerCase().contains("discord.com")) {
      text = "Discord";
      icon = Icons.discord;
    }
    if (url.toLowerCase().contains("facebook.com")) {
      text = "Facebook";
      icon = Icons.facebook;
    }
    return PlainTextButton(
      icon: icon,
      text: text,
      backgroundColor: ColorPalette.secondaryItem,
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          launchUrl(Uri.parse(url));
        } else if (context.mounted) {
          //TODO: Show a Popup
        }
      },
    );
  }
}
