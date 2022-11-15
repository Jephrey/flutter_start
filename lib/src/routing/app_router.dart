import 'package:flutter/material.dart';
import 'package:flutter_start/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:flutter_start/src/features/home/presentation/settings_screen/settings_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  settings,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'settings',
          name: AppRoute.settings.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const SettingsScreen(),
          ),
        )
      ],
    ),
  ],
);
