import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/repository/comments_repo.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:akademi_etkinlik/widgets/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserComment extends ConsumerWidget {
  final Event event;
  final Comment comment;

  const UserComment({super.key, required this.comment, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool liked = FirebaseAuth.instance.currentUser != null
        ? comment.likes?.contains(FirebaseAuth.instance.currentUser!.uid) ==
            true
        : false;
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
                      iconColor: liked ? Colors.white : null,
                      padding: const EdgeInsets.all(6),
                      color: liked ? Colors.white : null,
                      backgroundColor:
                          liked ? Colors.red : ColorPalette.primaryBackground,
                      onPressed: () =>
                          ref.read(commentsRepo).like(event, comment),
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
