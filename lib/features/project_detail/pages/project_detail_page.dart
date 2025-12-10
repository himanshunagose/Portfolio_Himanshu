import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/cursor_region.dart';
import '../../../data/models/project.dart';
 import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, this.project});

  static const routeName = '/project';

  final PortfolioProject? project;

  @override
  Widget build(BuildContext context) {
    final data = project ??
        const PortfolioProject(
          title: 'Signature Project',
          description:
          'Detailed project description goes here. Pass a PortfolioProject via Navigator.pushNamed to customize this view.',
          image: 'assets/images/project_finance.png',
          link: 'https://example.com',
          tags: ['Flutter', 'Web'],
          badges: ['Concept'],
        );

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------
                    // Project Image
                    // -------------------------
                    Expanded(
                      flex: isWide ? 5 : 0,
                      child: CursorRegion(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              data.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animate().fadeIn(duration: 400.ms).scale(),
                      ),
                    ),
                    if (isWide)
                      const SizedBox(width: 48)
                    else
                      const SizedBox(height: 32),

                    // -------------------------
                    // Project Details
                    // -------------------------
                    Expanded(
                      flex: isWide ? 4 : 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            data.description,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              height: 1.4,
                              color: theme.textTheme.bodyLarge?.color?.withOpacity(0.85),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // -------------------------
                          // Tags & Badges
                          // -------------------------
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              for (final tag in data.tags)
                                Chip(
                                  label: Text(tag),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                ),
                              for (final badge in data.badges)
                                Chip(
                                  avatar: const Icon(Icons.verified, size: 18),
                                  label: Text(badge),
                                  backgroundColor: theme.colorScheme.secondary.withOpacity(0.1),
                                ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // -------------------------
                          // Launch Button
                          // -------------------------
                          FilledButton.icon(
                            onPressed: () async {
                              final url = Uri.parse(data.link);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Could not launch URL')),
                                );
                              }
                            },
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('Launch Live Preview'),
                          ),
                        ],
                      ).animate().fadeIn(duration: 500.ms).slideX(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, this.project});

  static const routeName = '/project';

  final PortfolioProject? project;

  @override
  Widget build(BuildContext context) {
    final data = project ??
        const PortfolioProject(
          title: 'Signature Project',
          description:
              'Detailed project description goes here. Pass a PortfolioProject via Navigator.pushNamed to customize this view.',
          image: 'assets/images/project_finance.png',
          link: 'https://example.com',
          tags: ['Flutter', 'Web'],
          badges: ['Concept'],
        );

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isWide ? 5 : 0,
                      child: CursorRegion(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              data.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animate().fadeIn(duration: 400.ms).scale(),
                      ),
                    ),
                    if (isWide) const SizedBox(width: 48) else const SizedBox(height: 32),
                    Expanded(
                      flex: isWide ? 4 : 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            data.description,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              height: 1.4,
                              color: theme.textTheme.bodyLarge?.color?.withOpacity(0.85),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              for (final tag in data.tags)
                                Chip(
                                  label: Text(tag),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                ),
                              for (final badge in data.badges)
                                Chip(
                                  avatar: const Icon(Icons.verified, size: 18),
                                  label: Text(badge),
                                  backgroundColor: theme.colorScheme.secondary.withOpacity(0.1),
                                ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('Launch Live Preview'),
                          ),
                        ],
                      ).animate().fadeIn(duration: 500.ms).slideX(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/


