import 'package:flutter/material.dart';

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  SlidePageRoute({required this.child, Color? barrierColor})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: const Duration(milliseconds: 320),
          reverseTransitionDuration: const Duration(milliseconds: 320),
          opaque: false,
          barrierDismissible: true,
          barrierColor: barrierColor,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
              .animate(
        animation.drive(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: child,
    );
  }
}
