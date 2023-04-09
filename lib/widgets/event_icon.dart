import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/utils/link_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventIcon extends StatelessWidget {
  final Event event;

  const EventIcon(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.link;
    Color? color;
    switch (event.link?.linkType()) {
      case LinkTypes.tiktok:
        icon = Icons.tiktok;
        break;
      case LinkTypes.discord:
        icon = Icons.discord;
        color = Colors.indigo;
        break;
      case LinkTypes.facebook:
        icon = Icons.facebook;
        color = Colors.blue;
        break;
      case LinkTypes.youtube:
        icon = FontAwesomeIcons.youtube;
        color = Colors.red;
        break;
      case LinkTypes.twitter:
        icon = FontAwesomeIcons.twitter;
        color = Colors.blue;
        break;
      case LinkTypes.instagram:
        icon = FontAwesomeIcons.instagram;
        color = Colors.purple;
        break;
      case LinkTypes.snapchat:
        icon = FontAwesomeIcons.snapchat;
        color = Colors.amber;
        break;
      default:
        icon = Icons.link;
    }
    return Icon(
      icon,
      color: color,
    );
  }
}
