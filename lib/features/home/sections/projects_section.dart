import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/widgets/cursor_region.dart';
import '../../../data/mock_data.dart';
import '../../../data/models/project.dart';
import '../../common/widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.onProjectTap,
  });

  final ValueChanged<PortfolioProject> onProjectTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Selected Projects',
            subtitle: 'Proof of craft',
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final crossAxisCount = width > 1200
                  ? 3
                  : width > 900
                      ? 2
                      : 1;
              final itemWidth = (width - (crossAxisCount - 1) * 24) / crossAxisCount;
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  for (final project in MockData.projects)
                    SizedBox(
                      width: itemWidth,
                      child: _ProjectCard(
                        project: project,
                        onTap: () => onProjectTap(project),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.project,
    required this.onTap,
  });

  final PortfolioProject project;
  final VoidCallback onTap;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CursorRegion(
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.identity()
            ..translate(0.0, hover ? -10.0 : 0.0)
            ..scale(hover ? 1.01 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: theme.colorScheme.surface.withOpacity(0.75),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(hover ? 0.4 : 0.15),
                blurRadius: hover ? 50 : 30,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    widget.project.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.project.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                          color: theme.textTheme.bodyMedium?.color?.withOpacity(0.75),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final tag in widget.project.tags)
                            Chip(
                              label: Text(tag),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          for (final badge in widget.project.badges)
                            Chip(
                              avatar: const Icon(Icons.verified_rounded, size: 18),
                              label: Text(badge),
                              backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'View case study',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.north_east, size: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 400.ms),
      ),
    );
  }
}

