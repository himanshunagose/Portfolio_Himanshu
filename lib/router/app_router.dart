import 'package:flutter/material.dart';

import '../data/models/project.dart';
import '../features/home/pages/home_page.dart';
import '../features/project_detail/pages/project_detail_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case ProjectDetailPage.routeName:
        page = ProjectDetailPage(
          project: settings.arguments as PortfolioProject?,
        );
        break;
      case '/':
      default:
        page = const HomePage();
    }

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, animation, secondaryAnimation) => FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.02),
            end: Offset.zero,
          ).animate(animation),
          child: page,
        ),
      ),
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: child,
        );
      },
    );
  }
}


