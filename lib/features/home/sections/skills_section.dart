import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../data/mock_data.dart';
import '../../../data/models/skill.dart';
import '../../common/widgets/section_title.dart';
/*

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Skills & Tooling',
            subtitle: 'Craft Stack',
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              for (final skill in MockData.skills)
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: theme.colorScheme.surface.withOpacity(0.6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(skill.icon, size: 32),
                      const SizedBox(height: 12),
                      Text(
                        skill.label,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        skill.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          height: 6,
                          child: LinearProgressIndicator(
                            value: skill.value,
                            backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.4),
                          ).animate().scaleX(
                                begin: 0,
                                end: 1,
                                duration: 600.ms,
                                curve: Curves.easeOut,
                              ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 500.ms),
            ],
          ),
        ],
      ),
    );
  }
}

*/

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Skills & Tooling',
            subtitle: 'Craft Stack',
          ),

          const SizedBox(height: 48),

          // ---------------------
          // Development Skills
          // ---------------------
          Text(
            "Development Skills",
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              for (final skill in MockData.developmentSkills)
                _buildSkillCard(skill, theme),
            ],
          ),

          const SizedBox(height: 48),

          // ---------------------
          // Tools
          // ---------------------
          Text(
            "Tools",
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              for (final tool in MockData.tools)
                _buildSkillCard(tool, theme),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildSkillCard(Skill skill, ThemeData theme) {
  return Container(
    width: 320,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: theme.colorScheme.surface.withOpacity(0.6),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 30,
          offset: const Offset(0, 20),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(skill.icon, size: 32),
        const SizedBox(height: 12),
        Text(
          skill.label,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          skill.description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 18),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            height: 6,
            child: LinearProgressIndicator(
              value: skill.value,
              backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.4),
            ).animate().scaleX(
              begin: 0,
              end: 1,
              duration: 600.ms,
              curve: Curves.easeOut,
            ),
          ),
        ),
      ],
    ),
  ).animate().fadeIn(duration: 500.ms);
}

