import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final List? likes;
  final String content;
  final Timestamp date;
  final String username;
  final String uid;
  final String? id;

  Comment({
    this.likes,
    required this.username,
    required this.uid,
    required this.content,
    required this.date,
    this.id,
  });

  Comment.fromMap(Map m)
      : this(
          uid: m["uid"],
          username: m["username"],
          likes: m["likes"],
          content: m["content"],
          date: m["date"],
          id: m["id"],
        );

  Map<String, Object?> toMap() {
    return {
      "uid": uid,
      "content": content,
      "date": date,
      "username": username,
      "likes": likes,
    };
  }
}
