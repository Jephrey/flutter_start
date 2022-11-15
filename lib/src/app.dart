import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_start/src/routing/app_router.dart';

import 'features/home/presentation/settings_screen/settings_screen.dart';

// References.
// Material 3: https://dartling.dev/dynamic-theme-color-material-3-you-flutter

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
  );

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useMaterial3 = ref.watch(material3Provider);
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        theme: ThemeData(
          colorScheme: useMaterial3
              ? lightColorScheme ?? _defaultLightColorScheme
              : _defaultLightColorScheme,
          useMaterial3: useMaterial3,
        ),
        darkTheme: ThemeData(
          colorScheme: useMaterial3
              ? darkColorScheme ?? _defaultDarkColorScheme
              : _defaultDarkColorScheme,
          useMaterial3: useMaterial3,
        ),
        themeMode: ref.watch(themeModeProvider),
      );
    });
  }
}
