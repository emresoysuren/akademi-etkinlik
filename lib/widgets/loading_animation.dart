import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      size: 32,
      color: Colors.blue,
      secondRingColor: Colors.red,
      thirdRingColor: Colors.green,
    );
  }
}
