import 'package:akademi_etkinlik/pages/utils/form_code_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;
  final String content;
  final Timestamp date;
  final String? link;
  final String? id;
  final EventForm? joinForm;
  final EventForm? rateForm;

  Event({
    this.joinForm,
    this.rateForm,
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
          joinForm:
              m["join-form"] != null ? EventForm.fromMap(m["join-form"]) : null,
          rateForm:
              m["rate-form"] != null ? EventForm.fromMap(m["rate-form"]) : null,
        );

  Map<String, Object?> toMap() {
    return {
      "title": title,
      "content": content,
      "date": date,
      "link": link,
      "join-form": joinForm?.toMap(),
      "rate-form": rateForm?.toMap(),
    };
  }
}
