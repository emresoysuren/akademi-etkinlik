import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/pages/utils/link_type.dart';
import 'package:flutter/material.dart';

class EventIcon extends StatelessWidget {
  final Event event;

  const EventIcon(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.link;
    if (event.link?.linkType() == LinkTypes.tiktok) {
      icon = Icons.tiktok;
    }
    if (event.link?.linkType() == LinkTypes.discord) {
      icon = Icons.discord;
    }
    if (event.link?.linkType() == LinkTypes.facebook) {
      icon = Icons.facebook;
    }
    return Icon(icon);
  }
}
