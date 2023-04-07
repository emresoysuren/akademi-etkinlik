import 'package:cloud_firestore/cloud_firestore.dart';

extension DateString on Timestamp {
  toDateString() {
    return "${toDate().day}/${toDate().month}/${toDate().year} ${toDate().hour}:${toDate().minute.toString().padLeft(2, "0")}";
  }
}
