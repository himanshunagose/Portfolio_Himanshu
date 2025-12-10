import 'package:flutter/material.dart';

import 'models/experience.dart';
import 'models/project.dart';
import 'models/skill.dart';
import 'models/testimonial.dart';

class MockData {
/*
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
      label: 'Local Database',
      description: 'SQLite (Sqflite), Hive',
      value: 0.85,
      icon: Icons.storage, // better icon for local DB
    ),
    Skill(
      label: 'REST APIs',
      description: 'Typed network orchestration',
      value: 0.8,
      icon: Icons.api,
    ),
    Skill(
      label: 'State Management',
      description: 'Riverpod, Bloc, Provider, MVC , MVVM',
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
*/
  static const developmentSkills = [
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
      label: 'Local Database',
      description: 'SQLite (Sqflite), Hive',
      value: 0.85,
      icon: Icons.storage,
    ),
    Skill(
      label: 'REST APIs',
      description: 'Typed network orchestration',
      value: 0.8,
      icon: Icons.api,
    ),
    Skill(
      label: 'State Management',
      description: 'Riverpod, Bloc, Provider, MVC, MVVM',
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

  static const tools = [
    Skill(
      label: 'Android Studio',
      description: 'Primary IDE for Android & Flutter',
      value: 0.9,
      icon: Icons.android,
    ),
    Skill(
      label: 'VS Code',
      description: 'Lightweight extensible code editor',
      value: 0.92,
      icon: Icons.code_off,
    ),
    Skill(
      label: 'Postman',
      description: 'API testing & debugging',
      value: 0.85,
      icon: Icons.send_and_archive,
    ),
    Skill(
      label: 'Firebase Console',
      description: 'Cloud services, auth, analytics',
      value: 0.88,
      icon: Icons.cloud_outlined,
    ),
    Skill(
      label: 'Figma',
      description: 'UI/UX design & prototyping',
      value: 0.8,
      icon: Icons.design_services,
    ),
    Skill(
      label: 'Cursor AI',
      description: 'AI-powered coding workflow',
      value: 0.78,
      icon: Icons.smart_toy_outlined,
    ),
  ];

  static const experiences = [
   /* Experience(
      company: 'Flowbit Studio',
      role: 'Senior Flutter Engineer',
      period: '2021 — Present',
      description:
          'Leading the Flutter chapter delivering AAA mobile + web experiences for fintech and healthtech.',
      highlights: [
        'Scaled design system to 8 product squads',
        'Cut build times by 42% via modular architecture',
        'Shipped 4 Flutter Web dashboards with 99.9% uptime',
      ],
    ),*/
    Experience(
      company: 'Innavativebiz Technology',
      role: 'Flutter Developer',
      period: '2021 - Present', // You can add the actual dates, e.g., '2022 — Present'
      description: 'Worked on UI development for multiple Flutter applications, integrating REST APIs and creating reusable widgets for scalable solutions.',
      highlights: [
        'Developed clean and responsive UIs across multiple Flutter applications',
        'Integrated REST APIs for seamless backend communication',
        'Created reusable and scalable widgets to improve team productivity',
        'Managed state efficiently using GetX and Provider',
        'Read SOW (Scope of Work) and contributed to project planning and execution',
      ],
    )

    /*  Experience(
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
    ),*/
  ];

  static const projects = [
   /* PortfolioProject(
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
    ),*/
    PortfolioProject(
      title: 'Mera Agent App',
      description:
      'Real estate app for brokers to build a strong community and simplify property matching. Improved load speed by 30%, with GetX & Provider for efficient state management.',
      image: 'assets/images/project_real_estate.png', // Replace with actual image
      link: 'https://play.google.com/store/apps/details?id=com.My_agent.mera_agent', // Replace with actual link
      tags: ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Google Maps'],
      badges: ['Real Estate', 'Mobile App'],
    ),

    PortfolioProject(
      title: 'Grocery Delivery App',
      description:
      'Full-stack grocery app with authentication, cart, and payment features. Optimized load speed by 30%, using GetX for state management and Provider for cart management.',
      image: 'assets/images/project_grocery.png', // Replace with actual image
      link: 'https://github.com/himanshunagose/Food_Grocery-app', // Replace with actual GitHub link
      tags: ['Flutter', 'Dart', 'GetX', 'Provider'],
      badges: ['E-commerce', 'Mobile App'],
    ),

    PortfolioProject(
      title: 'Skill Connect Pro',
      description:
      'Front-end Flutter project for skill management. UI implemented with Provider for state management and SharedPreferences for local storage. Purely front-end focused.',
      image: 'assets/images/project_skills.png', // Replace with actual image
      link: 'https://github.com/himanshunagose/Skills_connect_to',
      tags: ['Flutter', 'Dart', 'Provider', 'SharedPreferences'],
      badges: ['Front-end', 'Portfolio Project'],
    ),

  ];

  static const testimonials = [
    Testimonial(
      name: '',
      role: 'CTO · Flowbit Studio',
      message:
          '“Himanshu rebuilt our design system and gave us full Flutter web parity. The craft level rivals the biggest design-led brands.”',
      avatar: 'assets/images/testimonial_one.png',
    ),
    /*Testimonial(
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
    ),*/
  ];
}

