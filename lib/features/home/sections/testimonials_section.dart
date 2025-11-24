import 'package:flutter/material.dart';

import '../../../data/mock_data.dart';
import '../../common/widgets/section_title.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  late final PageController controller;
  double page = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.75)
      ..addListener(() {
        setState(() => page = controller.page ?? 0);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testimonials = MockData.testimonials;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'People are saying',
            subtitle: 'Testimonials',
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 320,
            child: PageView.builder(
              controller: controller,
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                final delta = (page - index).abs();
                final scale = (1 - (delta * 0.08)).clamp(0.9, 1.0);
                final opacity = (1 - (delta * 0.4)).clamp(0.3, 1.0);
                return Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: theme.colorScheme.surface.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 24),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(testimonial.avatar),
                            radius: 36,
                          ),
                          const SizedBox(height: 18),
                          Text(
                            testimonial.message,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(height: 1.5),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            testimonial.name,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            testimonial.role,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

