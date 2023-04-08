import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateComment extends StatefulWidget {
  final Event event;

  const CreateComment({super.key, required this.event});

  @override
  State<CreateComment> createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {
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
                  await DataService.createComment(
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
