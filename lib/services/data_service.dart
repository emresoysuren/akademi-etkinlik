import 'package:akademi_etkinlik/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  static Future<List<Event>> getEvents() async {
    final QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection("events")
            // .where("date", ">=", "")
            .orderBy("date")
            .get();
    return documentSnapshot.docs.length > 25
        ? documentSnapshot.docs
            .sublist(0, 24)
            .map((e) => Event.fromMap(e.data()))
            .toList()
        : documentSnapshot.docs.map((e) => Event.fromMap(e.data())).toList();
  }

  static createEvent(Event event) async {
    await FirebaseFirestore.instance.collection("events").add(event.toMap());
  }
}
