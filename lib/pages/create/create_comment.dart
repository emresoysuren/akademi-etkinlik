import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/config/user.dart';
import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/repository/comments_repo.dart';
import 'package:akademi_etkinlik/sub_pages/cards/dialog.dart';
import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/buttons/single_button.dart';
import 'package:akademi_etkinlik/widgets/fields/paragraph_field.dart';
import 'package:akademi_etkinlik/widgets/flush_configured.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateComment extends ConsumerStatefulWidget {
  final Event event;
  final Comment? comment;

  const CreateComment({super.key, required this.event, this.comment});

  @override
  ConsumerState<CreateComment> createState() => _CreateCommentState();
}

class _CreateCommentState extends ConsumerState<CreateComment> {
  late String _content = widget.comment?.content ?? "";

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: Bar(
        title: widget.comment == null ? "Yorum Ekle" : "Yorumu Düzenle",
        popButton: true,
        children: [
          if (widget.comment != null)
            SingleButton(
              onPressed: () async {
                final bool? result = await Navigator.push<bool>(
                  context,
                  DialogRoute(
                    context: context,
                    builder: (context) => DialogCard(
                      title: "Yorumu Sil",
                      buttonText: "Sil",
                      text:
                          "Bu yorumu silmek istediğine emin misin? Bu işlem geri alınamaz.",
                      buttonColor: Colors.red,
                      buttonTextColor: Colors.red,
                      buttonPress: () async {
                        await ref.read(commentsRepo).delete(
                              widget.event,
                              widget.comment!,
                            );
                        if (mounted) Navigator.pop<bool>(context, true);
                      },
                    ),
                  ),
                );
                if (mounted && result == true) Navigator.pop(context);
              },
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.delete,
                size: 28,
                color: Colors.red.shade600,
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            ParagraphField(
              autofocus: true,
              initialValue: widget.comment?.content,
              onChanged: (value) {
                if (value != null) _content = value;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: widget.comment == null ? "Paylaş" : "Kaydet",
                onPressed: () async {
                  if (widget.comment != null) {
                    if (_content != widget.comment!.content) {
                      await ref.read(commentsRepo).edit(
                            widget.event,
                            Comment(
                              username: widget.comment!.username,
                              uid: widget.comment!.uid,
                              content: _content,
                              date: widget.comment!.date,
                              id: widget.comment?.id,
                              likes: widget.comment?.likes,
                            ),
                          );
                    }
                    if (mounted) Navigator.pop(context);
                  } else {
                    if (_content.isNotEmpty) {
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
                    } else {
                      flushBarShow(
                        context,
                        title: "Yorum Paylaşılamadı",
                        message:
                            "Yorum paylaşabilmek için bir mesaj yazmalısınız.",
                      );
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            if (UserConfig.admin && widget.comment != null)
              Text(
                (widget.comment!.uid == FirebaseAuth.instance.currentUser?.uid)
                    ? "Admin Uyarısı: Kendi yorumunu düzenliyorsun."
                    : "Admin Uyarısı: ${widget.comment!.username} adlı kullanıcının yorumunu düzenliyorsun.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.secondaryText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
