import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the Theme setting: system, light or dark.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Provider for the Material3 setting: true or false.
final material3Provider = StateProvider<bool>((ref) => false);

/// Show a screen with Theme settings.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final material3 = ref.watch(material3Provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(6.0, 12.0, 6.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Theme Mode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            RadioListTile(
              title: const Text('System'),
              value: ThemeMode.system,
              groupValue: themeMode,
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).state = value as ThemeMode;
              },
            ),
            RadioListTile(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: themeMode,
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).state = value as ThemeMode;
              },
            ),
            RadioListTile(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: themeMode,
                onChanged: (value) {
                  ref.read(themeModeProvider.notifier).state =
                      value as ThemeMode;
                }),
            const Text(
              'Material 3',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Switch(
                value: material3,
                onChanged: (value) {
                  ref.read(material3Provider.notifier).state = value;
                }),
          ],
        ),
      ),
    );
  }
}
