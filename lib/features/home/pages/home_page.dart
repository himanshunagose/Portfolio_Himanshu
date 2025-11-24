import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_breakpoints.dart';
import '../../../data/models/project.dart';
import '../../project_detail/pages/project_detail_page.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../sections/testimonials_section.dart';
import '../widgets/navigation_bar.dart';

enum HomeSection {
  hero('Hero'),
  about('About'),
  skills('Skills'),
  experience('Experience'),
  projects('Projects'),
  testimonials('Testimonials'),
  contact('Contact');

  const HomeSection(this.label);
  final String label;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final Map<HomeSection, GlobalKey> sectionKeys = {
    for (final section in HomeSection.values) section: GlobalKey(),
  };

  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!mounted) return;
    final shouldStick = scrollController.offset > 80;
    if (shouldStick != _scrolled) {
      setState(() => _scrolled = shouldStick);
    }
  }

  void _scrollTo(HomeSection section) {
    final keyContext = sectionKeys[section]?.currentContext;
    if (keyContext == null) return;
    Scrollable.ensureVisible(
      keyContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _openResume() async {
    final uri = Uri.parse('https://example.com/himanshu-resume.pdf');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resume link is temporarily unavailable.')),
      );
    }
  }

  void _openProjectDetails(PortfolioProject project) {
    Navigator.of(context).pushNamed(
      ProjectDetailPage.routeName,
      arguments: project,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizing) {
        final isDesktop = sizing.deviceScreenType == DeviceScreenType.desktop ||
            sizing.deviceScreenType == DeviceScreenType.tablet &&
                sizing.screenSize.width >= Breakpoints.desktop;
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeroSection(
                        key: sectionKeys[HomeSection.hero],
                        onResumeTap: _openResume,
                        onContactTap: () => _scrollTo(HomeSection.contact),
                      ),
                      AboutSection(key: sectionKeys[HomeSection.about]),
                      SkillsSection(key: sectionKeys[HomeSection.skills]),
                      ExperienceSection(key: sectionKeys[HomeSection.experience]),
                      ProjectsSection(
                        key: sectionKeys[HomeSection.projects],
                        onProjectTap: _openProjectDetails,
                      ),
                      TestimonialsSection(key: sectionKeys[HomeSection.testimonials]),
                      ContactSection(key: sectionKeys[HomeSection.contact]),
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 32 : 16,
                      vertical: isDesktop ? 12 : 8,
                    ),
                    child: HomeNavigationBar(
                      sections: HomeSection.values,
                      onSectionSelected: _scrollTo,
                      isElevated: _scrolled || isDesktop,
                      showLabels: isDesktop,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

