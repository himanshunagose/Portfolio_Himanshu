import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  final String title;
  final String subtitle;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          subtitle.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
            color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 64,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4F46E5), Color(0xFF0EA5E9)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ).animate().fadeIn(duration: 400.ms),
      ],
    );
  }
}


