import 'package:flutter/material.dart';

import '../../common/widgets/animated_entry.dart';
import '../../common/widgets/glass_card.dart';
import '../../common/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'About Me',
            subtitle: 'Human + Craft',
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: const [
              _AboutCard(
                title: 'Product mindset',
                description:
                    'Obsessed with pairing world-class UX with scalable engineering. Every interaction is sweated over.',
              ),
              _AboutCard(
                title: 'Full stack Flutter',
                description:
                    'From adaptive layouts and shader art to Firebase, app flavors, and multi-env CI/CD.',
              ),
              _AboutCard(
                title: 'Leader & collaborator',
                description:
                    'Partner closely with design, backend, QA, and founders to ship cohesive releases under rapid timelines.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: AnimatedEntry(
        child: GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


