import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:akademi_etkinlik/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  final Event event;
  final Comment comment;

  const UserComment({super.key, required this.comment, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Material(
            elevation: 2,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: ColorPalette.primaryBackground,
              radius: 32,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.username,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.primaryText,
                      ),
                    ),
                    const SizedBox(width: 8),
                    PlainTextButton(
                      icon: Icons.favorite,
                      text: (comment.likes?.length ?? 0).toString(),
                      fontSize: 14,
                      iconSize: 18,
                      elevation: 2,
                      padding: const EdgeInsets.all(6),
                      backgroundColor: ColorPalette.primaryBackground,
                      onPressed: () => DataService.likeComment(event, comment),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                ExpandableText(
                  maxLines: 4,
                  text: comment.content,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
