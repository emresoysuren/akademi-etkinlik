import 'package:flutter/material.dart';

class NonAnimatedPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  NonAnimatedPageRoute({required this.builder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get barrierDismissible => false;

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
