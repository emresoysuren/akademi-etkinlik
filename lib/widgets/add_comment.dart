import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/sub_pages/functions/create_comment.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/routes/nonanimated.dart';
import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<String>(
          context,
          NonAnimatedPageRoute(
            builder: (context) => const CreateComment(),
          ),
        );
      },
      child: Material(
        color: ColorPalette.primaryBackground,
        elevation: 2,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: BaseCore(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Yorum ekle...",
              style: TextStyle(
                fontSize: 14,
                color: ColorPalette.secondaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
