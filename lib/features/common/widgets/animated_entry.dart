import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedEntry extends StatelessWidget {
  const AnimatedEntry({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fadeIn(duration: 500.ms, curve: Curves.easeOutQuad)
        .slideY(begin: 0.06, curve: Curves.easeOut);
  }
}


