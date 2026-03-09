import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/cursor_region.dart';
import '../../../data/models/project.dart';
 import 'package:url_launcher/url_launcher.dart';

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
                            SizedBox(height: 10,),
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
*/

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
          playStoreLink: 'https://example.com',
          githubLink: 'https://github.com',
          tags: ['Flutter', 'Web'],
          badges: ['Concept'],
        );

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 900;
    final isDesktop = size.width >= 900;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0A0A) : Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back_rounded),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          data.title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: isMobile,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 32,
              vertical: isMobile ? 24 : 48,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Column(
                  children: [
                    // Hero Section with Glassmorphism Effect
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isMobile ? 20 : 32),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDark
                              ? [
                            Colors.grey.shade900.withOpacity(0.5),
                            Colors.grey.shade800.withOpacity(0.3),
                          ]
                              : [
                            Colors.white,
                            Colors.grey.shade50,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.grey.shade200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Flex(
                        direction: isDesktop
                            ? Axis.horizontal
                            : Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Project Image with Modern Effects
                          Expanded(
                            flex: isDesktop ? 5 : 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.primaryColor.withOpacity(0.3),
                                    blurRadius: 30,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.asset(
                                    data.image,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey.shade800,
                                        child: Center(
                                          child: Icon(
                                            Icons.broken_image,
                                            size: 50,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ).animate().fadeIn(
                                duration: 600.ms,
                                curve: Curves.easeOutQuad,
                              ).scale(
                                begin: const Offset(0.95, 0.95),
                                curve: Curves.easeOutQuad,
                              ),
                            ),
                          ),

                          if (isDesktop)
                            const SizedBox(width: 48)
                          else
                            const SizedBox(height: 32),

                          // Project Details with Modern Typography
                          Expanded(
                            flex: isDesktop ? 4 : 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title with Gradient Effect
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      theme.colorScheme.primary,
                                      theme.colorScheme.secondary,
                                    ],
                                  ).createShader(bounds),
                                  child: Text(
                                    data.title,
                                    style: theme.textTheme.displaySmall?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: isMobile ? 28 : 36,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Description with Better Readability
                                Text(
                                  data.description,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    height: 1.6,
                                    fontSize: isMobile ? 16 : 18,
                                    color: isDark
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Modern Tags & Badges Section
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    // Tech Tags
                                    for (final tag in data.tags)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              theme.colorScheme.primary.withOpacity(0.1),
                                              theme.colorScheme.secondary.withOpacity(0.1),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(
                                            color: theme.colorScheme.primary.withOpacity(0.2),
                                          ),
                                        ),
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            color: theme.colorScheme.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),

                                    // Badges with Icons
                                    for (final badge in data.badges)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.secondary.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(
                                            color: theme.colorScheme.secondary.withOpacity(0.3),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              size: 16,
                                              color: theme.colorScheme.secondary,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              badge,
                                              style: TextStyle(
                                                color: theme.colorScheme.secondary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                // Modern Action Buttons Section
                                // if(data.playStoreLink != null)
                                Container(
                                  padding: EdgeInsets.all(isMobile ? 16 : 20),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? Colors.grey.shade900.withOpacity(0.5)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: isDark
                                          ? Colors.white.withOpacity(0.1)
                                          : Colors.grey.shade200,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Available on',
                                        style: theme.textTheme.titleSmall?.copyWith(
                                          color: isDark
                                              ? Colors.grey.shade400
                                              : Colors.grey.shade600,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      // Play Store Button
                                      if (data.playStoreLink != null)
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: _buildModernButton(
                                            context: context,
                                            label: 'Google Play',
                                            icon: Icons.play_arrow_rounded,
                                            color: Colors.green,
                                            url: data.playStoreLink!,
                                            isMobile: isMobile,
                                          ),
                                        ),

                                      // App Store Button
                                      if (data.appStoreLink != null)
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: _buildModernButton(
                                            context: context,
                                            label: 'App Store',
                                            icon: Icons.apple,
                                            color: Colors.blue,
                                            url: data.appStoreLink!,
                                            isMobile: isMobile,
                                          ),
                                        ),

                                      // GitHub Button
                                      if (data.githubLink != null)
                                        _buildModernButton(
                                          context: context,
                                          label: 'View Source Code',
                                          icon: Icons.code_rounded,
                                          color: Colors.grey.shade800,
                                          url: data.githubLink!,
                                          isMobile: isMobile,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ).animate().fadeIn(
                              duration: 700.ms,
                              delay: 200.ms,
                            ).slideX(
                              begin: 0.1,
                              curve: Curves.easeOutQuad,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Additional Info Section for Desktop
                    if(data.playStoreLink != null)
                    if (isDesktop) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isDark
                                ? [
                              Colors.grey.shade900.withOpacity(0.3),
                              Colors.grey.shade800.withOpacity(0.3),
                            ]
                                : [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatCard(
                              icon: Icons.download_rounded,
                              value: '1K+',
                              label: 'Downloads',
                              color: theme.colorScheme.primary,
                              isDark: isDark,
                            ),
                            _buildStatCard(
                              icon: Icons.star_rounded,
                              value: '4.8',
                              label: 'Rating',
                              color: Colors.amber,
                              isDark: isDark,
                            ),
                            _buildStatCard(
                              icon: Icons.update_rounded,
                              value: 'v2.0',
                              label: 'Latest Version',
                              color: theme.colorScheme.secondary,
                              isDark: isDark,
                            ),
                          ],
                        ),
                      ).animate().fadeIn(
                        duration: 500.ms,
                        delay: 400.ms,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildModernButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required String url,
    required bool isMobile,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not open $label'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    required bool isDark,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : Colors.grey.shade900,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
        ),
      ],
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


