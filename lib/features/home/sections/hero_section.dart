import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_breakpoints.dart';
import '../../common/widgets/primary_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({
    super.key,
    required this.onResumeTap,
    required this.onContactTap,
  });

  final VoidCallback onResumeTap;
  final VoidCallback onContactTap;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  Offset pointerOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isDesktop = width >= Breakpoints.desktop;

        return MouseRegion(
          onHover: (event) {
            if (!isDesktop) return;
            setState(() {
              pointerOffset = Offset(
                (event.localPosition.dx / width) - 0.5,
                (event.localPosition.dy / 400) - 0.5,
              );
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 120 : 24,
              vertical: isDesktop ? 160 : 100,
            ),
            constraints: const BoxConstraints(minHeight: 640),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: isDesktop ? 6 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter Engineer · Product Designer',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  letterSpacing: 2.2,
                                  color: Colors.white60,
                                ),
                          ).animate().fadeIn(duration: 400.ms).slideY(),
                          const SizedBox(height: 24),
                          Text(
                            'Crafting ultra-modern Flutter experiences\nthat feel as premium as Apple and as fast as Stripe.',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  height: 1.1,
                                ),
                          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),
                          const SizedBox(height: 24),
                          Text(
                            'I partner with ambitious teams to ship delightful Flutter apps across mobile, web, desktop, and embedded.',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white70,
                                  height: 1.5,
                                ),
                          ),
                          const SizedBox(height: 32),
                          Wrap(
                            spacing: 18,
                            runSpacing: 18,
                            children: [
                              PrimaryButton(
                                label: 'Download Resume',
                                icon: Icons.download_rounded,
                                onPressed: widget.onResumeTap,
                              ),
                              PrimaryButton(
                                label: 'Contact Me',
                                icon: Icons.mail_outline,
                                variant: ButtonVariant.ghost,
                                onPressed: widget.onContactTap,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    if (isDesktop)
                      Expanded(
                        flex: 5,
                        child: Transform.translate(
                          offset: pointerOffset * 40,
                          child: AspectRatio(
                            aspectRatio: 4 / 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1F2933),
                                    Color(0xFF0F172A),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 60,
                                    offset: const Offset(0, 40),
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/hero_portrait.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.all(24),
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '6+ Years',
                                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                'Building Flutter products',
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: Colors.white70,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.auto_awesome_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animate().fadeIn(duration: 800.ms).scale(),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
                if (!isDesktop) ...[
                  const SizedBox(height: 48),
                  AspectRatio(
                    aspectRatio: 4 / 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.asset(
                        'assets/images/hero_portrait.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms),
                  const SizedBox(height: 32),
                ],
                const SizedBox(height: 120),
              ],
            ),
          ),
        );
      },
    );
  }
}

