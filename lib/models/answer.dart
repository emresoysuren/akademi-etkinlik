import 'package:akademi_etkinlik/pages/utils/form_code_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {
  final Timestamp date;
  final String username;
  final String uid;
  final EventForm form;

  Answer({
    required this.form,
    required this.username,
    required this.uid,
    required this.date,
  });

  Answer.fromMap(Map m)
      : this(
          uid: m["uid"],
          username: m["username"],
          form: EventForm.fromMap(m["form"]),
          date: m["date"],
        );

  Map<String, Object?> toMap() {
    return {
      "uid": uid,
      "form": form.toMap(),
      "date": date,
      "username": username,
    };
  }
}
