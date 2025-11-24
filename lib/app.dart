import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/utils/cursor_controller.dart';
import 'core/widgets/cursor_overlay.dart';
import 'core/widgets/gradient_background.dart';
import 'router/app_router.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => CursorController()),
      ],
      child: Consumer<ThemeController>(
        builder: (_, themeController, __) {
          return MaterialApp(
            title: 'Himanshu · Flutter Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeController.mode,
            builder: (context, child) {
              return CursorOverlay(
                child: GradientBackground(
                  child: child ?? const SizedBox.shrink(),
                ),
              );
            },
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}

