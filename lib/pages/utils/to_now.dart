import 'package:cloud_firestore/cloud_firestore.dart';

extension ToNow on Timestamp {
  Duration toNow() {
    final DateTime now = DateTime.now();
    final DateTime nowDate = DateTime(now.year, now.month, now.day);
    return toDate().difference(nowDate);
  }
}
