import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

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

/*  @override
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
  }*/

  Widget build(BuildContext context) {
    final isLoading = false; // Replace with your real loading state

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

              final itemWidth =
                  (width - (crossAxisCount - 1) * 24) / crossAxisCount;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  if (isLoading)
                    ...List.generate(
                      6, // number of shimmer items
                          (_) => SizedBox(
                        width: itemWidth,
                        child: _ShimmerProjectCard(),
                      ),
                    )
                  else
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
    final isDark = theme.brightness == Brightness.dark;

    // Check if project is live on any store
    final isLiveOnStores = widget.project.playStoreLink != null ||
        widget.project.appStoreLink != null;

    // Get platform availability
    final hasPlayStore = widget.project.playStoreLink != null;
    final hasAppStore = widget.project.appStoreLink != null;
    final hasGitHub = widget.project.githubLink != null;

    return CursorRegion(
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0.0, hover ? -12.0 : 0.0)
            ..scale(hover ? 1.02 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                theme.colorScheme.surface.withOpacity(0.8),
                theme.colorScheme.surface.withOpacity(0.6),
              ]
                  : [
                Colors.white,
                Colors.grey.shade50,
              ],
            ),
            border: Border.all(
              color: hover
                  ? theme.colorScheme.primary.withOpacity(0.5)
                  : isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.grey.shade200,
              width: hover ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: (hover
                    ? theme.colorScheme.primary
                    : Colors.black).withOpacity(hover ? 0.25 : 0.1),
                blurRadius: hover ? 40 : 20,
                offset: Offset(0, hover ? 15 : 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Section with Overlay Badges
                Stack(
                  children: [
                    // Project Image
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        widget.project.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade800,
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 40,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Live Status Badge (if live on stores)
                    if (isLiveOnStores)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF00C853),
                                Color(0xFF69F0AE),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.circle_rounded,
                                color: Colors.white,
                                size: 8,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'LIVE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ).animate()
                            .scale(duration: 500.ms, delay: 200.ms)
                            .shimmer(duration: 1500.ms, color: Colors.white30),
                      ),

                    // Platform Icons
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Row(
                        children: [
                          if (hasPlayStore)
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          if (hasAppStore) ...[
                            if (hasPlayStore) const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: const Icon(
                                Icons.apple,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                          if (hasGitHub && !hasPlayStore && !hasAppStore) ...[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: const Icon(
                                Icons.code_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with Gradient on Hover
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: hover
                              ? [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ]
                              : [
                            isDark ? Colors.white : Colors.black87,
                            isDark ? Colors.white70 : Colors.black54,
                          ],
                        ).createShader(bounds),
                        child: Text(
                          widget.project.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Description with max lines
                      Text(
                        widget.project.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                          color: isDark
                              ? Colors.grey.shade400
                              : Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Tags with improved styling
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final tag in widget.project.tags.take(3))
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: theme.colorScheme.primary.withOpacity(0.2),
                                ),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          if (widget.project.tags.length > 3)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '+${widget.project.tags.length - 3}',
                                style: TextStyle(
                                  color: isDark
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade700,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Action Row with Dynamic Content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // View Details with animated arrow
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Row(
                              children: [
                                Text(
                                  isLiveOnStores ? 'View App' : 'View Project',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: hover
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.primary.withOpacity(0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  transform: Matrix4.identity()
                                    ..translate(hover ? 5.0 : 0.0),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18,
                                    color: hover
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.primary.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Platform Availability Badges
                          Row(
                            children: [
                              if (hasPlayStore)
                                Tooltip(
                                  message: 'Available on Google Play',
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              if (hasAppStore) ...[
                                const SizedBox(width: 4),
                                Tooltip(
                                  message: 'Available on App Store',
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.apple,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                              if (hasGitHub && !hasPlayStore && !hasAppStore)
                                Tooltip(
                                  message: 'View on GitHub',
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.code_rounded,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ).animate().fadeIn(
          duration: 400.ms,
          curve: Curves.easeOutQuad,
        ),
      ),
    );
  }
}

class _ShimmerProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 12),

            // Title placeholder
            Container(
              height: 16,
              width: 150,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 8),

            // Subtitle placeholder
            Container(
              height: 14,
              width: 80,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
