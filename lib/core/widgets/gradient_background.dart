import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Provides a subtle diagonal gradient background used on every page.
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x0D6366F1),
            Color(0x120EA5E9),
            Color(0x0F14B8A6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -180,
            right: -120,
            child: Container(
              width: 420,
              height: 420,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0x22F472B6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -220,
            left: -120,
            child: Container(
              width: 520,
              height: 520,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0x2210B981),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.heroGradient,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

