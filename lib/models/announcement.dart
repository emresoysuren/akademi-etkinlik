import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  final String title;
  final String content;
  final Timestamp date;
  final String? id;

  Announcement({
    required this.content,
    required this.title,
    required this.date,
    this.id,
  });

  Announcement.fromMap(Map m)
      : this(
          title: m["title"],
          content: m["content"],
          date: m["date"],
          id: m["id"],
        );

  Map<String, Object?> toMap() {
    return {
      "title": title,
      "content": content,
      "date": date,
    };
  }
}
