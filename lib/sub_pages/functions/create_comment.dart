import 'package:akademi_etkinlik/widgets/appbar.dart';
import 'package:akademi_etkinlik/widgets/base.dart';
import 'package:akademi_etkinlik/widgets/buttons/configured/primary_button.dart';
import 'package:akademi_etkinlik/widgets/paragraph_field.dart';
import 'package:flutter/material.dart';

class CreateComment extends StatefulWidget {
  const CreateComment({super.key});

  @override
  State<CreateComment> createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {
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
            const ParagraphField(
              autofocus: true,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: "Paylaş",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
