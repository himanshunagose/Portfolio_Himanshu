import 'package:flutter/material.dart';

import 'models/experience.dart';
import 'models/project.dart';
import 'models/skill.dart';
import 'models/testimonial.dart';

class MockData {
  static const skills = [
    Skill(
      label: 'Flutter',
      description: 'Pixel-perfect apps for every screen',
      value: 0.95,
      icon: Icons.flutter_dash,
    ),
    Skill(
      label: 'Dart',
      description: 'Null-safe, reactive architectures',
      value: 0.9,
      icon: Icons.code,
    ),
    Skill(
      label: 'Firebase',
      description: 'Realtime data & serverless backends',
      value: 0.85,
      icon: Icons.cloud,
    ),
    Skill(
      label: 'REST APIs',
      description: 'Typed network orchestration',
      value: 0.8,
      icon: Icons.api,
    ),
    Skill(
      label: 'State Management',
      description: 'Riverpod, Bloc, Provider, MVC',
      value: 0.88,
      icon: Icons.device_hub,
    ),
    Skill(
      label: 'CI/CD',
      description: 'Codemagic, GitHub Actions',
      value: 0.75,
      icon: Icons.build_circle,
    ),
  ];

  static const experiences = [
    Experience(
      company: 'Flowbit Studio',
      role: 'Senior Flutter Engineer',
      period: '2023 — Present',
      description:
          'Leading the Flutter chapter delivering AAA mobile + web experiences for fintech and healthtech.',
      highlights: [
        'Scaled design system to 8 product squads',
        'Cut build times by 42% via modular architecture',
        'Shipped 4 Flutter Web dashboards with 99.9% uptime',
      ],
    ),
    Experience(
      company: 'Nimbus Apps',
      role: 'Flutter Developer',
      period: '2021 — 2023',
      description:
          'Owned end-to-end delivery for consumer super apps reaching 400k MAU across platforms.',
      highlights: [
        'Implemented realtime sync using Firebase & gRPC',
        'Introduced golden tests and contract testing',
        'Mentored 5 junior Flutter devs',
      ],
    ),
    Experience(
      company: 'Freelance',
      role: 'Product-focused Flutter Consultant',
      period: '2018 — 2021',
      description:
          'Partnered with founders to turn Figma boards into polished Flutter experiences in weeks, not months.',
      highlights: [
        'Delivered 30+ MVPs for health, travel, crypto and retail',
        'Created component library now used by 12+ startups',
      ],
    ),
  ];

  static const projects = [
    PortfolioProject(
      title: 'Neobit Banking OS',
      description:
          'A modern banking platform with adaptive dashboards, biometric auth, and AI-powered insights.',
      image: 'assets/images/project_finance.png',
      link: 'https://example.com/neobit',
      tags: ['Flutter Web', 'Firebase', 'Riverpod'],
      badges: ['Fintech', 'Enterprise'],
    ),
    PortfolioProject(
      title: 'PulseCare Telehealth',
      description:
          'HIPAA compliant telehealth suite with ultra-low latency video calls and wearable integrations.',
      image: 'assets/images/project_iot.png',
      link: 'https://example.com/pulsecare',
      tags: ['Flutter', 'BLE', 'Realtime'],
      badges: ['Healthcare', 'IoT'],
    ),
    PortfolioProject(
      title: 'Orbit Collab',
      description:
          'Cross-platform productivity OS with synced docs, spaces, and AI copilots for remote teams.',
      image: 'assets/images/project_chat.png',
      link: 'https://example.com/orbit',
      tags: ['Flutter Desktop', 'WebSockets'],
      badges: ['SaaS', 'Collaboration'],
    ),
  ];

  static const testimonials = [
    Testimonial(
      name: 'Sofia Park',
      role: 'CTO · Flowbit Studio',
      message:
          '“Himanshu rebuilt our design system and gave us full Flutter web parity. The craft level rivals the biggest design-led brands.”',
      avatar: 'assets/images/testimonial_one.png',
    ),
    Testimonial(
      name: 'Mateo Silva',
      role: 'Product Lead · Nimbus',
      message:
          '“Ship velocity doubled after he introduced clean architecture + CI/CD. Every release feels premium.”',
      avatar: 'assets/images/testimonial_two.png',
    ),
    Testimonial(
      name: 'Ada Coleman',
      role: 'Founder · PulseCare',
      message:
          '“He prototypes complex flows in days and obsesses over micro-details — from cursor physics to keyboard UX.”',
      avatar: 'assets/images/testimonial_three.png',
    ),
  ];
}

