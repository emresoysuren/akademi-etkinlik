import 'package:akademi_etkinlik/config/user.dart';
import 'package:akademi_etkinlik/models/announcement.dart';
import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/create/form/utils/form_code_generator.dart';

class DataService {
  // Event Functions
  static Future<List<Event>> getEvents() async {
    final QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection("events")
            .orderBy("date")
            .get();
    return documentSnapshot.docs.length > 25
        ? documentSnapshot.docs
            .sublist(0, 24)
            .map((e) => Event.fromMap(e.data()))
            .toList()
        : documentSnapshot.docs.map((e) {
            final m = e.data();
            m.addAll({"id": e.id});
            return Event.fromMap(m);
          }).toList();
  }

  static Future<void> createEvent(Event event) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance.collection("events").add(event.toMap());
  }

  static Future<void> deleteEvent(Event event) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("events")
        .doc(event.id)
        .delete();
  }

  static Future<void> editEvent(Event event) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("events")
        .doc(event.id)
        .set(event.toMap());
  }

  // Event Form Functions
  static Future<EventForm?>? getForm(Event event) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection("event-join-forms")
            .doc(event.id)
            .get();
    final map = documentSnapshot.data();
    if (map == null) return null;
    return EventForm.fromMap(map);
  }

  static Future<void> deleteForm(Event event) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("event-join-forms")
        .doc(event.id)
        .delete();
  }

  static Future<void> editForm(Event event, EventForm eventForm) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("event-join-forms")
        .doc(event.id)
        .set(eventForm.toMap());
  }

  // Announcement Functions
  static Future<List<Announcement>> getAnnouncements() async {
    final QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection("announcement")
            .orderBy("date")
            .get();
    return documentSnapshot.docs.length > 25
        ? documentSnapshot.docs
            .sublist(0, 24)
            .map((e) => Announcement.fromMap(e.data()))
            .toList()
        : documentSnapshot.docs.map((e) {
            final m = e.data();
            m.addAll({"id": e.id});
            return Announcement.fromMap(m);
          }).toList();
  }

  static Future<void> createAnnouncement(Announcement announcement) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("announcement")
        .add(announcement.toMap());
  }

  static Future<void> deleteAnnouncement(Announcement announcement) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("announcement")
        .doc(announcement.id)
        .delete();
  }

  static Future<void> editAnnouncement(Announcement announcement) async {
    // Only for admins
    if (!UserConfig.admin) return;
    await FirebaseFirestore.instance
        .collection("announcement")
        .doc(announcement.id)
        .set(announcement.toMap());
  }

  // Comment Functions
  static Future<List<Comment>> getComments(Event event) async {
    final QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection("events")
            .doc(event.id)
            .collection("comments")
            .orderBy("likes", descending: true)
            .get();
    return documentSnapshot.docs.length > 25
        ? documentSnapshot.docs
            .sublist(0, 24)
            .map((e) => Comment.fromMap(e.data()))
            .toList()
        : documentSnapshot.docs.map((e) {
            final m = e.data();
            m.addAll({"id": e.id});
            return Comment.fromMap(m);
          }).toList();
  }

  static Future<void> createComment(Event event, Comment comment) async {
    await FirebaseFirestore.instance
        .collection("events")
        .doc(event.id)
        .collection("comments")
        .add(comment.toMap());
  }

  static Future<void> deleteComment(Event event, Comment comment) async {
    await FirebaseFirestore.instance
        .collection("events")
        .doc(event.id)
        .collection("comments")
        .doc(comment.id)
        .delete();
  }

  static Future<void> editComment(Event event, Comment comment) async {
    await FirebaseFirestore.instance
        .collection("events")
        .doc(event.id)
        .collection("comments")
        .doc(comment.id)
        .set(comment.toMap());
  }

  static Future<void> likeComment(Event event, Comment comment) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final likes = comment.likes;
    if (likes?.contains(user.uid) == true) {
      likes!.remove(user.uid);
      await FirebaseFirestore.instance
          .collection("events")
          .doc(event.id)
          .collection("comments")
          .doc(comment.id)
          .set({"likes": likes}, SetOptions(merge: true));
    } else {
      final l = [user.uid, if (likes != null) ...likes];
      await FirebaseFirestore.instance
          .collection("events")
          .doc(event.id)
          .collection("comments")
          .doc(comment.id)
          .set({"likes": l}, SetOptions(merge: true));
    }
  }

  // Admin Functions
  static Future<bool> adminCheck() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return false;
    final snapshot =
        await FirebaseFirestore.instance.collection("app").doc("config").get();
    final list = snapshot.data()?["admins"];
    if (list == null || list is! List) return false;
    return list.contains(uid);
  }
}
