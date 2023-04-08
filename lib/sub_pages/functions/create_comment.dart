import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/repository/comments_repo.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateComment extends ConsumerStatefulWidget {
  final Event event;

  const CreateComment({super.key, required this.event});

  @override
  ConsumerState<CreateComment> createState() => _CreateCommentState();
}

class _CreateCommentState extends ConsumerState<CreateComment> {
  String _content = "";

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: const Bar(
        title: "Yorum Ekle",
        popButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            ParagraphField(
              autofocus: true,
              onChanged: (value) {
                if (value != null) _content = value;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: "Paylaş",
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user == null || user.email == null) return;
                  await ref.read(commentsRepo).create(
                        widget.event,
                        Comment(
                          username: user.email!.split("@").first,
                          uid: user.uid,
                          content: _content,
                          date: Timestamp.now(),
                        ),
                      );
                  if (mounted) Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
