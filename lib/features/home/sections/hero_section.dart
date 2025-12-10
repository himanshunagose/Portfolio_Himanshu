import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final gradientColors = isDark
        ? const [
      Color(0xFF9ADCFF),
      Color(0xFFB28DFF),
      Color(0xFFFF92DF),
    ]
        : const [
      Color(0xFF2A2A72),
      Color(0xFF009FFD),
      Color(0xFF2A52BE),
    ];
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

                          /// ROLE TEXT
                          Text(
                            // 'Flutter Engineer · Product Designer',
                            'Engineer · Product Designer',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: isDark ? Colors.white70 : Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.8,
                            ),
                          ).animate().fadeIn().slideY(),

                          const SizedBox(height: 32),

                          /// THEME SAFE GRADIENT HEADER
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: gradientColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: Text(
                              'Building Flawless & Future-Ready Flutter Experiences.',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: Colors.white,
                                fontSize: isDesktop ? 52 : 35,
                                fontWeight: FontWeight.w900,
                                height: 1.1,
                                letterSpacing: -1,
                              ),
                            ),
                          ).animate().fadeIn().slideY(begin: 0.2),

                          const SizedBox(height: 28),

                          /// SUBTITLE
                          Text(
                            'I help ambitious teams craft next-gen apps across mobile, web, and desktop — '
                                'with delightful UI, smooth animations, and production-grade architecture.',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: isDark ? Colors.white60 : Colors.black87,
                              fontSize: 18,
                              height: 1.6,
                            ),
                          ).animate().fadeIn(),

                          const SizedBox(height: 38),

                          /// BUTTONS
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
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
                          ).animate().fadeIn().slideY(begin: 0.08),
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
                                    child:
                                    Lottie.asset('lottie/hello1.json')
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.all(24),
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1+ Years',
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
                      child:
                      Lottie.asset('lottie/hello1.json'),
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

