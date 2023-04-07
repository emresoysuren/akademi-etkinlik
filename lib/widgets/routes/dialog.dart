import 'package:flutter/material.dart';

class DialogPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  DialogPageRoute({required this.builder});

  @override
  Color? get barrierColor => const Color(0x80000000);

  @override
  String? get barrierLabel => null;

  @override
  bool get barrierDismissible => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  bool get maintainState => false;

  @override
  Duration get transitionDuration => Duration.zero;
}
