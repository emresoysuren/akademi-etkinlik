import 'package:akademi_etkinlik/models/comment.dart';
import 'package:akademi_etkinlik/models/event.dart';
import 'package:akademi_etkinlik/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsRepo extends ChangeNotifier {
  Future<List<Comment>> get(Event event) async {
    final result = await DataService.getComments(event);
    notifyListeners();
    return result;
  }

  Future<void> like(Event event, Comment comment) async {
    final result = await DataService.likeComment(event, comment);
    notifyListeners();
    return result;
  }

  Future<void> create(Event event, Comment comment) async {
    final result = await DataService.createComment(event, comment);
    notifyListeners();
    return result;
  }
}

final commentsRepo = ChangeNotifierProvider((ref) => CommentsRepo());
