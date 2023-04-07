import 'package:akademi_etkinlik/config/config.dart';
import 'package:akademi_etkinlik/widgets/buttons/plain_text_button.dart';
import 'package:akademi_etkinlik/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  final String? username;
  final String? text;

  const UserComment({super.key, this.username, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: ColorPalette.primaryBackground,
            radius: 32,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username ?? "unknown",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.primaryText,
                      ),
                    ),
                    const SizedBox(width: 8),
                    PlainTextButton(
                      icon: Icons.favorite,
                      text: "1.2k",
                      fontSize: 14,
                      iconSize: 18,
                      padding: const EdgeInsets.all(6),
                      backgroundColor: ColorPalette.primaryBackground,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                ExpandableText(
                  maxLines: 4,
                  text: text ?? "",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
