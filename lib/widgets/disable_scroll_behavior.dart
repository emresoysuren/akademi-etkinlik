import 'package:flutter/material.dart';

class DisableScrollBehavior extends StatelessWidget {
  final Widget child;

  const DisableScrollBehavior({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _DisabledScrollBehavior(),
      child: child,
    );
  }
}

class _DisabledScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
