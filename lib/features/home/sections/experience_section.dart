import 'package:flutter/material.dart';

import '../../../data/mock_data.dart';
import '../../../data/models/experience.dart';
import '../../common/widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final timeline = MockData.experiences;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Experience Timeline',
            subtitle: 'Impact over years',
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              for (var i = 0; i < timeline.length; i++)
                _TimelineTile(
                  experience: timeline[i],
                  isLast: i == timeline.length - 1,
                  theme: theme,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({
    required this.experience,
    required this.isLast,
    required this.theme,
  });

  final Experience experience;
  final bool isLast;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF0EA5E9)],
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 4,
                  height: 140,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary.withOpacity(0.4),
                        theme.colorScheme.primary.withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: theme.colorScheme.surface.withOpacity(0.65),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.period,
                    style: theme.textTheme.labelLarge?.copyWith(
                      letterSpacing: 2,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${experience.role} · ${experience.company}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    experience.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (final bullet in experience.highlights)
                        Chip(
                          avatar: const Icon(Icons.auto_awesome, size: 18),
                          label: Text(bullet),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

