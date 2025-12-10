import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_controller.dart';
import '../pages/home_page.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    super.key,
    required this.sections,
    required this.onSectionSelected,
    this.isElevated = false,
    this.showLabels = true,
  });

  final List<HomeSection> sections;
  final ValueChanged<HomeSection> onSectionSelected;
  final bool isElevated;
  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.surface.withOpacity(0.08);

    final navItems = [
      for (final section in sections)
        TextButton(
          onPressed: () => onSectionSelected(section),
          child: Text(section.label),
        ),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
            ),
            boxShadow: [
              if (isElevated)
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 18),
                ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
              children: [
                _Logo(theme: theme),
                const Spacer(),
                if (showLabels) ...[
                  for (final item in navItems) item,
                  const SizedBox(width: 12),
                ] else
                  IconButton(
                    onPressed: () => _showSheet(context),
                    icon: const Icon(Icons.menu_rounded),
                  ),
                const SizedBox(width: 8),
                _ThemeToggleButton(
                  onPressed: () => context.read<ThemeController>().toggle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final theme = Theme.of(context);
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: theme.colorScheme.surface.withOpacity(0.95),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              for (final section in sections) ...[
                ListTile(
                  title: Text(section.label),
                  trailing: const Icon(Icons.arrow_outward),
                  onTap: () {
                    Navigator.of(context).pop();
                    onSectionSelected(section);
                  },
                ),
                const Divider(height: 0, thickness: 0.2),
              ],
            ],
          ),
        );
      },
    );
  }*/
  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final theme = Theme.of(context);

        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (_, controller) {
            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: theme.colorScheme.surface.withOpacity(0.95),
              ),
              child: Column(
                children: [
                  Container(
                    width: 42,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  /// SCROLLABLE LIST
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: sections.length,
                      itemBuilder: (_, index) {
                        final section = sections[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(section.label),
                              trailing: const Icon(Icons.arrow_outward),
                              onTap: () {
                                Navigator.of(context).pop();
                                onSectionSelected(section);
                              },
                            ),
                            const Divider(height: 0, thickness: 0.2),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}

class _Logo extends StatelessWidget {
  const _Logo({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFF4F46E5),
                Color(0xFF0EA5E9),
              ],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            'H',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Himanshu.dev',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeController>().isDark;
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Icon(
          isDark ? Icons.wb_sunny_rounded : Icons.dark_mode_rounded,
          key: ValueKey(isDark),
        ),
      ),
    );
  }
}


