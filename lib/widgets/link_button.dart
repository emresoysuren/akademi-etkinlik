import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/pages/utils/link_type.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String url;

  const LinkButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    String text = "Link";
    IconData icon = Icons.link;
    Color? color;
    switch (url.linkType()) {
      case LinkTypes.tiktok:
        icon = Icons.tiktok;
        text = "TikTok";
        break;
      case LinkTypes.discord:
        icon = Icons.discord;
        color = Colors.indigo;
        text = "Discord";
        break;
      case LinkTypes.facebook:
        icon = Icons.facebook;
        color = Colors.blue;
        text = "Facebook";
        break;
      case LinkTypes.youtube:
        icon = FontAwesomeIcons.youtube;
        color = Colors.red;
        text = "Youtube";
        break;
      case LinkTypes.twitter:
        icon = FontAwesomeIcons.twitter;
        color = Colors.blue;
        text = "Twitter";
        break;
      case LinkTypes.snapchat:
        icon = FontAwesomeIcons.snapchat;
        color = Colors.amber;
        text = "Snapchat";
        break;
      case LinkTypes.instagram:
        icon = FontAwesomeIcons.instagram;
        color = Colors.purple;
        text = "Instagram";
        break;
      default:
        icon = Icons.link;
    }
    return PlainTextButton(
      icon: icon,
      text: text,
      color: color,
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
