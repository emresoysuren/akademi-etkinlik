import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Events extends ChangeNotifier {
  List<Event> events = [];

  getEvents() async {
    events = await DataService.getEvents();
    notifyListeners();
  }
}

final events = ChangeNotifierProvider((ref) => Events());
