import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;
  final String content;
  final Timestamp date;
  final String? link;
  final String? id;

  Event({
    required this.content,
    this.link,
    required this.title,
    required this.date,
    this.id,
  });

  Event.fromMap(Map m)
      : this(
          title: m["title"],
          content: m["content"],
          date: m["date"],
          link: m["link"],
          id: m["id"],
        );

  Map<String, Object?> toMap() {
    return {
      "title": title,
      "content": content,
      "date": date,
      "link": link,
    };
  }
}
